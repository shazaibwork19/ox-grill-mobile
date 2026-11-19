import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/domain/enums.dart';
import '../../../core/domain/pricing.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/format/phone.dart';
import '../../../core/money/money.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/controls.dart';
import '../../../core/widgets/panels.dart';
import '../../branches/application/order_session.dart';
import '../../branches/data/branch_repository.dart';
import '../../cart/application/cart_controller.dart';
import '../../cart/application/quote_provider.dart';
import '../../cart/presentation/cart_sheet.dart';
import '../../cart/presentation/totals_table.dart';
import '../application/checkout_controller.dart';
import '../data/customer_details_store.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _area = TextEditingController();
  final _city = TextEditingController();
  final _instructions = TextEditingController();
  final _pickupName = TextEditingController();
  final _table = TextEditingController();
  final _notes = TextEditingController();
  bool _prefilled = false;

  /// Field errors from a 400 reply, keyed by request path.
  Map<String, String> _serverErrors = const {};

  @override
  void initState() {
    super.initState();
    // A previous failed attempt should not show its error on a fresh visit.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(checkoutControllerProvider) is! CheckoutSubmitting) {
        ref.read(checkoutControllerProvider.notifier).reset();
      }
    });
  }

  @override
  void dispose() {
    for (final c in [_name, _phone, _address, _area, _city, _instructions, _pickupName, _table, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  void _prefill(CustomerDetails d, String? branchCity) {
    if (_prefilled) return;
    _prefilled = true;
    _name.text = d.name;
    _phone.text = d.phone;
    _address.text = d.addressLine;
    _area.text = d.area;
    _city.text = d.city.isNotEmpty ? d.city : (branchCity ?? '');
    _instructions.text = d.instructions;
  }

  CheckoutForm get _form => CheckoutForm(
    name: _name.text,
    phone: _phone.text,
    addressLine: _address.text,
    area: _area.text,
    city: _city.text,
    instructions: _instructions.text,
    pickupName: _pickupName.text,
    tableRef: _table.text,
    notes: _notes.text,
  );

  Future<void> _submit() async {
    setState(() => _serverErrors = const {});
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final method = ref.read(selectedPaymentMethodProvider);
    if (method == null) return;
    unawaited(HapticFeedback.lightImpact());
    await ref.read(checkoutControllerProvider.notifier).submit(paymentMethod: method, form: _form);
  }

  String? _server(String path) => _serverErrors[path];

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(orderSessionProvider);
    final lines = ref.watch(cartProvider);
    final checkout = ref.watch(checkoutControllerProvider);

    ref.listen(checkoutControllerProvider, (_, next) {
      if (next is CheckoutPlaced) {
        final token = next.result.trackingToken;
        if (token != null) {
          context.go(Routes.track(token));
        } else {
          context.go(Routes.orders);
        }
      } else if (next is CheckoutFailed) {
        final f = next.failure;
        if (f is ApiFailure) {
          setState(() {
            _serverErrors = {
              for (final d in f.details) d.path.replaceFirst(RegExp(r'^body\.'), ''): d.message,
            };
          });
          _formKey.currentState?.validate();
          if (f.code == 'ITEM_UNAVAILABLE' || f.code == 'VALIDATION_ERROR') ref.invalidate(quoteProvider);
        }
      }
    });

    if (session == null ||
        (lines.isEmpty && checkout is! CheckoutPlaced && checkout is! CheckoutSubmitting)) {
      return Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: MessagePanel(
          icon: Icons.shopping_bag_outlined,
          title: 'Your cart is empty',
          message: 'Add something from the menu to check out.',
          actionLabel: 'Back to the menu',
          onAction: () => context.go(Routes.menu),
        ),
      );
    }

    final branch = ref.watch(selectedBranchProvider).value;
    final detail = ref.watch(branchDetailProvider(session.branchId)).value;
    final details = ref.watch(customerDetailsProvider);
    if (details case AsyncData(:final value)) _prefill(value, branch?.city);

    final quote = ref.watch(quoteProvider);
    final methods = ref.watch(allowedPaymentMethodsProvider);
    final method = ref.watch(selectedPaymentMethodProvider);
    final submitting = checkout is CheckoutSubmitting;
    final blocker = methods.isEmpty
        ? 'No payment method is available for ${session.orderType.label.toLowerCase()}.'
        : checkoutBlocker(
            lines: lines,
            quote: quote,
            acceptingOrders: branch?.status.acceptingOrders ?? true,
            branchLabel: branch?.status.label,
          );
    final total = quote.value?.totals.totalMoney;
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final isDelivery = session.orderType == OrderType.delivery;

    return PopScope(
      canPop: !submitting,
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x4, Space.gutter, Space.x8),
            children: [
              if (checkout is CheckoutFailed) ...[
                _FailureBanner(state: checkout, onRetry: submitting ? null : _submit),
                const SizedBox(height: Space.x4),
              ],
              _Summary(branchName: branch?.name ?? session.branchName, orderType: session.orderType),
              const SizedBox(height: Space.x6),
              _SectionTitle('Your details'),
              TextFormField(
                controller: _name,
                enabled: !submitting,
                maxLength: 80,
                textCapitalization: TextCapitalization.words,
                autofillHints: const [AutofillHints.name],
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Full name',
                  hintText: 'e.g. Ayesha Khan',
                  counterText: '',
                  errorText: _server('contactName'),
                ),
                validator: (v) => (v ?? '').trim().length < 2 ? 'Enter your name' : null,
              ),
              const SizedBox(height: Space.x4),
              TextFormField(
                controller: _phone,
                enabled: !submitting,
                keyboardType: TextInputType.phone,
                autofillHints: const [AutofillHints.telephoneNumber],
                textInputAction: TextInputAction.next,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9+\s-]'))],
                decoration: InputDecoration(
                  labelText: 'Mobile number',
                  hintText: 'e.g. 0300 1234567',
                  helperText: 'The branch calls this number to confirm your order.',
                  errorText: _server('contactPhone'),
                ),
                validator: (v) => isValidPakMobile(v ?? '') ? null : 'Enter a mobile number like 03001234567',
              ),
              if (isDelivery) ...[
                const SizedBox(height: Space.x6),
                _SectionTitle('Delivery address'),
                TextFormField(
                  controller: _address,
                  enabled: !submitting,
                  maxLength: 300,
                  minLines: 1,
                  maxLines: 3,
                  autofillHints: const [AutofillHints.fullStreetAddress],
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'House, street and sector',
                    hintText: 'e.g. House 7, Street 12, F-7/2',
                    counterText: '',
                    errorText: _server('delivery.addressLine') ?? _server('delivery'),
                  ),
                  validator: (v) => (v ?? '').trim().length < 5
                      ? 'Enter your full address so the rider can find you'
                      : null,
                ),
                const SizedBox(height: Space.x4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _area,
                        enabled: !submitting,
                        maxLength: 120,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: 'Area (optional)',
                          hintText: 'e.g. F-7',
                          counterText: '',
                          errorText: _server('delivery.area'),
                        ),
                      ),
                    ),
                    const SizedBox(width: Space.x3),
                    Expanded(
                      child: TextFormField(
                        controller: _city,
                        enabled: !submitting,
                        maxLength: 80,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: 'City (optional)',
                          hintText: 'e.g. Islamabad',
                          counterText: '',
                          errorText: _server('delivery.city'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Space.x4),
                TextFormField(
                  controller: _instructions,
                  enabled: !submitting,
                  maxLength: 300,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    labelText: 'Instructions for the rider (optional)',
                    hintText: 'e.g. Blue gate, ring twice',
                    counterText: '',
                    errorText: _server('delivery.instructions'),
                  ),
                ),
              ],
              if (session.orderType == OrderType.pickup) ...[
                const SizedBox(height: Space.x4),
                TextFormField(
                  controller: _pickupName,
                  enabled: !submitting,
                  maxLength: 80,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Name for pickup (optional)',
                    hintText: 'If someone else collects',
                    counterText: '',
                    errorText: _server('pickupName'),
                  ),
                ),
              ],
              if (session.orderType == OrderType.dineIn) ...[
                const SizedBox(height: Space.x4),
                TextFormField(
                  controller: _table,
                  enabled: !submitting,
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: 'Table number (optional)',
                    hintText: 'e.g. 12',
                    counterText: '',
                    errorText: _server('tableRef'),
                  ),
                ),
              ],
              const SizedBox(height: Space.x4),
              TextFormField(
                controller: _notes,
                enabled: !submitting,
                maxLength: 500,
                minLines: 1,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Notes for the branch (optional)',
                  hintText: 'e.g. Please call when outside',
                  errorText: _server('notes'),
                ),
              ),
              const SizedBox(height: Space.x6),
              _SectionTitle('Payment'),
              Text('You pay when the order reaches you. Tax depends on how you pay.', style: t.bodyMedium),
              const SizedBox(height: Space.x2),
              RadioGroup<PaymentMethod>(
                groupValue: method,
                onChanged: (m) {
                  if (m != null && !submitting) ref.read(paymentChoiceProvider.notifier).choose(m);
                },
                child: Column(
                  children: [
                    for (final m in methods)
                      RadioListTile<PaymentMethod>(
                        value: m,
                        contentPadding: EdgeInsets.zero,
                        title: Text(m.label),
                        subtitle: detail == null ? null : Text('Tax ${formatBps(detail.taxRateBpsFor(m))}'),
                      ),
                  ],
                ),
              ),
              if (_server('paymentMethod') case final e?)
                Text(e, style: t.bodySmall?.copyWith(color: c.danger500)),
              const SizedBox(height: Space.x6),
              _SectionTitle('Order summary'),
              _OrderLines(),
              const SizedBox(height: Space.x3),
              if (quote.value case final q?)
                TotalsTable(
                  totals: q.totals,
                  paymentMethod: method,
                  updating: quote.isLoading,
                  orderType: session.orderType,
                )
              else
                EstimateTable(
                  subtotal: Money(lines.fold(0, (s, l) => s + l.estimatedTotal.paisa)),
                  loading: quote.isLoading,
                ),
              const SizedBox(height: Space.x4),
              Text(
                'Prices, tax and fees are confirmed by the branch when you place the order.',
                style: t.bodySmall,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomActionBar(
          above: blocker == null || submitting
              ? null
              : Text(
                  blocker,
                  textAlign: TextAlign.center,
                  style: t.bodySmall?.copyWith(color: c.cream50),
                ),
          child: LoadingButton(
            label: total == null ? 'Place order' : 'Place order · ${total.format()}',
            loadingLabel: 'Placing your order',
            loading: submitting,
            onPressed: blocker == null ? _submit : null,
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: Space.x3),
    child: Semantics(header: true, child: Text(text, style: Theme.of(context).textTheme.titleMedium)),
  );
}

class _Summary extends StatelessWidget {
  const _Summary({required this.branchName, required this.orderType});

  final String branchName;
  final OrderType orderType;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(Space.x4),
      decoration: BoxDecoration(
        color: c.ink800,
        borderRadius: Radii.cardAll,
        border: Border.all(color: c.border),
      ),
      child: Row(
        children: [
          Icon(Icons.storefront_outlined, color: c.bronze400),
          const SizedBox(width: Space.x3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orderType.label, style: t.labelSmall?.copyWith(color: c.bronze400)),
                Text(branchName, style: t.titleSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderLines extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lines = ref.watch(cartProvider);
    final quote = ref.watch(quoteProvider).value;
    final t = Theme.of(context).textTheme;
    return Column(
      children: [
        for (var i = 0; i < lines.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.x1),
            child: MergeSemantics(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 36, child: Text('${lines[i].quantity}×', style: t.labelMedium)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lines[i].name, style: t.bodyLarge),
                        if (lines[i].options.isNotEmpty)
                          Text(lines[i].options.map((o) => o.name).join(', '), style: t.bodySmall),
                      ],
                    ),
                  ),
                  Text(
                    (quote?.lineForIndex(i) != null
                            ? Money(quote!.lineForIndex(i)!.lineTotal)
                            : lines[i].estimatedTotal)
                        .format(),
                    style: t.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Explains what happened, whether the order may exist, and what to do.
class _FailureBanner extends StatelessWidget {
  const _FailureBanner({required this.state, required this.onRetry});

  final CheckoutFailed state;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final f = state.failure;
    if (state.outcomeUnknown) {
      return InlineNotice(
        tone: PanelTone.warning,
        icon: Icons.sync_problem_rounded,
        message:
            '${f.userMessage} We couldn’t confirm whether your order reached the branch. '
            'Your cart is saved. Trying again is safe: it won’t create a second order.',
        actionLabel: 'Try again',
        onAction: onRetry,
      );
    }
    final reference = f is ApiFailure && f.requestId != null ? ' (Reference: ${f.requestId})' : '';
    final message = f is ApiFailure && f.isValidation
        ? 'Some details need fixing. Check the highlighted fields.'
        : f.userMessage;
    return Semantics(
      liveRegion: true,
      child: InlineNotice(
        tone: PanelTone.danger,
        icon: Icons.error_outline_rounded,
        message: 'Your order was not placed. $message$reference',
      ),
    );
  }
}
