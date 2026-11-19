import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/domain/enums.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/format/phone.dart';
import '../../../core/money/money.dart';
import '../../../core/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/controls.dart';
import '../../../core/widgets/panels.dart';
import '../../../features/bootstrap/data/config_repository.dart';
import '../../../features/cart/domain/cart.dart';
import '../../../features/cart/domain/quote.dart';
import '../../../features/cart/presentation/totals_table.dart';
import '../../../features/checkout/application/idempotency.dart';
import '../../../features/menu/data/menu_repository.dart';
import '../../../features/menu/domain/menu.dart';
import '../../../features/menu/domain/option_selection.dart';
import '../../data/ops_repository.dart';
import '../../widgets/staff_ui.dart';
import 'order_detail_page.dart';
import 'orders_page.dart';

/// Builds `CreatePosOrder`. No prices: the server prices the order.
Map<String, Object?> buildPosOrderBody({
  required OrderType type,
  required PaymentMethod method,
  required List<CartLine> lines,
  String name = '',
  String phone = '',
  String table = '',
  String address = '',
  String area = '',
  String notes = '',
  bool paidNow = false,
  int? amountTendered,
}) {
  String? opt(String v) => v.trim().isEmpty ? null : v.trim();
  return {
    'orderType': type.wire,
    'paymentMethod': method.wire,
    'items': [for (final l in lines) l.toCartItemInput()],
    'customerName': ?opt(name),
    'customerPhone': ?(opt(phone) == null ? null : normalizePhoneInput(phone)),
    if (type == OrderType.dineIn) 'tableRef': ?opt(table),
    if (type == OrderType.delivery) 'delivery': {'addressLine': address.trim(), 'area': ?opt(area)},
    'notes': ?opt(notes),
    if (paidNow) 'paymentCollected': true,
    if (paidNow && amountTendered != null) 'amountTendered': amountTendered,
  };
}

/// Counter / phone order taken by a cashier or manager.
class PosPage extends ConsumerStatefulWidget {
  const PosPage({super.key, required this.branchId});

  final String branchId;

  @override
  ConsumerState<PosPage> createState() => _PosPageState();
}

class _PosPageState extends ConsumerState<PosPage> {
  List<CartLine> _lines = const [];
  OrderType _type = OrderType.counterPos;
  PaymentMethod? _method;
  bool _paidNow = false;
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _table = TextEditingController();
  final _address = TextEditingController();
  final _area = TextEditingController();
  final _notes = TextEditingController();
  final _tendered = TextEditingController();
  final _search = TextEditingController();
  final _form = GlobalKey<FormState>();
  Quote? _quote;
  Object? _quoteError;
  bool _quoting = false;
  bool _placing = false;
  Timer? _debounce;
  int _quoteSeq = 0;

  @override
  void dispose() {
    _debounce?.cancel();
    for (final c in [_name, _phone, _table, _address, _area, _notes, _tendered, _search]) {
      c.dispose();
    }
    super.dispose();
  }

  /// Lets the ticket panel (a separate widget) update this state.
  void update(VoidCallback fn) => setState(fn);

  List<PaymentMethod> _methods() =>
      ref.read(clientConfigProvider).value?.paymentMethodsFor(_type) ??
      const [PaymentMethod.cash, PaymentMethod.cardAtCounter];

  PaymentMethod? get _effectiveMethod {
    final allowed = _methods();
    if (_method != null && allowed.contains(_method)) return _method;
    return allowed.isEmpty ? null : allowed.first;
  }

  void _requote() {
    _debounce?.cancel();
    if (_lines.isEmpty) {
      setState(() {
        _quote = null;
        _quoteError = null;
      });
      return;
    }
    setState(() => _quoting = true);
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      final seq = ++_quoteSeq;
      try {
        final q = await ref
            .read(menuRepositoryProvider)
            .quote(
              branchId: widget.branchId,
              orderType: _type,
              paymentMethod: _effectiveMethod,
              lines: _lines,
            );
        if (!mounted || seq != _quoteSeq) return;
        setState(() {
          _quote = q;
          _quoteError = null;
          _quoting = false;
        });
      } catch (e) {
        if (!mounted || seq != _quoteSeq) return;
        setState(() {
          _quoteError = e;
          _quoting = false;
        });
      }
    });
  }

  void _setLines(List<CartLine> next) {
    setState(() => _lines = next);
    _requote();
  }

  Future<void> _add(MenuItem item) async {
    if (!item.isAvailable) return;
    if (!item.hasOptions) {
      unawaited(HapticFeedback.selectionClick());
      _setLines(
        _lines.addLine(
          CartLine(
            lineId: const Uuid().v4(),
            menuItemId: item.id,
            name: item.name,
            unitPrice: item.price,
            quantity: 1,
          ),
        ),
      );
      return;
    }
    final line = await showModalBottomSheet<CartLine>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _OptionsSheet(itemId: item.id, branchId: widget.branchId),
    );
    if (line != null) _setLines(_lines.addLine(line));
  }

  Future<void> _place() async {
    if (_placing) return;
    final method = _effectiveMethod;
    if (method == null || _lines.isEmpty) return;
    if (!(_form.currentState?.validate() ?? true)) return;
    final body = buildPosOrderBody(
      type: _type,
      method: method,
      lines: _lines,
      name: _name.text,
      phone: _phone.text,
      table: _table.text,
      address: _address.text,
      area: _area.text,
      notes: _notes.text,
      paidNow: _paidNow,
      amountTendered: method == PaymentMethod.cash ? parseRupees(_tendered.text) : null,
    );
    setState(() => _placing = true);
    final keys = IdempotencyKeys(ref.read(sharedPreferencesProvider));
    final key = await keys.keyFor(body);
    try {
      final r = await ref
          .read(opsRepositoryProvider)
          .createPosOrder(widget.branchId, body: body, idempotencyKey: key);
      await keys.complete();
      ref.invalidate(ordersProvider);
      if (!mounted) return;
      final change = r.data.changeDue;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Order ${r.data.order.orderNumber} placed'),
          content: Text(
            change != null && change > 0
                ? 'Give ${Money(change).format()} change.'
                : '${r.data.order.type.label} · ${Money(r.data.order.totals.total).format()}',
          ),
          actions: [FilledButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
        ),
      );
      if (!mounted) return;
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => OrderDetailPage(branchId: widget.branchId, orderId: r.data.order.id),
        ),
      );
    } catch (e) {
      final f = AppFailure.from(e);
      final unknown = f is NetworkFailure || (f is ApiFailure && f.isServerError);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 6),
          content: Text(
            unknown
                ? '${f.userMessage} The order may have been created. Tap Place order again: it will not be duplicated.'
                : 'Not placed. ${f.userMessage}',
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _placing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final menu = ref.watch(menuProvider(widget.branchId));
    final tablet = Breakpoints.isTablet(context);
    final picker = _MenuPicker(
      menu: menu,
      search: _search,
      onSearch: () => setState(() {}),
      onAdd: _add,
      onRetry: () => ref.invalidate(menuProvider(widget.branchId)),
    );
    final ticket = _Ticket(state: this);
    return Scaffold(
      appBar: AppBar(title: const Text('New order')),
      body: tablet
          ? Row(
              children: [
                Expanded(flex: 3, child: picker),
                const VerticalDivider(width: 1),
                Expanded(flex: 2, child: ticket),
              ],
            )
          : DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      const Tab(text: 'Menu'),
                      Tab(text: _lines.isEmpty ? 'Order' : 'Order (${_lines.itemCount})'),
                    ],
                  ),
                  Expanded(child: TabBarView(children: [picker, ticket])),
                ],
              ),
            ),
    );
  }
}

class _MenuPicker extends StatelessWidget {
  const _MenuPicker({
    required this.menu,
    required this.search,
    required this.onSearch,
    required this.onAdd,
    required this.onRetry,
  });

  final AsyncValue<MenuResponse> menu;
  final TextEditingController search;
  final VoidCallback onSearch;
  final ValueChanged<MenuItem> onAdd;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Space.x3),
          child: TextField(
            controller: search,
            onChanged: (_) => onSearch(),
            decoration: const InputDecoration(
              hintText: 'Search dishes',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(Icons.search_rounded, semanticLabel: 'Search dishes'),
            ),
          ),
        ),
        Expanded(
          child: AsyncBody(
            value: menu,
            onRetry: onRetry,
            errorTitle: 'Couldn’t load the menu',
            data: (m) {
              final q = search.text.trim().toLowerCase();
              final items = m.items
                  .where(
                    (i) =>
                        q.isEmpty ||
                        i.name.toLowerCase().contains(q) ||
                        i.categoryName.toLowerCase().contains(q),
                  )
                  .toList();
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, i) {
                  final item = items[i];
                  return ListTile(
                    enabled: item.isAvailable,
                    title: Text(item.name),
                    subtitle: Text(
                      '${item.categoryName}${item.hasOptions ? ' · options' : ''}${item.isAvailable ? '' : ' · sold out'}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(item.priceMoney.format(), style: t.labelMedium),
                        const SizedBox(width: Space.x2),
                        Icon(
                          item.hasOptions ? Icons.tune_rounded : Icons.add_circle_outline_rounded,
                          color: c.cream200,
                        ),
                      ],
                    ),
                    onTap: () => onAdd(item),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Ticket extends ConsumerWidget {
  const _Ticket({required this.state});

  final _PosPageState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = state;
    final t = Theme.of(context).textTheme;
    final methods = s._methods();
    final method = s._effectiveMethod;
    final q = s._quote;
    final blocker = s._lines.isEmpty
        ? 'Add items from the menu.'
        : s._quoteError != null
        ? 'Couldn’t price the order. Check the connection.'
        : s._quoting || q == null
        ? 'Updating totals…'
        : q.issues.isNotEmpty
        ? q.issues.first.message
        : (!q.meetsMinimum && s._type == OrderType.delivery)
        ? 'Below the delivery minimum (${Money(q.minDeliveryOrder).format()}).'
        : method == null
        ? 'No payment method for this order type.'
        : null;
    final tendered = parseRupees(s._tendered.text);
    final change = q != null && tendered != null ? tendered - q.totals.total : null;

    return Form(
      key: s._form,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(Space.gutter),
              children: [
                Wrap(
                  spacing: Space.x2,
                  runSpacing: Space.x2,
                  children: [
                    for (final type in [
                      OrderType.counterPos,
                      OrderType.dineIn,
                      OrderType.pickup,
                      OrderType.delivery,
                    ])
                      ChoiceChip(
                        label: Text(type == OrderType.counterPos ? 'Counter' : type.label),
                        selected: s._type == type,
                        onSelected: (_) {
                          s.update(() => s._type = type);
                          s._requote();
                        },
                      ),
                  ],
                ),
                const SizedBox(height: Space.x4),
                if (s._lines.isEmpty)
                  Text('No items yet.', style: t.bodyMedium)
                else
                  for (var i = 0; i < s._lines.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: Space.x2),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(s._lines[i].name, style: t.titleSmall),
                                if (s._lines[i].options.isNotEmpty)
                                  Text(s._lines[i].options.map((o) => o.name).join(', '), style: t.bodySmall),
                                if (q?.issueForIndex(i) case final issue?)
                                  Text(
                                    issue.message,
                                    style: t.bodySmall?.copyWith(color: context.colors.danger500),
                                  ),
                              ],
                            ),
                          ),
                          QuantityStepper(
                            value: s._lines[i].quantity,
                            min: 0,
                            compact: true,
                            itemName: s._lines[i].name,
                            onChanged: (n) => s._setLines(s._lines.setQuantity(s._lines[i].lineId, n)),
                          ),
                        ],
                      ),
                    ),
                const SizedBox(height: Space.x3),
                if (q != null)
                  TotalsTable(
                    totals: q.totals,
                    paymentMethod: method,
                    updating: s._quoting,
                    orderType: s._type,
                  ),
                if (s._quoteError != null)
                  InlineNotice(
                    tone: PanelTone.warning,
                    message: AppFailure.from(s._quoteError!).userMessage,
                    actionLabel: 'Try again',
                    onAction: s._requote,
                  ),
                const SizedBox(height: Space.x4),
                Text('Payment', style: t.titleSmall),
                RadioGroup<PaymentMethod>(
                  groupValue: method,
                  onChanged: (m) {
                    s.update(() => s._method = m);
                    s._requote();
                  },
                  child: Column(
                    children: [
                      for (final m in methods)
                        RadioListTile<PaymentMethod>(
                          value: m,
                          title: Text(m.label),
                          contentPadding: EdgeInsets.zero,
                        ),
                    ],
                  ),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Paid now'),
                  subtitle: const Text('Record the payment as received'),
                  value: s._paidNow,
                  onChanged: (v) => s.update(() => s._paidNow = v),
                ),
                if (s._paidNow && method == PaymentMethod.cash) ...[
                  RupeeField(
                    controller: s._tendered,
                    label: 'Cash received',
                    optional: true,
                    onChanged: (_) => s.update(() {}),
                  ),
                  if (change != null)
                    KeyValue(
                      change >= 0 ? 'Change to give' : 'Short by',
                      money(change.abs()),
                      emphasis: true,
                    ),
                ],
                const SizedBox(height: Space.x4),
                Text('Customer (optional for counter orders)', style: t.titleSmall),
                const SizedBox(height: Space.x2),
                TextFormField(
                  controller: s._name,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: Space.x3),
                TextFormField(
                  controller: s._phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Mobile number',
                    hintText: 'e.g. 0300 1234567',
                  ),
                  validator: (v) {
                    final required = s._type == OrderType.delivery;
                    if ((v ?? '').trim().isEmpty) return required ? 'Needed for delivery' : null;
                    return isValidPakMobile(v!) ? null : 'Enter a number like 03001234567';
                  },
                ),
                if (s._type == OrderType.dineIn) ...[
                  const SizedBox(height: Space.x3),
                  TextFormField(
                    controller: s._table,
                    decoration: const InputDecoration(labelText: 'Table'),
                  ),
                ],
                if (s._type == OrderType.delivery) ...[
                  const SizedBox(height: Space.x3),
                  TextFormField(
                    controller: s._address,
                    decoration: const InputDecoration(labelText: 'Delivery address'),
                    validator: (v) => (v ?? '').trim().length < 5 ? 'Enter the full address' : null,
                  ),
                  const SizedBox(height: Space.x3),
                  TextFormField(
                    controller: s._area,
                    decoration: const InputDecoration(labelText: 'Area (optional)'),
                  ),
                ],
                const SizedBox(height: Space.x3),
                TextFormField(
                  controller: s._notes,
                  maxLength: 500,
                  decoration: const InputDecoration(labelText: 'Notes (optional)'),
                ),
              ],
            ),
          ),
          BottomActionBar(
            above: blocker == null ? null : Text(blocker, textAlign: TextAlign.center, style: t.bodySmall),
            child: LoadingButton(
              label: q == null ? 'Place order' : 'Place order · ${q.totals.totalMoney.format()}',
              loading: s._placing,
              loadingLabel: 'Placing order',
              onPressed: blocker == null ? s._place : null,
            ),
          ),
        ],
      ),
    );
  }
}

/// Option picker for POS, using the same rules as the customer app.
class _OptionsSheet extends ConsumerStatefulWidget {
  const _OptionsSheet({required this.itemId, required this.branchId});

  final String itemId;
  final String branchId;

  @override
  ConsumerState<_OptionsSheet> createState() => _OptionsSheetState();
}

class _OptionsSheetState extends ConsumerState<_OptionsSheet> {
  OptionSelection? _sel;

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(menuItemDetailProvider((itemId: widget.itemId, branchId: widget.branchId)));
    final t = Theme.of(context).textTheme;
    return FractionallySizedBox(
      heightFactor: 0.85,
      child: AsyncBody(
        value: detail,
        onRetry: () =>
            ref.invalidate(menuItemDetailProvider((itemId: widget.itemId, branchId: widget.branchId))),
        data: (item) {
          final sel = _sel ??= OptionSelection.initial(item);
          final reason = sel.blockingReason;
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
                  children: [
                    Text(item.name, style: t.headlineSmall),
                    for (final g in item.orderedGroups) ...[
                      const SizedBox(height: Space.x4),
                      Text('${g.name} · ${g.ruleLabel}', style: t.titleSmall),
                      for (final o in g.activeOptions)
                        CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          value: sel.isSelected(g, o),
                          title: Text(o.name),
                          secondary: o.priceDelta > 0 ? Text('+${Money(o.priceDelta).format()}') : null,
                          onChanged: sel.isSelected(g, o) || g.isSingleChoice || sel.canAddMore(g)
                              ? (_) => setState(() => _sel = sel.toggle(g, o))
                              : null,
                        ),
                    ],
                  ],
                ),
              ),
              BottomActionBar(
                above: reason == null ? null : Text(reason, textAlign: TextAlign.center, style: t.bodySmall),
                child: FilledButton(
                  onPressed: reason == null
                      ? () => Navigator.pop(
                          context,
                          CartLine(
                            lineId: const Uuid().v4(),
                            menuItemId: item.id,
                            name: item.name,
                            unitPrice: item.price,
                            quantity: 1,
                            options: sel.cartOptions,
                          ),
                        )
                      : null,
                  child: Text('Add · ${sel.unitEstimate.format()}'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
