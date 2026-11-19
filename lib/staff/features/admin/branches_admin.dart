import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/pricing.dart';
import '../../../core/format/phone.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/status_badge.dart';
import '../../../features/branches/domain/branch.dart';
import '../../core/branch_scope.dart';
import '../../data/admin_repository.dart';
import '../../domain/admin_models.dart';
import '../../widgets/staff_ui.dart';

class BranchesAdminPage extends ConsumerWidget {
  const BranchesAdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(adminBranchesProvider);
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Branches')),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () async {
          final saved = await Navigator.of(context)
              .push<bool>(MaterialPageRoute(builder: (_) => const BranchEditor()));
          if (saved == true) ref.invalidate(adminBranchesProvider);
        },
        icon: const Icon(Icons.add_business_outlined),
        label: const Text('New branch'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(adminBranchesProvider.future),
        child: AsyncBody(
          value: list,
          onRetry: () => ref.invalidate(adminBranchesProvider),
          data: (items) => ListView.separated(
            padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x3, Space.gutter, 96),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: Space.x3),
            itemBuilder: (_, i) {
              final b = items[i];
              return SectionCard(
                title: b.name,
                trailing: b.isActive
                    ? StatusBadge.branch(
                        acceptingOrders: b.status.acceptingOrders,
                        isOpen: b.status.isOpen,
                        label: b.status.label,
                      )
                    : const StatusBadge(label: 'Inactive', tone: BadgeTone.danger, icon: Icons.block_rounded),
                children: [
                  Text('${b.city} · ${b.addressLine}', style: t.bodySmall),
                  Text(
                    '${b.staffCount} staff · ${b.seatingCapacity} seats · tax ${formatBps(b.taxRateCashBps)} cash / ${formatBps(b.taxRateCardBps)} card',
                    style: t.bodySmall,
                  ),
                  const SizedBox(height: Space.x2),
                  Wrap(
                    spacing: Space.x2,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          final saved = await Navigator.of(context)
                              .push<bool>(MaterialPageRoute(builder: (_) => BranchEditor(branch: b)));
                          if (saved == true) ref.invalidate(adminBranchesProvider);
                        },
                        child: const Text('Edit'),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          final saved = await Navigator.of(context)
                              .push<bool>(MaterialPageRoute(builder: (_) => HoursEditor(branch: b)));
                          if (saved == true) ref.invalidate(adminBranchesProvider);
                        },
                        child: const Text('Opening hours'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Create (`POST /admin/branches`) or update (`PATCH /admin/branches/{id}`).
class BranchEditor extends ConsumerStatefulWidget {
  const BranchEditor({super.key, this.branch});

  final BranchAdmin? branch;

  @override
  ConsumerState<BranchEditor> createState() => _BranchEditorState();
}

class _BranchEditorState extends ConsumerState<BranchEditor> {
  final _form = GlobalKey<FormState>();
  late final BranchAdmin? b = widget.branch;
  late final _name = TextEditingController(text: b?.name ?? '');
  late final _city = TextEditingController(text: b?.city ?? '');
  late final _area = TextEditingController(text: b?.area ?? '');
  late final _address = TextEditingController(text: b?.addressLine ?? '');
  late final _phone = TextEditingController(text: displayPhone(b?.phone).replaceAll(' ', ''));
  late final _email = TextEditingController(text: b?.email ?? '');
  late final _lat = TextEditingController(text: b?.latitude?.toString() ?? '');
  late final _lng = TextEditingController(text: b?.longitude?.toString() ?? '');
  late final _seats = TextEditingController(text: '${b?.seatingCapacity ?? 0}');
  late final _fee = TextEditingController(text: rupeesText(b?.deliveryFee ?? 15000));
  late final _min = TextEditingController(text: rupeesText(b?.minDeliveryOrder ?? 100000));
  late final _radius = TextEditingController(text: b?.deliveryRadiusKm?.toString() ?? '');
  late final _dMin = TextEditingController(text: '${b?.estimatedDeliveryMinutes ?? 45}');
  late final _pMin = TextEditingController(text: '${b?.estimatedPickupMinutes ?? 20}');
  late final _taxCash = TextEditingController(text: ((b?.taxRateCashBps ?? 1600) / 100).toString());
  late final _taxCard = TextEditingController(text: ((b?.taxRateCardBps ?? 500) / 100).toString());
  late final _turnover = TextEditingController(text: '${b?.avgTableTurnoverMinutes ?? 60}');
  late final _resDuration = TextEditingController(text: '${b?.reservationDurationMinutes ?? 90}');
  late bool _dineIn = b?.services.dineIn ?? true;
  late bool _pickup = b?.services.pickup ?? true;
  late bool _delivery = b?.services.delivery ?? true;
  late bool _accepts = b?.acceptsOrders ?? true;
  late bool _enforceHours = b?.enforceOpeningHours ?? true;
  late bool _active = b?.isActive ?? true;
  bool _busy = false;

  /// "16" / "7.5" (%) → basis points.
  static int? _bps(String v) {
    final d = double.tryParse(v.trim());
    if (d == null || d < 0 || d > 50) return null;
    return (d * 100).round();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _busy = true);
    double? dbl(TextEditingController c) => c.text.trim().isEmpty ? null : double.parse(c.text.trim());
    final body = <String, Object?>{
      'name': _name.text.trim(),
      'city': _city.text.trim(),
      'area': _area.text.trim().isEmpty ? null : _area.text.trim(),
      'addressLine': _address.text.trim(),
      'phone': normalizePhoneInput(_phone.text),
      'email': _email.text.trim().isEmpty ? null : _email.text.trim(),
      'latitude': dbl(_lat),
      'longitude': dbl(_lng),
      'seatingCapacity': int.parse(_seats.text),
      'dineInEnabled': _dineIn,
      'pickupEnabled': _pickup,
      'deliveryEnabled': _delivery,
      'acceptsOrders': _accepts,
      'enforceOpeningHours': _enforceHours,
      'deliveryFee': parseRupees(_fee.text),
      'minDeliveryOrder': parseRupees(_min.text),
      'deliveryRadiusKm': dbl(_radius),
      'estimatedDeliveryMinutes': int.parse(_dMin.text),
      'estimatedPickupMinutes': int.parse(_pMin.text),
      'taxRateCashBps': _bps(_taxCash.text),
      'taxRateCardBps': _bps(_taxCard.text),
      'avgTableTurnoverMinutes': int.parse(_turnover.text),
      'reservationDurationMinutes': int.parse(_resDuration.text),
      if (b != null) 'isActive': _active,
    };
    final repo = ref.read(adminRepositoryProvider);
    final ok = await runAction(
      context,
      () => b == null ? repo.createBranch(body) : repo.updateBranch(b!.id, body),
      success: b == null ? 'Branch created. Set its opening hours next.' : 'Branch saved',
    );
    if (!mounted) return;
    setState(() => _busy = false);
    if (ok) Navigator.pop(context, true);
  }

  @override
  void dispose() {
    for (final c in [
      _name,
      _city,
      _area,
      _address,
      _phone,
      _email,
      _lat,
      _lng,
      _seats,
      _fee,
      _min,
      _radius,
      _dMin,
      _pMin,
      _taxCash,
      _taxCard,
      _turnover,
      _resDuration,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    String? latLng(String? v, double limit) {
      if ((v ?? '').trim().isEmpty) return null;
      final d = double.tryParse(v!.trim());
      return d == null || d.abs() > limit ? 'Enter a value between −$limit and $limit' : null;
    }

    String? pct(String? v) => _bps(v ?? '') == null ? 'Enter a percentage like 16 or 7.5' : null;
    const gap = SizedBox(height: Space.x3);
    return Scaffold(
      appBar: AppBar(title: Text(b == null ? 'New branch' : 'Edit branch')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: [
            Text('Details', style: t.titleSmall),
            gap,
            TextFormField(
              controller: _name,
              maxLength: 120,
              decoration: const InputDecoration(labelText: 'Name', hintText: 'e.g. Ox & Grill Bahria Town'),
              validator: (v) => (v ?? '').trim().length < 2 ? 'Required' : null,
            ),
            TextFormField(
              controller: _city,
              decoration: const InputDecoration(labelText: 'City'),
              validator: (v) => (v ?? '').trim().length < 2 ? 'Required' : null,
            ),
            gap,
            TextFormField(
              controller: _area,
              decoration: const InputDecoration(labelText: 'Area (optional)'),
            ),
            gap,
            TextFormField(
              controller: _address,
              maxLength: 300,
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (v) => (v ?? '').trim().length < 5 ? 'Enter the full address' : null,
            ),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone'),
              validator: (v) => (v ?? '').trim().length < 7 ? 'Enter the branch phone' : null,
            ),
            gap,
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email (optional)'),
            ),
            gap,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _lat,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                    decoration: const InputDecoration(labelText: 'Latitude'),
                    validator: (v) => latLng(v, 90),
                  ),
                ),
                const SizedBox(width: Space.x3),
                Expanded(
                  child: TextFormField(
                    controller: _lng,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                    decoration: const InputDecoration(labelText: 'Longitude'),
                    validator: (v) => latLng(v, 180),
                  ),
                ),
              ],
            ),
            gap,
            IntField(controller: _seats, label: 'Seating capacity', max: 5000),
            const Divider(height: Space.x8),
            Text('Ordering', style: t.titleSmall),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Accepts online orders'),
              value: _accepts,
              onChanged: (v) => setState(() => _accepts = v),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Only during opening hours'),
              value: _enforceHours,
              onChanged: (v) => setState(() => _enforceHours = v),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Delivery'),
              value: _delivery,
              onChanged: (v) => setState(() => _delivery = v),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Pickup'),
              value: _pickup,
              onChanged: (v) => setState(() => _pickup = v),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Dine-in'),
              value: _dineIn,
              onChanged: (v) => setState(() => _dineIn = v),
            ),
            gap,
            RupeeField(controller: _fee, label: 'Delivery fee'),
            gap,
            RupeeField(controller: _min, label: 'Minimum delivery order'),
            gap,
            TextFormField(
              controller: _radius,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Delivery radius (km, optional)'),
            ),
            gap,
            IntField(controller: _dMin, label: 'Delivery time', min: 5, max: 240, suffix: 'min'),
            gap,
            IntField(controller: _pMin, label: 'Pickup time', min: 5, max: 240, suffix: 'min'),
            const Divider(height: Space.x8),
            Text('Tax', style: t.titleSmall),
            gap,
            TextFormField(
              controller: _taxCash,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Tax on cash / COD', suffixText: '%'),
              validator: pct,
            ),
            gap,
            TextFormField(
              controller: _taxCard,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Tax on card / online', suffixText: '%'),
              validator: pct,
            ),
            const Divider(height: Space.x8),
            Text('Tables', style: t.titleSmall),
            gap,
            IntField(
              controller: _turnover,
              label: 'Average table turnover',
              min: 10,
              max: 480,
              suffix: 'min',
            ),
            gap,
            IntField(controller: _resDuration, label: 'Reservation length', min: 30, max: 480, suffix: 'min'),
            if (b != null) ...[
              const Divider(height: Space.x8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Branch active'),
                subtitle: const Text('Inactive branches are hidden from customers'),
                value: _active,
                onChanged: (v) => setState(() => _active = v),
              ),
              if (!_active)
                const InlineNotice(
                  tone: PanelTone.warning,
                  message: 'Saving will hide this branch from the app and website.',
                ),
            ],
            const SizedBox(height: Space.x6),
            FilledButton(
              onPressed: _busy ? null : _save,
              child: Text(b == null ? 'Create branch' : 'Save branch'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Weekly opening hours (`PUT /admin/branches/{id}/hours`).
class HoursEditor extends ConsumerStatefulWidget {
  const HoursEditor({super.key, required this.branch});

  final BranchAdmin branch;

  @override
  ConsumerState<HoursEditor> createState() => _HoursEditorState();
}

class _HoursEditorState extends ConsumerState<HoursEditor> {
  static const _days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  late List<BranchHours> _hours = [
    for (var d = 0; d < 7; d++)
      widget.branch.hours.where((h) => h.dayOfWeek == d).firstOrNull ??
          BranchHours(dayOfWeek: d, opensAt: '12:00', closesAt: '00:00'),
  ];
  bool _busy = false;

  TimeOfDay _parse(String hhmm) =>
      TimeOfDay(hour: int.parse(hhmm.split(':')[0]), minute: int.parse(hhmm.split(':')[1]));
  String _fmt(TimeOfDay t) => '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  Future<void> _pick(int day, {required bool opens}) async {
    final h = _hours[day];
    final t = await showTimePicker(context: context, initialTime: _parse(opens ? h.opensAt : h.closesAt));
    if (t == null) return;
    setState(() {
      _hours = [...(_hours..[day] = opens ? h.copyWith(opensAt: _fmt(t)) : h.copyWith(closesAt: _fmt(t)))];
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Hours · ${widget.branch.name}')),
      body: ListView(
        padding: const EdgeInsets.all(Space.gutter),
        children: [
          Text(
            'Restaurant time. A closing time at or before opening means past midnight.',
            style: t.bodySmall,
          ),
          const SizedBox(height: Space.x3),
          for (var d = 0; d < 7; d++)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.x2),
              child: SectionCard(
                title: _days[d],
                trailing: Switch(
                  value: !_hours[d].isClosed,
                  onChanged: (open) =>
                      setState(() => _hours = [...(_hours..[d] = _hours[d].copyWith(isClosed: !open))]),
                ),
                children: [
                  if (_hours[d].isClosed)
                    Text('Closed', style: t.bodyMedium?.copyWith(color: context.colors.danger500))
                  else
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _pick(d, opens: true),
                            child: Text('Opens ${_hours[d].opensAt}'),
                          ),
                        ),
                        const SizedBox(width: Space.x2),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _pick(d, opens: false),
                            child: Text('Closes ${_hours[d].closesAt}'),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          const SizedBox(height: Space.x4),
          FilledButton(
            onPressed: _busy
                ? null
                : () async {
                    setState(() => _busy = true);
                    final ok = await runAction(
                      context,
                      () => ref.read(adminRepositoryProvider).replaceHours(widget.branch.id, _hours),
                      success: 'Hours saved',
                    );
                    if (!context.mounted) return;
                    setState(() => _busy = false);
                    if (ok) Navigator.pop(context, true);
                  },
            child: const Text('Save hours'),
          ),
        ],
      ),
    );
  }
}
