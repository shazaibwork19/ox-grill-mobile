import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/domain/enums.dart';
import '../../../core/errors/app_failure.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/time/local_time.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/skeleton.dart';
import '../../../core/widgets/status_badge.dart';
import '../data/order_repository.dart';
import '../data/saved_orders_store.dart';
import '../domain/order.dart';

/// Current status of one saved order (one request per row).
final _savedOrderStatusProvider = FutureProvider.autoDispose.family<PublicOrderStatus, String>(
  (ref, token) => ref.watch(orderRepositoryProvider).track(token),
  retry: (_, _) => null,
);

/// "Order status": orders placed from this phone, newest first. If exactly
/// one is still in progress it opens straight away.
class OrdersListScreen extends ConsumerStatefulWidget {
  const OrdersListScreen({super.key});

  @override
  ConsumerState<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends ConsumerState<OrdersListScreen> {
  bool _autoOpened = false;

  void _maybeAutoOpen(List<SavedOrder> orders) {
    if (_autoOpened || orders.isEmpty) return;
    final statuses = [for (final o in orders) ref.read(_savedOrderStatusProvider(o.token))];
    if (statuses.any((s) => s.isLoading)) return;
    _autoOpened = true;
    final active = [
      for (var i = 0; i < orders.length; i++)
        if (statuses[i].value case final s? when !s.order.status.isFinal) orders[i],
    ];
    if (active.length == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.pushReplacement(Routes.track(active.single.token));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final saved = ref.watch(savedOrdersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Order status')),
      body: switch (saved) {
        AsyncData(:final value) when value.isEmpty => MessagePanel(
          icon: Icons.receipt_long_outlined,
          title: 'No orders yet',
          message: 'Orders you place from this phone appear here so you can follow them.',
          actionLabel: 'Browse the menu',
          onAction: () => context.go(Routes.root),
        ),
        AsyncData(:final value) => _List(orders: value, onStatusesSettled: () => _maybeAutoOpen(value)),
        AsyncError(:final error) => MessagePanel.failure(
          error,
          onRetry: () => ref.invalidate(savedOrdersProvider),
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _List extends ConsumerWidget {
  const _List({required this.orders, required this.onStatusesSettled});

  final List<SavedOrder> orders;
  final VoidCallback onStatusesSettled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    for (final o in orders) {
      ref.listen(_savedOrderStatusProvider(o.token), (_, next) {
        // Tokens that no longer open an order are forgotten.
        if (next case AsyncError(:final error)
            when AppFailure.from(error) is ApiFailure && (AppFailure.from(error) as ApiFailure).isNotFound) {
          ref.read(savedOrdersProvider.notifier).remove(o.token);
        }
        if (!next.isLoading) onStatusesSettled();
      });
    }
    return RefreshIndicator(
      onRefresh: () async {
        for (final o in orders) {
          ref.invalidate(_savedOrderStatusProvider(o.token));
        }
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(Space.gutter),
        itemCount: orders.length,
        separatorBuilder: (_, _) => const SizedBox(height: Space.x3),
        itemBuilder: (_, i) => _OrderRow(saved: orders[i]),
      ),
    );
  }
}

class _OrderRow extends ConsumerWidget {
  const _OrderRow({required this.saved});

  final SavedOrder saved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(_savedOrderStatusProvider(saved.token));
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final Widget badge = switch (status) {
      AsyncData(:final value) => StatusBadge.order(
        value.order.status,
        value.tracking.steps.where((s) => s.state == TrackingStepState.current).firstOrNull?.label ??
            (value.tracking.steps.isNotEmpty ? value.tracking.steps.last.label : value.order.status.wire),
      ),
      AsyncError() => const StatusBadge(
        label: 'Status unavailable',
        tone: BadgeTone.neutral,
        icon: Icons.cloud_off_rounded,
      ),
      _ => const SkeletonPulse(child: SkeletonBox(width: 120, height: 26, radius: Radii.pill)),
    };
    return Material(
      color: c.ink800,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.cardAll,
        side: BorderSide(color: c.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push(Routes.track(saved.token)),
        child: Padding(
          padding: const EdgeInsets.all(Space.x4),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(saved.orderNumber, style: t.titleSmall),
                    const SizedBox(height: 2),
                    Text('${saved.branchName} · ${formatLocalDateTime(saved.placedAt)}', style: t.bodySmall),
                    const SizedBox(height: Space.x3),
                    badge,
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: c.cream200),
            ],
          ),
        ),
      ),
    );
  }
}
