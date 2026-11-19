import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../../core/format/phone.dart';
import '../../../core/money/money.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/launch.dart';
import '../../../core/widgets/panels.dart';
import '../../../features/cart/presentation/totals_table.dart';
import '../../../features/orders/domain/order.dart';
import '../../core/permissions.dart';
import '../../core/session.dart';
import '../../core/staff_socket.dart';
import '../../data/ops_repository.dart';
import '../../domain/ops_models.dart';
import '../../widgets/staff_ui.dart';
import 'orders_page.dart';

final orderDetailProvider = FutureProvider.autoDispose.family<Order, ({String branchId, String orderId})>(
  (ref, k) => ref.watch(opsRepositoryProvider).order(k.branchId, k.orderId),
);

final ridersProvider = FutureProvider.autoDispose.family<List<Rider>, String>(
  (ref, branchId) => ref.watch(opsRepositoryProvider).riders(branchId),
);

/// Button text for moving an order to [s].
String transitionLabel(OrderStatus s) => switch (s) {
  OrderStatus.confirmed => 'Confirm order',
  OrderStatus.rejected => 'Reject',
  OrderStatus.cancelled => 'Cancel order',
  OrderStatus.preparing => 'Start preparing',
  OrderStatus.ready => 'Mark ready',
  OrderStatus.outForDelivery => 'Out for delivery',
  OrderStatus.delivered => 'Mark delivered',
  OrderStatus.completed => 'Complete',
  _ => orderStatusLabel(s),
};

/// Rejecting, and cancelling after confirmation, need a reason (server rule).
/// The app always asks for one on both, so the customer is told why.
bool transitionNeedsReason(OrderStatus to) => to == OrderStatus.rejected || to == OrderStatus.cancelled;

class OrderDetailPage extends ConsumerWidget {
  const OrderDetailPage({super.key, required this.branchId, required this.orderId});

  final String branchId;
  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = (branchId: branchId, orderId: orderId);
    final order = ref.watch(orderDetailProvider(key));
    return Scaffold(
      appBar: AppBar(title: Text(order.value?.orderNumber ?? 'Order')),
      body: AutoRefresh(
        every: const Duration(seconds: 20),
        events: const {StaffEvent.orderStatusChanged, StaffEvent.orderPaymentUpdated},
        onRefresh: () => ref.invalidate(orderDetailProvider(key)),
        child: AsyncBody(
          value: order,
          onRetry: () => ref.invalidate(orderDetailProvider(key)),
          errorTitle: 'Couldn’t load this order',
          data: (o) => RefreshIndicator(
            onRefresh: () => ref.refresh(orderDetailProvider(key).future),
            child: _Body(order: o, branchId: branchId),
          ),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.order, required this.branchId});

  final Order order;
  final String branchId;

  void _changed(WidgetRef ref) {
    ref.invalidate(orderDetailProvider((branchId: branchId, orderId: order.id)));
    ref.invalidate(ordersProvider);
  }

  Future<void> _move(BuildContext context, WidgetRef ref, OrderStatus to) async {
    String? reason;
    if (transitionNeedsReason(to)) {
      reason = await promptText(
        context,
        title: to == OrderStatus.rejected ? 'Reject ${order.orderNumber}?' : 'Cancel ${order.orderNumber}?',
        message: 'The customer sees this reason on their order page.',
        label: 'Reason',
        hint: 'e.g. Customer could not be reached',
        minLength: 3,
        confirmLabel: to == OrderStatus.rejected ? 'Reject order' : 'Cancel order',
        destructive: true,
      );
      if (reason == null) return;
    }
    if (!context.mounted) return;
    await runAction(
      context,
      () => ref.read(opsRepositoryProvider).setStatus(branchId, order.id, to, reason: reason),
      success: '${order.orderNumber}: ${orderStatusLabel(to)}',
    );
    // Refresh either way: a 409 means someone else changed it first.
    _changed(ref);
  }

  Future<void> _assignRider(BuildContext context, WidgetRef ref) async {
    final riders = await ref.read(ridersProvider(branchId).future).catchError((_) => <Rider>[]);
    if (!context.mounted) return;
    final picked = await showModalBottomSheet<Rider>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: Space.x6),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x3),
            child: Text('Assign a rider', style: Theme.of(context).textTheme.headlineSmall),
          ),
          if (riders.isEmpty)
            const Padding(
              padding: EdgeInsets.all(Space.gutter),
              child: Text('No riders at this branch yet. A manager can add them under Staff.'),
            ),
          for (final r in [...riders]..sort((a, b) => (b.onDuty ? 1 : 0) - (a.onDuty ? 1 : 0)))
            ListTile(
              leading: Icon(r.onDuty ? Icons.delivery_dining_rounded : Icons.bedtime_outlined),
              title: Text(r.name ?? 'Rider'),
              subtitle: Text(
                '${r.onDuty ? 'On duty' : 'Off duty'} · ${r.activeAssignments} active'
                '${r.phone != null ? ' · ${displayPhone(r.phone)}' : ''}',
              ),
              selected: order.assignment?.riderId == r.id,
              onTap: () => Navigator.pop(context, r),
            ),
        ],
      ),
    );
    if (picked == null || !context.mounted) return;
    await runAction(
      context,
      () => ref.read(opsRepositoryProvider).assignRider(branchId, order.id, picked.id),
      success: 'Assigned to ${picked.name ?? 'rider'}',
    );
    _changed(ref);
  }

  Future<void> _collect(BuildContext context, WidgetRef ref) async {
    final tendered = TextEditingController(text: rupeesText(order.totals.total));
    final cash =
        order.paymentMethod == PaymentMethod.cash || order.paymentMethod == PaymentMethod.cashOnDelivery;
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          final amount = parseRupees(tendered.text);
          final change = amount == null ? null : amount - order.totals.total;
          return AlertDialog(
            title: const Text('Record payment'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                KeyValue('Total due', money(order.totals.total), emphasis: true),
                KeyValue('Method', order.paymentMethod.label),
                if (cash) ...[
                  const SizedBox(height: Space.x3),
                  RupeeField(controller: tendered, label: 'Cash received', onChanged: (_) => setState(() {})),
                  if (change != null && change >= 0)
                    KeyValue('Change to give', money(change), emphasis: true),
                  if (change != null && change < 0)
                    Text('Less than the total', style: TextStyle(color: context.colors.danger500)),
                ],
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
              FilledButton(
                onPressed: cash && (change == null || change < 0) ? null : () => Navigator.pop(context, true),
                child: const Text('Mark paid'),
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
          .read(opsRepositoryProvider)
          .collectPayment(
            branchId,
            order.id,
            method: order.paymentMethod == PaymentMethod.online ? null : order.paymentMethod,
            amountTendered: cash ? parseRupees(tendered.text) : null,
          ),
      success: 'Payment recorded',
    );
    _changed(ref);
  }

  Future<void> _refund(BuildContext context, WidgetRef ref) async {
    final amount = TextEditingController();
    final reason = TextEditingController();
    final form = GlobalKey<FormState>();
    final paid = order.payment?.amount ?? order.totals.total;
    final already = order.payment?.refundedAmount ?? 0;
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Refund'),
        content: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              KeyValue('Paid', money(paid)),
              if (already > 0) KeyValue('Already refunded', money(already)),
              const SizedBox(height: Space.x3),
              RupeeField(controller: amount, label: 'Amount (empty = full refund)', optional: true),
              const SizedBox(height: Space.x3),
              TextFormField(
                controller: reason,
                maxLength: 300,
                decoration: const InputDecoration(labelText: 'Reason', hintText: 'e.g. Item was missing'),
                validator: (v) => (v ?? '').trim().length < 3 ? 'At least 3 characters' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: context.colors.danger500),
            onPressed: () {
              if (form.currentState!.validate()) Navigator.pop(context, true);
            },
            child: const Text('Refund'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await runAction(
      context,
      () => ref
          .read(opsRepositoryProvider)
          .refund(branchId, order.id, amount: parseRupees(amount.text), reason: reason.text.trim()),
      success: 'Refund recorded',
    );
    _changed(ref);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider).value!;
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final o = order;
    final paid = o.paymentStatus == PaymentStatus.paid;
    final canCollect =
        session.can(Capability.orders) &&
        !paid &&
        !o.status.isFailed &&
        o.paymentMethod != PaymentMethod.online &&
        o.paymentStatus == PaymentStatus.pending;
    final canRefund =
        session.can(Capability.refund) &&
        (o.paymentStatus == PaymentStatus.paid || o.paymentStatus == PaymentStatus.partiallyRefunded);
    final canAssign =
        session.can(Capability.assignRider) &&
        o.type == OrderType.delivery &&
        {OrderStatus.confirmed, OrderStatus.preparing, OrderStatus.ready}.contains(o.status);
    final transitions = o.allowedTransitions.where((s) => s != OrderStatus.unknown).toList();
    final forward = transitions.where((s) => !transitionNeedsReason(s)).toList();
    final backward = transitions.where(transitionNeedsReason).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x4, Space.gutter, Space.x12),
      children: [
        Wrap(
          spacing: Space.x2,
          runSpacing: Space.x2,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            orderBadge(o.status),
            Text('${o.type.label} · ${orderSourceLabel(o.source)}', style: t.bodySmall),
          ],
        ),
        const SizedBox(height: Space.x2),
        Text('${o.branchName} · placed ${formatLocalDateTime(o.placedAt)}', style: t.bodySmall),
        if (o.cancelReason != null) ...[
          const SizedBox(height: Space.x3),
          InlineNotice(tone: PanelTone.danger, message: 'Reason: ${o.cancelReason}'),
        ],
        if (o.status == OrderStatus.pending) ...[
          const SizedBox(height: Space.x3),
          const InlineNotice(
            tone: PanelTone.warning,
            icon: Icons.phone_in_talk_rounded,
            message: 'Call the customer to confirm before accepting.',
          ),
        ],
        if (forward.isNotEmpty || backward.isNotEmpty) ...[
          const SizedBox(height: Space.x4),
          for (final s in forward) ...[
            FilledButton(onPressed: () => _move(context, ref, s), child: Text(transitionLabel(s))),
            const SizedBox(height: Space.x2),
          ],
          if (backward.isNotEmpty)
            Wrap(
              spacing: Space.x2,
              children: [
                for (final s in backward)
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(foregroundColor: c.danger500),
                    onPressed: () => _move(context, ref, s),
                    child: Text(transitionLabel(s)),
                  ),
              ],
            ),
        ],
        const SizedBox(height: Space.x4),
        SectionCard(
          title: 'Customer',
          children: [
            Text(o.customerName ?? o.pickupName ?? 'Walk-in', style: t.titleSmall),
            if (o.customerPhone != null) Text(displayPhone(o.customerPhone), style: t.bodyMedium),
            if (o.tableRef != null) Text('Table ${o.tableRef}', style: t.bodyMedium),
            if (o.delivery?.addressLine != null) ...[
              const SizedBox(height: Space.x2),
              Text(
                [o.delivery!.addressLine, o.delivery!.area, o.delivery!.city].whereType<String>().join(', '),
                style: t.bodyMedium?.copyWith(color: c.cream50),
              ),
              if (o.delivery!.instructions != null)
                Text('Rider note: ${o.delivery!.instructions}', style: t.bodySmall),
            ],
            if (o.notes != null) Text('Order note: ${o.notes}', style: t.bodySmall),
            const SizedBox(height: Space.x3),
            Wrap(
              spacing: Space.x2,
              runSpacing: Space.x2,
              children: [
                if (o.customerPhone != null)
                  FilledButton.icon(
                    onPressed: () => callNumber(context, o.customerPhone!),
                    icon: const Icon(Icons.call_rounded),
                    label: const Text('Call customer'),
                  ),
                if (o.delivery?.addressLine != null)
                  OutlinedButton.icon(
                    onPressed: () => openMap(
                      context,
                      lat: o.delivery!.latitude,
                      lng: o.delivery!.longitude,
                      label: o.delivery!.addressLine!,
                    ),
                    icon: const Icon(Icons.map_outlined),
                    label: const Text('Map'),
                  ),
              ],
            ),
          ],
        ),
        if (o.type == OrderType.delivery) ...[
          const SizedBox(height: Space.x3),
          SectionCard(
            title: 'Rider',
            trailing: canAssign
                ? TextButton(
                    onPressed: () => _assignRider(context, ref),
                    child: Text(o.assignment == null ? 'Assign' : 'Change'),
                  )
                : null,
            children: [
              if (o.assignment == null)
                Text('Not assigned yet', style: t.bodyMedium)
              else ...[
                Text(o.assignment!.riderName ?? 'Rider', style: t.titleSmall),
                Text(
                  '${o.assignment!.status.toLowerCase().replaceAll('_', ' ')} · assigned ${formatLocalTime(o.assignment!.assignedAt)}',
                  style: t.bodySmall,
                ),
                if (o.assignment!.riderPhone != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () => callNumber(context, o.assignment!.riderPhone!),
                      icon: const Icon(Icons.call_rounded),
                      label: Text('Call ${displayPhone(o.assignment!.riderPhone)}'),
                    ),
                  ),
              ],
            ],
          ),
        ],
        const SizedBox(height: Space.x3),
        SectionCard(
          title: 'Items',
          children: [
            for (final i in o.items)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Space.x1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 36, child: Text('${i.quantity}×', style: t.labelMedium)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(i.name, style: t.bodyLarge),
                          if (i.options.isNotEmpty)
                            Text(i.options.map((x) => x.name).join(', '), style: t.bodySmall),
                          if (i.notes != null)
                            Text('Note: ${i.notes}', style: t.bodySmall?.copyWith(color: c.amber500)),
                        ],
                      ),
                    ),
                    Text(Money(i.lineTotal).format(), style: t.bodyLarge),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: Space.x3),
        TotalsTable(totals: o.totals, paymentMethod: o.paymentMethod, orderType: o.type),
        const SizedBox(height: Space.x3),
        SectionCard(
          title: 'Payment',
          children: [
            KeyValue('Method', o.paymentMethod.label),
            KeyValue('Status', o.paymentStatus.wire.toLowerCase().replaceAll('_', ' ')),
            if ((o.payment?.refundedAmount ?? 0) > 0) KeyValue('Refunded', money(o.payment!.refundedAmount)),
            const SizedBox(height: Space.x2),
            Wrap(
              spacing: Space.x2,
              runSpacing: Space.x2,
              children: [
                if (canCollect)
                  FilledButton.icon(
                    onPressed: () => _collect(context, ref),
                    icon: const Icon(Icons.payments_outlined),
                    label: const Text('Record payment'),
                  ),
                if (canRefund)
                  OutlinedButton.icon(
                    onPressed: () => _refund(context, ref),
                    icon: const Icon(Icons.undo_rounded),
                    label: const Text('Refund'),
                  ),
                if (session.can(Capability.orders))
                  OutlinedButton.icon(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => ReceiptPage(branchId: branchId, orderId: o.id),
                      ),
                    ),
                    icon: const Icon(Icons.receipt_outlined),
                    label: const Text('Receipt'),
                  ),
              ],
            ),
          ],
        ),
        if (o.history.isNotEmpty) ...[
          const SizedBox(height: Space.x3),
          SectionCard(
            title: 'History',
            children: [
              for (final h in o.history)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Space.x1),
                  child: Text(
                    '${formatLocalTime(h.createdAt)}  ${orderStatusLabel(h.toStatus)}'
                    '${h.actorName != null ? ' · ${h.actorName}' : ''} (${h.actorRole.toLowerCase().replaceAll('_', ' ')})'
                    '${h.reason != null ? ' — ${h.reason}' : ''}',
                    style: t.bodySmall,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

final receiptProvider = FutureProvider.autoDispose.family<Receipt, ({String branchId, String orderId})>(
  (ref, k) => ref.watch(opsRepositoryProvider).receipt(k.branchId, k.orderId),
);

/// Receipt data for showing to the customer (printing needs printer hardware integration).
class ReceiptPage extends ConsumerWidget {
  const ReceiptPage({super.key, required this.branchId, required this.orderId});

  final String branchId;
  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = (branchId: branchId, orderId: orderId);
    final receipt = ref.watch(receiptProvider(k));
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Receipt')),
      body: AsyncBody(
        value: receipt,
        onRetry: () => ref.invalidate(receiptProvider(k)),
        data: (r) => Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: ListView(
              padding: const EdgeInsets.all(Space.gutter),
              children: [
                Text(r.branch.name, style: t.headlineSmall, textAlign: TextAlign.center),
                Text(r.branch.addressLine, style: t.bodySmall, textAlign: TextAlign.center),
                Text(displayPhone(r.branch.phone), style: t.bodySmall, textAlign: TextAlign.center),
                const SizedBox(height: Space.x4),
                KeyValue('Order', r.orderNumber, emphasis: true),
                KeyValue('Date', formatLocalDateTime(r.placedAt)),
                KeyValue('Type', r.type.label),
                if (r.tableRef != null) KeyValue('Table', r.tableRef!),
                if (r.customerName != null) KeyValue('Customer', r.customerName!),
                if (r.cashierName != null) KeyValue('Served by', r.cashierName!),
                const Divider(height: Space.x6),
                for (final l in r.lines) KeyValue('${l.quantity}× ${l.name}', Money(l.lineTotal).format()),
                const Divider(height: Space.x6),
                TotalsTable(totals: r.totals, paymentMethod: r.paymentMethod, orderType: r.type),
                const SizedBox(height: Space.x3),
                KeyValue('Payment', '${r.paymentMethod.label} · ${r.paymentStatus.wire.toLowerCase()}'),
                if (r.amountTendered != null) KeyValue('Tendered', money(r.amountTendered!)),
                if (r.changeDue != null) KeyValue('Change', money(r.changeDue!), emphasis: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
