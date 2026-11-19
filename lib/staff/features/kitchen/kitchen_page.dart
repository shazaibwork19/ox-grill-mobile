import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/panels.dart';
import '../../core/branch_scope.dart';
import '../../core/staff_socket.dart';
import '../../data/ops_repository.dart';
import '../../domain/ops_models.dart';
import '../../widgets/staff_ui.dart';

final kitchenQueueProvider = FutureProvider.autoDispose.family<List<KitchenTicket>, String>(
  (ref, branchId) => ref.watch(opsRepositoryProvider).kitchenQueue(branchId),
);

/// Kitchen board: confirmed → preparing → ready. Tickets carry no prices or contacts.
class KitchenPage extends ConsumerWidget {
  const KitchenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchId = ref.watch(activeBranchProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Kitchen'), actions: const [BranchChip(allowAll: false)]),
      body: branchId == null
          ? const NeedsBranch()
          : AutoRefresh(
              every: const Duration(seconds: 15),
              events: const {
                StaffEvent.kitchenNewOrder,
                StaffEvent.kitchenOrderUpdated,
                StaffEvent.kitchenOrderCancelled,
                StaffEvent.orderStatusChanged,
              },
              onEvent: (name, payload) {
                if (name == StaffEvent.kitchenOrderCancelled && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Cancelled: ${payload['orderNumber'] ?? 'an order'} — stop preparing'),
                    ),
                  );
                }
              },
              onRefresh: () => ref.invalidate(kitchenQueueProvider(branchId)),
              child: _Board(branchId: branchId),
            ),
    );
  }
}

class _Board extends ConsumerWidget {
  const _Board({required this.branchId});

  final String branchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queue = ref.watch(kitchenQueueProvider(branchId));
    return RefreshIndicator(
      onRefresh: () => ref.refresh(kitchenQueueProvider(branchId).future),
      child: AsyncBody(
        value: queue,
        onRetry: () => ref.invalidate(kitchenQueueProvider(branchId)),
        errorTitle: 'Couldn’t load the kitchen board',
        data: (tickets) {
          if (tickets.isEmpty) {
            return ListView(
              children: const [
                SizedBox(
                  height: 400,
                  child: MessagePanel(
                    icon: Icons.soup_kitchen_outlined,
                    title: 'No tickets',
                    message: 'Confirmed orders appear here automatically.',
                  ),
                ),
              ],
            );
          }
          final order = {OrderStatus.confirmed: 0, OrderStatus.preparing: 1, OrderStatus.ready: 2};
          final sorted = [...tickets]
            ..sort((a, b) {
              final s = (order[a.status] ?? 3).compareTo(order[b.status] ?? 3);
              return s != 0 ? s : a.placedAt.compareTo(b.placedAt);
            });
          return LayoutBuilder(
            builder: (context, box) {
              final cols = (box.maxWidth / 340).floor().clamp(1, 4);
              final w = (box.maxWidth - Space.gutter * 2 - Space.x3 * (cols - 1)) / cols;
              return ListView(
                padding: const EdgeInsets.all(Space.gutter),
                children: [
                  Wrap(
                    spacing: Space.x3,
                    runSpacing: Space.x3,
                    children: [
                      for (final ticket in sorted)
                        SizedBox(
                          width: w,
                          child: _TicketCard(ticket: ticket, branchId: branchId),
                        ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _TicketCard extends ConsumerWidget {
  const _TicketCard({required this.ticket, required this.branchId});

  final KitchenTicket ticket;
  final String branchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final repo = ref.read(opsRepositoryProvider);
    final since = ticket.preparingAt ?? ticket.confirmedAt ?? ticket.placedAt;
    // Clamped: a phone clock a little behind the server would show negative minutes.
    final minutes = DateTime.now().difference(since).inMinutes.clamp(0, 9999);
    final late = ticket.status != OrderStatus.ready && minutes >= 20;
    final who = ticket.tableRef != null
        ? 'Table ${ticket.tableRef}'
        : ticket.pickupName ?? ticket.customerName ?? ticket.type.label;

    Future<void> act(Future<Object?> Function() f, String done) async {
      unawaited(HapticFeedback.mediumImpact());
      await runAction(context, f, success: done);
      ref.invalidate(kitchenQueueProvider(branchId));
    }

    return Container(
      padding: const EdgeInsets.all(Space.x4),
      decoration: BoxDecoration(
        color: c.ink800,
        borderRadius: Radii.cardAll,
        border: Border.all(color: late ? c.danger500 : c.border, width: late ? 2 : 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(ticket.orderNumber, style: t.titleMedium)),
              orderBadge(ticket.status),
            ],
          ),
          Text(
            '$who · ${ticket.type.label} · ${formatLocalTime(ticket.placedAt)} · $minutes min${late ? ' — late' : ''}',
            style: t.bodySmall?.copyWith(color: late ? c.danger500 : null),
          ),
          const Divider(height: Space.x6),
          for (final i in ticket.items)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.x2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${i.quantity} × ${i.name}', style: t.titleSmall),
                  if (i.options.isNotEmpty) Text(i.options.join(', '), style: t.bodyMedium),
                  if (i.notes != null)
                    Text(
                      'Note: ${i.notes}',
                      style: t.bodyMedium?.copyWith(color: c.amber500, fontWeight: FontWeight.w700),
                    ),
                ],
              ),
            ),
          if (ticket.notes != null)
            InlineNotice(tone: PanelTone.warning, icon: Icons.sticky_note_2_outlined, message: ticket.notes!),
          const SizedBox(height: Space.x3),
          if (ticket.status == OrderStatus.confirmed)
            FilledButton.icon(
              onPressed: () =>
                  act(() => repo.startPreparing(branchId, ticket.id), '${ticket.orderNumber} preparing'),
              icon: const Icon(Icons.local_fire_department_rounded),
              label: const Text('Start preparing'),
            )
          else if (ticket.status == OrderStatus.preparing)
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: c.sage500),
              onPressed: () => act(() => repo.markReady(branchId, ticket.id), '${ticket.orderNumber} ready'),
              icon: const Icon(Icons.room_service_rounded),
              label: const Text('Mark prepared'),
            )
          else if (ticket.status == OrderStatus.ready)
            Text(
              'Ready${ticket.readyAt != null ? ' at ${formatLocalTime(ticket.readyAt!)}' : ''} — waiting for pickup',
              textAlign: TextAlign.center,
              style: t.bodyMedium?.copyWith(color: c.sage500),
            ),
        ],
      ),
    );
  }
}
