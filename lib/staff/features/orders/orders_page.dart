import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../../core/format/phone.dart';
import '../../../core/network/api_client.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/panels.dart';
import '../../../features/orders/domain/order.dart';
import '../../core/branch_scope.dart';
import '../../core/permissions.dart';
import '../../core/session.dart';
import '../../core/staff_socket.dart';
import '../../data/ops_repository.dart';
import '../../widgets/staff_ui.dart';
import 'order_detail_page.dart';
import 'pos_page.dart';

enum OrdersView {
  active('Live'),
  pending('To confirm'),
  history('All');

  const OrdersView(this.label);
  final String label;
}

class OrdersFilter {
  const OrdersFilter({required this.branchId, this.view = OrdersView.active, this.query = '', this.type});

  final String? branchId;
  final OrdersView view;
  final String query;
  final OrderType? type;

  @override
  bool operator ==(Object other) =>
      other is OrdersFilter &&
      other.branchId == branchId &&
      other.view == view &&
      other.query == query &&
      other.type == type;

  @override
  int get hashCode => Object.hash(branchId, view, query, type);
}

final ordersProvider = FutureProvider.autoDispose.family<Paged<OrderSummary>, OrdersFilter>((ref, f) {
  return ref
      .watch(opsRepositoryProvider)
      .orders(
        branchId: f.branchId,
        statuses: switch (f.view) {
          OrdersView.active => OpsRepository.activeStatuses,
          OrdersView.pending => const [OrderStatus.pending],
          OrdersView.history => null,
        },
        type: f.type,
        query: f.query.trim().isEmpty ? null : f.query.trim(),
        pageSize: f.view == OrdersView.history ? 50 : 100,
      );
});

/// Live order board for managers, cashiers and the owner.
class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({super.key});

  @override
  ConsumerState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  OrdersView _view = OrdersView.active;
  OrderType? _type;
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider).value!;
    final branchId = ref.watch(activeBranchProvider);
    final filter = OrdersFilter(branchId: branchId, view: _view, query: _query, type: _type);
    final orders = ref.watch(ordersProvider(filter));
    final canPos = session.can(Capability.pos);

    return Scaffold(
      appBar: AppBar(title: const Text('Orders'), actions: const [BranchChip()]),
      floatingActionButton: canPos
          ? FloatingActionButton.extended(
              heroTag: null,
              onPressed: branchId == null
                  ? () => pickBranch(context, ref, allowAll: false)
                  : () =>
                        Navigator.of(context)
                            .push(MaterialPageRoute<void>(builder: (_) => PosPage(branchId: branchId))),
              icon: const Icon(Icons.add_rounded),
              label: const Text('New order'),
            )
          : null,
      body: AutoRefresh(
        every: const Duration(seconds: 20),
        events: const {
          StaffEvent.orderCreated,
          StaffEvent.orderStatusChanged,
          StaffEvent.orderPaymentUpdated,
        },
        onRefresh: () => ref.invalidate(ordersProvider(filter)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x3, Space.gutter, 0),
              child: SegmentedButton<OrdersView>(
                segments: [for (final v in OrdersView.values) ButtonSegment(value: v, label: Text(v.label))],
                selected: {_view},
                showSelectedIcon: false,
                onSelectionChanged: (s) => setState(() => _view = s.first),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x3, Space.gutter, Space.x2),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _search,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (v) => setState(() => _query = v),
                      decoration: InputDecoration(
                        hintText: 'Order number, name or phone',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: const Icon(Icons.search_rounded, semanticLabel: 'Search orders'),
                        suffixIcon: _query.isEmpty
                            ? null
                            : IconButton(
                                tooltip: 'Clear search',
                                icon: const Icon(Icons.close_rounded),
                                onPressed: () => setState(() {
                                  _search.clear();
                                  _query = '';
                                }),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Space.x2),
                  PopupMenuButton<OrderType?>(
                    tooltip: 'Filter by type',
                    icon: Icon(
                      Icons.filter_list_rounded,
                      color: _type == null ? null : context.colors.bronze400,
                    ),
                    onSelected: (t) => setState(() => _type = t),
                    itemBuilder: (_) => [
                      const PopupMenuItem(value: null, child: Text('All types')),
                      for (final t in OrderType.values.where((t) => t != OrderType.unknown))
                        PopupMenuItem(value: t, child: Text(t.label)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => ref.refresh(ordersProvider(filter).future),
                child: AsyncBody(
                  value: orders,
                  onRetry: () => ref.invalidate(ordersProvider(filter)),
                  errorTitle: 'Couldn’t load orders',
                  data: (page) => page.items.isEmpty
                      ? ListView(
                          children: [
                            SizedBox(
                              height: 360,
                              child: MessagePanel(
                                icon: Icons.inbox_outlined,
                                title: _view == OrdersView.history ? 'No orders found' : 'No live orders',
                                message: _view == OrdersView.history
                                    ? 'Try a different search or filter.'
                                    : 'New orders appear here as they come in.',
                              ),
                            ),
                          ],
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x2, Space.gutter, 96),
                          itemCount: page.items.length + (page.meta.hasMore ? 1 : 0),
                          separatorBuilder: (_, _) => const SizedBox(height: Space.x3),
                          itemBuilder: (context, i) {
                            if (i >= page.items.length) {
                              return Text(
                                'Showing ${page.items.length} of ${page.meta.total}. Search to narrow down.',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall,
                              );
                            }
                            return OrderRow(
                              order: page.items[i],
                              showBranch: branchId == null,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => OrderDetailPage(
                                    branchId: page.items[i].branchId,
                                    orderId: page.items[i].id,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderRow extends StatelessWidget {
  const OrderRow({super.key, required this.order, required this.onTap, this.showBranch = false});

  final OrderSummary order;
  final VoidCallback onTap;
  final bool showBranch;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final who = [
      if (order.customerName != null) order.customerName!,
      if (order.customerPhone != null) displayPhone(order.customerPhone),
      if (order.tableRef != null) 'Table ${order.tableRef}',
    ].join(' · ');
    final urgent = order.status == OrderStatus.pending;
    return Material(
      color: c.ink800,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.cardAll,
        side: BorderSide(color: urgent ? c.amber500 : c.border, width: urgent ? 1.5 : 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Space.x4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(order.orderNumber, style: t.titleSmall)),
                  Text(money(order.total), style: t.titleSmall),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                '${order.type.label} · ${order.itemCount} ${order.itemCount == 1 ? 'item' : 'items'} · '
                '${formatLocalTime(order.placedAt)} (${ago(order.placedAt)})',
                style: t.bodySmall,
              ),
              if (who.isNotEmpty) Text(who, style: t.bodyMedium?.copyWith(color: c.cream50)),
              if (showBranch) Text(order.branchName, style: t.bodySmall?.copyWith(color: c.bronze400)),
              const SizedBox(height: Space.x3),
              Wrap(
                spacing: Space.x2,
                runSpacing: Space.x2,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  orderBadge(order.status),
                  Text(
                    '${order.paymentMethod.label} · ${order.paymentStatus == PaymentStatus.paid ? 'paid' : order.paymentStatus.wire.toLowerCase().replaceAll('_', ' ')}',
                    style: t.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
