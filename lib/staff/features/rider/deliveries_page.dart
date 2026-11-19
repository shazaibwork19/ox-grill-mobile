import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../../core/format/phone.dart';
import '../../../core/money/money.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/launch.dart';
import '../../../core/widgets/panels.dart';
import '../../core/session.dart';
import '../../core/staff_socket.dart';
import '../../data/ops_repository.dart';
import '../../data/people_repository.dart';
import '../../domain/ops_models.dart';
import '../../widgets/staff_ui.dart';

/// What the rider can do next with an assignment (MOBILE_APP_SPEC §5.2).
enum RiderStep { accept, pickUp, waitingForKitchen, delivered, complete, done }

RiderStep riderStep(DeliveryAssignment a) {
  if (a.orderStatus == OrderStatus.completed || a.status == AssignmentStatus.cancelled) return RiderStep.done;
  return switch (a.status) {
    AssignmentStatus.assigned => RiderStep.accept,
    AssignmentStatus.accepted =>
      a.orderStatus == OrderStatus.ready ? RiderStep.pickUp : RiderStep.waitingForKitchen,
    AssignmentStatus.pickedUp => RiderStep.delivered,
    AssignmentStatus.delivered =>
      a.orderStatus == OrderStatus.delivered ? RiderStep.complete : RiderStep.done,
    _ => RiderStep.done,
  };
}

final myAssignmentsProvider = FutureProvider.autoDispose<List<DeliveryAssignment>>(
  (ref) => ref.watch(opsRepositoryProvider).myAssignments(),
);

/// Rider app: duty switch, active deliveries, today's delivered ones.
class DeliveriesPage extends ConsumerWidget {
  const DeliveriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(myAssignmentsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('My deliveries')),
      body: AutoRefresh(
        every: const Duration(seconds: 20),
        events: const {StaffEvent.deliveryAssigned, StaffEvent.orderStatusChanged},
        onRefresh: () => ref.invalidate(myAssignmentsProvider),
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(myAssignmentsProvider.future),
          child: ListView(
            padding: const EdgeInsets.all(Space.gutter),
            children: [
              const DutySwitch(),
              const SizedBox(height: Space.x4),
              SizedBox(
                height: list.hasValue ? null : 400,
                child: AsyncBody(
                  value: list,
                  onRetry: () => ref.invalidate(myAssignmentsProvider),
                  errorTitle: 'Couldn’t load deliveries',
                  skeletonRows: 3,
                  data: (items) {
                    final active = items.where((a) => riderStep(a) != RiderStep.done).toList();
                    final done = items.where((a) => riderStep(a) == RiderStep.done).toList();
                    if (items.isEmpty) {
                      return const SizedBox(
                        height: 360,
                        child: MessagePanel(
                          icon: Icons.delivery_dining_outlined,
                          title: 'No deliveries',
                          message:
                              'New deliveries assigned to you show up here. Stay on duty to receive them.',
                        ),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final a in active) ...[_AssignmentCard(a: a), const SizedBox(height: Space.x3)],
                        if (done.isNotEmpty) ...[
                          const SizedBox(height: Space.x3),
                          Text('Done today', style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(height: Space.x2),
                          for (final a in done) ...[_AssignmentCard(a: a), const SizedBox(height: Space.x3)],
                        ],
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// On/off duty for any staff member (`PATCH /staff/me/duty`).
class DutySwitch extends ConsumerStatefulWidget {
  const DutySwitch({super.key});

  @override
  ConsumerState<DutySwitch> createState() => _DutySwitchState();
}

class _DutySwitchState extends ConsumerState<DutySwitch> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider).value;
    final profile = session?.user.staffProfile;
    if (profile == null) return const SizedBox.shrink();
    final c = context.colors;
    return Material(
      color: profile.onDuty ? Color.alphaBlend(c.sage500.withValues(alpha: 0.16), c.ink950) : c.ink800,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.cardAll,
        side: BorderSide(color: profile.onDuty ? c.sage500 : c.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: SwitchListTile(
        secondary: Icon(profile.onDuty ? Icons.check_circle_rounded : Icons.bedtime_outlined),
        title: Text(profile.onDuty ? 'On duty' : 'Off duty'),
        subtitle: Text(profile.onDuty ? 'You can receive new work' : 'Turn on to receive new work'),
        value: profile.onDuty,
        onChanged: _busy
            ? null
            : (v) async {
                setState(() => _busy = true);
                await runAction(context, () async {
                  final member = await ref.read(peopleRepositoryProvider).setDuty(v);
                  final user = session!.user;
                  ref
                      .read(sessionProvider.notifier)
                      .updateUser(
                        user.copyWith(staffProfile: user.staffProfile!.copyWith(onDuty: member.onDuty)),
                      );
                }, success: v ? 'You’re on duty' : 'You’re off duty');
                if (mounted) setState(() => _busy = false);
              },
      ),
    );
  }
}

class _AssignmentCard extends ConsumerStatefulWidget {
  const _AssignmentCard({required this.a});

  final DeliveryAssignment a;

  @override
  ConsumerState<_AssignmentCard> createState() => _AssignmentCardState();
}

class _AssignmentCardState extends ConsumerState<_AssignmentCard> {
  bool _busy = false;

  Future<void> _do(String action, String done, {Map<String, Object?>? body}) async {
    setState(() => _busy = true);
    unawaited(HapticFeedback.mediumImpact());
    await runAction(
      context,
      () => ref.read(opsRepositoryProvider).assignmentAction(widget.a.id, action, body: body),
      success: done,
    );
    ref.invalidate(myAssignmentsProvider);
    if (mounted) setState(() => _busy = false);
  }

  Future<void> _delivered() async {
    final a = widget.a;
    if (a.amountToCollect > 0) {
      final ok = await confirm(
        context,
        title: 'Collect ${Money(a.amountToCollect).format()}',
        message:
            'Confirm you collected ${Money(a.amountToCollect).format()} in cash from ${a.customerName ?? 'the customer'}.',
        confirmLabel: 'Cash collected',
      );
      if (!ok) return;
    }
    await _do(
      'delivered',
      'Marked received',
      body: {if (a.amountToCollect > 0) 'cashCollected': a.amountToCollect},
    );
  }

  @override
  Widget build(BuildContext context) {
    final a = widget.a;
    final step = riderStep(a);
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final address = [
      a.delivery?.addressLine,
      a.delivery?.area,
      a.delivery?.city,
    ].whereType<String>().join(', ');
    final items = a.items.fold(0, (s, i) => s + i.quantity);

    final Widget action = switch (step) {
      RiderStep.accept => FilledButton(
        onPressed: _busy ? null : () => _do('accept', 'Accepted'),
        child: const Text('Accept'),
      ),
      RiderStep.waitingForKitchen => const FilledButton(onPressed: null, child: Text('Waiting for kitchen…')),
      RiderStep.pickUp => FilledButton.icon(
        onPressed: _busy ? null : () => _do('picked-up', 'On the way'),
        icon: const Icon(Icons.two_wheeler_rounded),
        label: const Text('Picked up · on the way'),
      ),
      RiderStep.delivered => FilledButton.icon(
        onPressed: _busy ? null : _delivered,
        icon: const Icon(Icons.home_rounded),
        label: Text(a.amountToCollect > 0 ? 'Customer received · cash collected' : 'Customer received'),
      ),
      RiderStep.complete => FilledButton.icon(
        style: FilledButton.styleFrom(backgroundColor: c.sage500),
        onPressed: _busy ? null : () => _do('complete', 'Completed'),
        icon: const Icon(Icons.task_alt_rounded),
        label: const Text('Mark completed'),
      ),
      RiderStep.done => Text(
        'Done',
        textAlign: TextAlign.center,
        style: t.bodyMedium?.copyWith(color: c.sage500),
      ),
    };

    return Opacity(
      opacity: step == RiderStep.done ? 0.6 : 1,
      child: SectionCard(
        title: a.orderNumber,
        trailing: orderBadge(a.orderStatus),
        children: [
          Text('${a.branchName} · assigned ${formatLocalTime(a.assignedAt)}', style: t.bodySmall),
          const SizedBox(height: Space.x2),
          Text(a.customerName ?? 'Customer', style: t.titleSmall),
          if (address.isNotEmpty) Text(address, style: t.bodyMedium?.copyWith(color: c.cream50)),
          if (a.delivery?.instructions != null)
            Text('Note: ${a.delivery!.instructions}', style: t.bodyMedium?.copyWith(color: c.amber500)),
          const SizedBox(height: Space.x2),
          Text('$items ${items == 1 ? 'item' : 'items'} · ${a.paymentMethod.label}', style: t.bodySmall),
          const SizedBox(height: Space.x2),
          Container(
            padding: const EdgeInsets.all(Space.x3),
            decoration: BoxDecoration(
              color: (a.amountToCollect > 0 ? c.amber500 : c.sage500).withValues(alpha: 0.14),
              borderRadius: Radii.controlAll,
            ),
            child: Text(
              a.amountToCollect > 0
                  ? 'Collect ${Money(a.amountToCollect).format()} cash'
                  : 'Prepaid — nothing to collect',
              style: t.titleSmall,
            ),
          ),
          if (step != RiderStep.done) ...[
            const SizedBox(height: Space.x3),
            Wrap(
              spacing: Space.x2,
              runSpacing: Space.x2,
              children: [
                if (a.customerPhone != null)
                  OutlinedButton.icon(
                    onPressed: () => callNumber(context, a.customerPhone!),
                    icon: const Icon(Icons.call_rounded),
                    label: Text('Call ${displayPhone(a.customerPhone)}'),
                  ),
                if (address.isNotEmpty)
                  OutlinedButton.icon(
                    onPressed: () => openMap(
                      context,
                      lat: a.delivery?.latitude,
                      lng: a.delivery?.longitude,
                      label: address,
                    ),
                    icon: const Icon(Icons.navigation_outlined),
                    label: const Text('Navigate'),
                  ),
              ],
            ),
          ],
          const SizedBox(height: Space.x3),
          action,
        ],
      ),
    );
  }
}
