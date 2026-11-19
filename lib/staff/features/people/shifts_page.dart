import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/panels.dart';
import '../../core/branch_scope.dart';
import '../../core/permissions.dart';
import '../../core/session.dart';
import '../../data/people_repository.dart';
import '../../domain/ops_models.dart';
import '../../widgets/staff_ui.dart';

final currentShiftProvider = FutureProvider.autoDispose.family<Shift?, String>(
  (ref, branchId) => ref.watch(peopleRepositoryProvider).currentShift(branchId),
);

final shiftHistoryProvider = FutureProvider.autoDispose.family<List<Shift>, String>(
  (ref, branchId) async => (await ref.watch(peopleRepositoryProvider).shifts(branchId)).items,
);

/// Cash drawer shift: open with a float, close with counted cash (variance shown).
class ShiftsPage extends ConsumerWidget {
  const ShiftsPage({super.key});

  Future<void> _open(BuildContext context, WidgetRef ref, String branchId) async {
    final float = TextEditingController(text: '0');
    final form = GlobalKey<FormState>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Open shift'),
        content: Form(
          key: form,
          child: RupeeField(controller: float, label: 'Opening cash float', helper: 'Cash in the drawer now'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => form.currentState!.validate() ? Navigator.pop(context, true) : null,
            child: const Text('Open'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await runAction(
      context,
      () =>
          ref.read(peopleRepositoryProvider).openShift(branchId, openingFloat: parseRupees(float.text) ?? 0),
      success: 'Shift opened',
    );
    ref.invalidate(currentShiftProvider(branchId));
  }

  Future<void> _close(BuildContext context, WidgetRef ref, String branchId, Shift shift) async {
    final counted = TextEditingController();
    final notes = TextEditingController();
    final form = GlobalKey<FormState>();
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          final c = parseRupees(counted.text);
          final expected = shift.expectedCash;
          final variance = c != null && expected != null ? c - expected : null;
          return AlertDialog(
            title: const Text('Close shift'),
            content: Form(
              key: form,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (expected != null) KeyValue('Expected cash', money(expected), emphasis: true),
                    const SizedBox(height: Space.x3),
                    RupeeField(controller: counted, label: 'Counted cash', onChanged: (_) => setState(() {})),
                    if (variance != null)
                      KeyValue(
                        variance == 0 ? 'Balanced' : (variance > 0 ? 'Over by' : 'Short by'),
                        money(variance.abs()),
                        emphasis: true,
                      ),
                    const SizedBox(height: Space.x3),
                    TextFormField(
                      controller: notes,
                      maxLength: 500,
                      decoration: const InputDecoration(labelText: 'Notes (optional)'),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
              FilledButton(
                onPressed: () => form.currentState!.validate() ? Navigator.pop(context, true) : null,
                child: const Text('Close shift'),
              ),
            ],
          );
        },
      ),
    );
    if (ok != true || !context.mounted) return;
    await runAction(
      context,
      () => ref
          .read(peopleRepositoryProvider)
          .closeShift(branchId, shift.id, countedCash: parseRupees(counted.text)!, notes: notes.text),
      success: 'Shift closed',
    );
    ref
      ..invalidate(currentShiftProvider(branchId))
      ..invalidate(shiftHistoryProvider(branchId));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchId = ref.watch(activeBranchProvider);
    final session = ref.watch(sessionProvider).value!;
    if (branchId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Shift'), actions: const [BranchChip(allowAll: false)]),
        body: const NeedsBranch(),
      );
    }
    final current = ref.watch(currentShiftProvider(branchId));
    final history = ref.watch(shiftHistoryProvider(branchId));
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Shift'), actions: const [BranchChip(allowAll: false)]),
      body: RefreshIndicator(
        onRefresh: () async {
          ref
            ..invalidate(currentShiftProvider(branchId))
            ..invalidate(shiftHistoryProvider(branchId));
        },
        child: ListView(
          padding: const EdgeInsets.all(Space.gutter),
          children: [
            AsyncBody(
              value: current,
              skeletonRows: 1,
              inList: true,
              onRetry: () => ref.invalidate(currentShiftProvider(branchId)),
              data: (shift) => shift == null
                  ? SectionCard(
                      title: 'No open shift',
                      children: [
                        Text(
                          'Open a shift before taking cash so the drawer can be reconciled.',
                          style: t.bodyMedium,
                        ),
                        const SizedBox(height: Space.x3),
                        FilledButton.icon(
                          onPressed: () => _open(context, ref, branchId),
                          icon: const Icon(Icons.lock_open_rounded),
                          label: const Text('Open shift'),
                        ),
                      ],
                    )
                  : _ShiftCard(shift: shift, onClose: () => _close(context, ref, branchId, shift)),
            ),
            const SizedBox(height: Space.x6),
            Text(
              session.role == StaffRole.cashier ? 'My past shifts' : 'Shift history',
              style: t.titleMedium,
            ),
            const SizedBox(height: Space.x3),
            AsyncBody(
              value: history,
              skeletonRows: 2,
              inList: true,
              onRetry: () => ref.invalidate(shiftHistoryProvider(branchId)),
              data: (list) => Column(
                children: [
                  if (list.where((s) => !s.isOpen).isEmpty)
                    Text('No closed shifts yet.', style: t.bodyMedium),
                  for (final s in list.where((s) => !s.isOpen)) ...[
                    _ShiftCard(shift: s),
                    const SizedBox(height: Space.x3),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShiftCard extends StatelessWidget {
  const _ShiftCard({required this.shift, this.onClose});

  final Shift shift;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final s = shift.summary;
    final c = context.colors;
    final v = shift.variance;
    return SectionCard(
      title: shift.isOpen
          ? 'Open since ${formatLocalTime(shift.openedAt)}'
          : '${shortDate(shift.openedAt)} · ${formatLocalTime(shift.openedAt)}–${shift.closedAt == null ? '' : formatLocalTime(shift.closedAt!)}',
      children: [
        if (shift.staffName != null) KeyValue('Cashier', shift.staffName!),
        KeyValue('Orders', '${s.orderCount} (${s.cancelledCount} cancelled)'),
        KeyValue('Sales', money(s.salesTotal)),
        KeyValue('Cash', money(s.cashTotal)),
        KeyValue('Card', money(s.cardTotal)),
        KeyValue('Cash on delivery', money(s.codTotal)),
        if (s.onlineTotal > 0) KeyValue('Online', money(s.onlineTotal)),
        KeyValue('Opening float', money(shift.openingFloat)),
        if (shift.expectedCash != null) KeyValue('Expected cash', money(shift.expectedCash!), emphasis: true),
        if (shift.countedCash != null) KeyValue('Counted', money(shift.countedCash!)),
        if (v != null)
          Padding(
            padding: const EdgeInsets.only(top: Space.x2),
            child: InlineNotice(
              tone: v == 0 ? PanelTone.neutral : PanelTone.warning,
              icon: v == 0 ? Icons.check_circle_outline_rounded : Icons.warning_amber_rounded,
              message: v == 0 ? 'Drawer balanced' : '${v > 0 ? 'Over' : 'Short'} by ${money(v.abs())}',
            ),
          ),
        if (shift.notes != null) Text('Note: ${shift.notes}', style: Theme.of(context).textTheme.bodySmall),
        if (onClose != null) ...[
          const SizedBox(height: Space.x3),
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: c.ink950),
            onPressed: onClose,
            icon: const Icon(Icons.lock_rounded),
            label: const Text('Close shift and count cash'),
          ),
        ],
      ],
    );
  }
}
