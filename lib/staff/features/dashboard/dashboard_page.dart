import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../core/branch_scope.dart';
import '../../core/session.dart';
import '../../core/staff_socket.dart';
import '../../data/ops_repository.dart';
import '../../domain/ops_models.dart';
import '../../widgets/staff_ui.dart';
import '../orders/order_detail_page.dart';
import '../orders/orders_page.dart';
import '../rider/deliveries_page.dart';

final dashboardProvider = FutureProvider.autoDispose.family<Dashboard, String?>(
  (ref, branchId) => ref.watch(opsRepositoryProvider).dashboard(branchId),
);

/// Today's KPIs: one branch (`/branches/{b}/dashboard`) or all (`/admin/dashboard`).
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider).value!;
    final branchId = ref.watch(activeBranchProvider);
    final dash = ref.watch(dashboardProvider(branchId));
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, ${session.user.displayName.split(' ').first}'),
        actions: const [BranchChip()],
      ),
      body: AutoRefresh(
        every: const Duration(seconds: 60),
        events: const {StaffEvent.orderCreated, StaffEvent.orderStatusChanged},
        onRefresh: () => ref.invalidate(dashboardProvider(branchId)),
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(dashboardProvider(branchId).future),
          child: AsyncBody(
            value: dash,
            onRetry: () => ref.invalidate(dashboardProvider(branchId)),
            errorTitle: 'Couldn’t load today’s numbers',
            data: (d) => ListView(
              padding: const EdgeInsets.all(Space.gutter),
              children: [
                if (session.user.staffProfile != null) ...[
                  const DutySwitch(),
                  const SizedBox(height: Space.x4),
                ],
                Text('Today', style: t.titleMedium),
                const SizedBox(height: Space.x3),
                StatGrid(
                  tiles: [
                    StatTile(label: 'Revenue', value: money(d.today.revenue), icon: Icons.payments_outlined),
                    StatTile(label: 'Orders', value: '${d.today.orders}', icon: Icons.receipt_long_outlined),
                    StatTile(
                      label: 'To confirm',
                      value: '${d.today.pendingOrders}',
                      icon: Icons.hourglass_top_rounded,
                    ),
                    StatTile(
                      label: 'In progress',
                      value: '${d.today.activeOrders}',
                      icon: Icons.local_fire_department_outlined,
                    ),
                    StatTile(
                      label: 'Average order',
                      value: money(d.today.averageOrderValue),
                      icon: Icons.functions_rounded,
                    ),
                    StatTile(
                      label: 'Cancelled',
                      value: '${d.today.cancelledOrders}',
                      icon: Icons.cancel_outlined,
                    ),
                  ],
                ),
                if (d.salesByBranch.length > 1) ...[
                  const SizedBox(height: Space.x6),
                  SectionCard(
                    title: 'By branch',
                    children: [
                      for (final b in d.salesByBranch)
                        KeyValue(b.branchName ?? 'Branch', '${money(b.revenue)} · ${b.orders} orders'),
                    ],
                  ),
                ],
                if (d.topItems.isNotEmpty) ...[
                  const SizedBox(height: Space.x4),
                  SectionCard(
                    title: 'Top items',
                    children: [
                      for (final i in d.topItems.take(5))
                        KeyValue('${i.quantity}× ${i.name ?? ''}', money(i.revenue)),
                    ],
                  ),
                ],
                if (d.paymentBreakdown.isNotEmpty) ...[
                  const SizedBox(height: Space.x4),
                  SectionCard(
                    title: 'Payments',
                    children: [
                      for (final p in d.paymentBreakdown)
                        KeyValue(PaymentMethod.fromWire(p.method).label, '${money(p.revenue)} · ${p.orders}'),
                    ],
                  ),
                ],
                if (d.recentOrders.isNotEmpty) ...[
                  const SizedBox(height: Space.x6),
                  Text('Recent orders', style: t.titleMedium),
                  const SizedBox(height: Space.x3),
                  for (final o in d.recentOrders.take(8)) ...[
                    OrderRow(
                      order: o,
                      showBranch: branchId == null,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => OrderDetailPage(branchId: o.branchId, orderId: o.id),
                        ),
                      ),
                    ),
                    const SizedBox(height: Space.x3),
                  ],
                ],
                if (d.recentActivity.isNotEmpty) ...[
                  const SizedBox(height: Space.x4),
                  SectionCard(
                    title: 'Activity',
                    children: [
                      for (final a in d.recentActivity.take(8))
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            '${formatLocalTime(a.createdAt)}  ${a.action.toLowerCase().replaceAll('_', ' ')}'
                            '${a.actorName != null ? ' · ${a.actorName}' : ''}',
                            style: t.bodySmall,
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
