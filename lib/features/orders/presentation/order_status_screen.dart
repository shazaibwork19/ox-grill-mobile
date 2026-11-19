import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/domain/enums.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/money/money.dart';
import '../../../core/format/phone.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/launch.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/skeleton.dart';
import '../../../core/widgets/status_badge.dart';
import '../../cart/presentation/totals_table.dart';
import '../application/tracking_controller.dart';
import '../domain/order.dart';

class OrderStatusScreen extends ConsumerStatefulWidget {
  const OrderStatusScreen({super.key, required this.token});

  final String token;

  @override
  ConsumerState<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends ConsumerState<OrderStatusScreen> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    // Missed events are not replayed: refetch whenever the app comes back.
    _lifecycle = AppLifecycleListener(
      onResume: () => ref.read(trackingProvider(widget.token).notifier).refresh(),
    );
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  void _leave() => context.canPop() ? context.pop() : context.go(Routes.menu);

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(trackingProvider(widget.token));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(tooltip: 'Back', icon: const Icon(Icons.arrow_back_rounded), onPressed: _leave),
        title: Text(status.value?.order.orderNumber ?? 'Order status'),
        actions: [
          IconButton(
            tooltip: 'All my orders',
            icon: const Icon(Icons.receipt_long_rounded),
            onPressed: () => context.push(Routes.orders),
          ),
        ],
      ),
      body: switch (status) {
        AsyncData(:final value) => RefreshIndicator(
          onRefresh: () => ref.read(trackingProvider(widget.token).notifier).refresh(),
          child: _StatusBody(status: value),
        ),
        AsyncError(:final error) => _errorPanel(error),
        _ => const _StatusSkeleton(),
      },
    );
  }

  Widget _errorPanel(Object error) {
    final f = AppFailure.from(error);
    if (f is ApiFailure && f.isNotFound) {
      return MessagePanel(
        icon: Icons.search_off_rounded,
        title: 'Order not found',
        message: 'This order can no longer be opened from the app. If you need help, please call the branch.',
        actionLabel: 'Back to the menu',
        onAction: () => context.go(Routes.menu),
      );
    }
    return MessagePanel.failure(
      error,
      title: 'Couldn’t load your order',
      note: 'Your order is not affected. This only stops the app from showing its status.',
      onRetry: () => ref.invalidate(trackingProvider(widget.token)),
    );
  }
}

class _StatusBody extends StatelessWidget {
  const _StatusBody({required this.status});

  final PublicOrderStatus status;

  @override
  Widget build(BuildContext context) {
    final order = status.order;
    final tracking = status.tracking;
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final current = tracking.steps.where((s) => s.state == TrackingStepState.current).firstOrNull;
    final currentLabel =
        current?.label ?? (tracking.steps.isNotEmpty ? tracking.steps.last.label : order.status.wire);
    final branchPhone = tracking.branch.phone;
    final wide = Breakpoints.isTablet(context);

    final head = <Widget>[
      Text('Placed ${formatLocalDateTime(order.placedAt)}', style: t.bodySmall),
      const SizedBox(height: Space.x2),
      Text(order.branchName, style: t.headlineSmall),
      const SizedBox(height: Space.x3),
      Align(alignment: Alignment.centerLeft, child: StatusBadge.order(order.status, currentLabel)),
      if (order.status == OrderStatus.pending) ...[
        const SizedBox(height: Space.x4),
        InlineNotice(
          tone: PanelTone.warning,
          icon: Icons.phone_in_talk_rounded,
          message:
              'Not confirmed yet. ${order.branchName} will call you on '
              '${displayPhone(order.customerPhone)} to confirm.',
        ),
      ],
      if (order.status.isFailed && order.cancelReason != null) ...[
        const SizedBox(height: Space.x4),
        InlineNotice(tone: PanelTone.danger, icon: Icons.info_outline_rounded, message: order.cancelReason!),
      ],
      if (tracking.estimatedReadyAt != null && !order.status.isFinal) ...[
        const SizedBox(height: Space.x3),
        Text('Estimated ready at ${formatLocalTime(tracking.estimatedReadyAt!)}', style: t.bodyMedium),
      ],
      const SizedBox(height: Space.x4),
      Wrap(
        spacing: Space.x3,
        runSpacing: Space.x3,
        children: [
          OutlinedButton.icon(
            onPressed: () => callNumber(context, branchPhone),
            icon: const Icon(Icons.call_rounded),
            label: const Text('Call branch'),
          ),
          if (tracking.rider?.phone case final riderPhone?)
            OutlinedButton.icon(
              onPressed: () => callNumber(context, riderPhone),
              icon: const Icon(Icons.delivery_dining_rounded),
              label: Text('Call ${tracking.rider?.name ?? 'rider'}'),
            ),
        ],
      ),
      if (order.status == OrderStatus.pending) ...[
        const SizedBox(height: Space.x2),
        Text('To cancel, call the branch.', style: t.bodySmall),
      ],
    ];

    final timeline = _Timeline(steps: tracking.steps);
    final summary = <Widget>[
      Text('Your order', style: t.titleMedium),
      const SizedBox(height: Space.x3),
      for (final item in order.items)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.x1),
          child: MergeSemantics(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 36, child: Text('${item.quantity}×', style: t.labelMedium)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: t.bodyLarge),
                      if (item.options.isNotEmpty)
                        Text(item.options.map((o) => o.name).join(', '), style: t.bodySmall),
                      if (item.notes != null) Text('Note: ${item.notes}', style: t.bodySmall),
                    ],
                  ),
                ),
                Text(Money(item.lineTotal).format(), style: t.bodyLarge),
              ],
            ),
          ),
        ),
      const SizedBox(height: Space.x3),
      TotalsTable(totals: order.totals, paymentMethod: order.paymentMethod, orderType: order.type),
      const SizedBox(height: Space.x3),
      Text('Payment: ${order.paymentMethod.label}', style: t.bodyMedium),
      if (order.delivery?.addressLine case final address?) ...[
        const SizedBox(height: Space.x1),
        Text('Deliver to: $address', style: t.bodyMedium),
      ],
    ];

    final padding = const EdgeInsets.fromLTRB(Space.gutter, Space.x4, Space.gutter, Space.x12);
    if (wide) {
      return ListView(
        padding: padding,
        children: [
          ...head,
          const SizedBox(height: Space.x6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: timeline),
              const SizedBox(width: Space.x8),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: summary),
              ),
            ],
          ),
        ],
      );
    }
    return ListView(
      padding: padding,
      children: [
        ...head,
        const SizedBox(height: Space.x6),
        Divider(color: c.border),
        const SizedBox(height: Space.x4),
        timeline,
        const SizedBox(height: Space.x6),
        ...summary,
      ],
    );
  }
}

/// Server-provided steps, top to bottom. Labels are shown exactly as sent.
class _Timeline extends StatelessWidget {
  const _Timeline({required this.steps});

  final List<TrackingStep> steps;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    return Column(
      children: [
        for (var i = 0; i < steps.length; i++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 32,
                  child: Column(
                    children: [
                      _StepDot(state: steps[i].state, failed: steps[i].status.isFailed),
                      if (i < steps.length - 1)
                        Expanded(
                          child: Container(
                            width: 2,
                            color: steps[i].state == TrackingStepState.done ? c.sage500 : c.border,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: Space.x3),
                Expanded(
                  child: Semantics(
                    label:
                        '${steps[i].label}, ${_stateWord(steps[i].state)}'
                        '${steps[i].reachedAt != null ? ', at ${formatLocalTime(steps[i].reachedAt!)}' : ''}',
                    excludeSemantics: true,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: Space.x6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            steps[i].label,
                            style: steps[i].state == TrackingStepState.upcoming
                                ? t.bodyLarge?.copyWith(color: c.cream200.withValues(alpha: 0.75))
                                : t.titleSmall,
                          ),
                          if (steps[i].reachedAt != null)
                            Text(formatLocalTime(steps[i].reachedAt!), style: t.bodySmall)
                          else if (steps[i].state == TrackingStepState.current)
                            Text('In progress', style: t.bodySmall?.copyWith(color: c.amber500)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  static String _stateWord(TrackingStepState s) => switch (s) {
    TrackingStepState.done => 'done',
    TrackingStepState.current => 'current step',
    TrackingStepState.upcoming => 'upcoming',
    TrackingStepState.unknown => '',
  };
}

class _StepDot extends StatelessWidget {
  const _StepDot({required this.state, required this.failed});

  final TrackingStepState state;
  final bool failed;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final (color, icon) = switch (state) {
      _ when failed => (c.danger500, Icons.close_rounded),
      TrackingStepState.done => (c.sage500, Icons.check_rounded),
      TrackingStepState.current => (c.amber500, Icons.more_horiz_rounded),
      _ => (c.cream200.withValues(alpha: 0.4), null),
    };
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: state == TrackingStepState.upcoming ? Colors.transparent : color.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
      child: icon == null ? null : Icon(icon, size: 16, color: color),
    );
  }
}

class _StatusSkeleton extends StatelessWidget {
  const _StatusSkeleton();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SkeletonPulse(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(Space.gutter),
        children: [
          SkeletonLine(widthFactor: 0.35, style: t.bodySmall),
          const SizedBox(height: Space.x2),
          SkeletonLine(widthFactor: 0.6, style: t.headlineSmall),
          const SizedBox(height: Space.x3),
          const Align(
            alignment: Alignment.centerLeft,
            child: SkeletonBox(width: 140, height: 28, radius: Radii.pill),
          ),
          const SizedBox(height: Space.x6),
          for (var i = 0; i < 5; i++) ...[
            Row(
              children: [
                const SkeletonBox(width: 28, height: 28, radius: 14),
                const SizedBox(width: Space.x3),
                Expanded(child: SkeletonLine(widthFactor: 0.5, style: t.titleSmall)),
              ],
            ),
            const SizedBox(height: Space.x6),
          ],
        ],
      ),
    );
  }
}
