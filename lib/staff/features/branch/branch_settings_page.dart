import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/pricing.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/status_badge.dart';
import '../../core/branch_scope.dart';
import '../../data/ops_repository.dart';
import '../../domain/admin_models.dart';
import '../../widgets/staff_ui.dart';

final branchSettingsProvider = FutureProvider.autoDispose.family<BranchAdmin, String>(
  (ref, branchId) => ref.watch(opsRepositoryProvider).settings(branchId),
);

/// Operational settings a manager may change (`PATCH /branches/{b}/settings`):
/// pause online orders, services, fees, preparation times.
class BranchSettingsPage extends ConsumerWidget {
  const BranchSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchId = ref.watch(activeBranchProvider);
    if (branchId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Branch settings'), actions: const [BranchChip(allowAll: false)]),
        body: const NeedsBranch(),
      );
    }
    final s = ref.watch(branchSettingsProvider(branchId));
    return Scaffold(
      appBar: AppBar(title: const Text('Branch settings'), actions: const [BranchChip(allowAll: false)]),
      body: AsyncBody(
        value: s,
        onRetry: () => ref.invalidate(branchSettingsProvider(branchId)),
        data: (b) => BranchOpsForm(branch: b, key: ValueKey(b.id)),
      ),
    );
  }
}

class BranchOpsForm extends ConsumerStatefulWidget {
  const BranchOpsForm({super.key, required this.branch});

  final BranchAdmin branch;

  @override
  ConsumerState<BranchOpsForm> createState() => _BranchOpsFormState();
}

class _BranchOpsFormState extends ConsumerState<BranchOpsForm> {
  final _form = GlobalKey<FormState>();
  late bool _accepts = widget.branch.acceptsOrders;
  late bool _dineIn = widget.branch.services.dineIn;
  late bool _pickup = widget.branch.services.pickup;
  late bool _delivery = widget.branch.services.delivery;
  late final _fee = TextEditingController(text: rupeesText(widget.branch.deliveryFee));
  late final _min = TextEditingController(text: rupeesText(widget.branch.minDeliveryOrder));
  late final _deliveryMin = TextEditingController(text: '${widget.branch.estimatedDeliveryMinutes}');
  late final _pickupMin = TextEditingController(text: '${widget.branch.estimatedPickupMinutes}');
  bool _busy = false;

  @override
  void dispose() {
    for (final c in [_fee, _min, _deliveryMin, _pickupMin]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _busy = true);
    await runAction(
      context,
      () => ref.read(opsRepositoryProvider).updateSettings(widget.branch.id, {
        'acceptsOrders': _accepts,
        'dineInEnabled': _dineIn,
        'pickupEnabled': _pickup,
        'deliveryEnabled': _delivery,
        'deliveryFee': parseRupees(_fee.text),
        'minDeliveryOrder': parseRupees(_min.text),
        'estimatedDeliveryMinutes': int.parse(_deliveryMin.text),
        'estimatedPickupMinutes': int.parse(_pickupMin.text),
      }),
      success: 'Branch settings saved',
    );
    ref.invalidate(branchSettingsProvider(widget.branch.id));
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final b = widget.branch;
    final t = Theme.of(context).textTheme;
    return Form(
      key: _form,
      child: ListView(
        padding: const EdgeInsets.all(Space.gutter),
        children: [
          Text(b.name, style: t.headlineSmall),
          const SizedBox(height: Space.x2),
          Align(
            alignment: Alignment.centerLeft,
            child: StatusBadge.branch(
              acceptingOrders: b.status.acceptingOrders,
              isOpen: b.status.isOpen,
              label: b.status.label,
            ),
          ),
          const SizedBox(height: Space.x4),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Accept online orders'),
            subtitle: const Text('Turn off to pause app and website orders (e.g. kitchen overloaded)'),
            value: _accepts,
            onChanged: (v) => setState(() => _accepts = v),
          ),
          if (!_accepts)
            const InlineNotice(
              tone: PanelTone.warning,
              message: 'Customers will see the branch as not accepting orders.',
            ),
          const Divider(height: Space.x8),
          Text('Services', style: t.titleSmall),
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
          const Divider(height: Space.x8),
          Text('Delivery', style: t.titleSmall),
          const SizedBox(height: Space.x3),
          RupeeField(controller: _fee, label: 'Delivery fee'),
          const SizedBox(height: Space.x3),
          RupeeField(controller: _min, label: 'Minimum delivery order'),
          const SizedBox(height: Space.x3),
          IntField(
            controller: _deliveryMin,
            label: 'Estimated delivery time',
            min: 5,
            max: 240,
            suffix: 'min',
          ),
          const SizedBox(height: Space.x3),
          IntField(controller: _pickupMin, label: 'Estimated pickup time', min: 5, max: 240, suffix: 'min'),
          const Divider(height: Space.x8),
          Text('Set by the owner', style: t.titleSmall),
          const SizedBox(height: Space.x2),
          KeyValue('Tax (cash / COD)', formatBps(b.taxRateCashBps)),
          KeyValue('Tax (card / online)', formatBps(b.taxRateCardBps)),
          KeyValue('Seats', '${b.seatingCapacity}'),
          KeyValue('Staff', '${b.staffCount}'),
          const SizedBox(height: Space.x6),
          FilledButton(onPressed: _busy ? null : _save, child: const Text('Save settings')),
        ],
      ),
    );
  }
}
