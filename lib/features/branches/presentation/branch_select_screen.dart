import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/domain/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/brand.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/skeleton.dart';
import '../../../core/widgets/status_badge.dart';
import '../../cart/application/branch_switch.dart';
import '../application/order_session.dart';
import '../data/branch_repository.dart';
import '../domain/branch.dart';
import 'order_type_sheet.dart';

class BranchSelectScreen extends ConsumerWidget {
  const BranchSelectScreen({super.key, this.isChange = false});

  /// Opened from the menu header to change branch (shows a back button).
  final bool isChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branches = ref.watch(branchesProvider);
    final session = ref.watch(orderSessionProvider);
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: isChange,
        title: isChange ? const Text('Change branch') : const Wordmark(size: 24),
        actions: [
          IconButton(
            tooltip: 'Order status',
            icon: const Icon(Icons.receipt_long_rounded),
            onPressed: () => context.push(Routes.orders),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(branchesProvider.future),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x6, Space.gutter, Space.x4),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose your branch', style: t.headlineMedium),
                    const SizedBox(height: Space.x2),
                    Text('Menu availability and prices are set by each branch.', style: t.bodyMedium),
                  ],
                ),
              ),
            ),
            ...switch (branches) {
              AsyncData(:final value) when value.isEmpty => [
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: MessagePanel(
                    icon: Icons.storefront_outlined,
                    title: 'No branches available',
                    message: 'No branch is taking online orders right now. Please try again later.',
                  ),
                ),
              ],
              AsyncData(:final value) => _branchSlivers(context, ref, value, session?.branchId),
              AsyncError(:final error) => [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: MessagePanel.failure(
                    error,
                    title: 'Couldn’t load branches',
                    onRetry: () => ref.invalidate(branchesProvider),
                  ),
                ),
              ],
              _ => [const _BranchListSkeleton()],
            },
          ],
        ),
      ),
    );
  }

  List<Widget> _branchSlivers(
    BuildContext context,
    WidgetRef ref,
    List<BranchSummary> list,
    String? currentId,
  ) {
    final byCity = <String, List<BranchSummary>>{};
    for (final b in list) {
      byCity.putIfAbsent(b.city, () => []).add(b);
    }
    final cities = byCity.keys.toList()..sort();
    return [
      for (final city in cities) ...[
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x4, Space.gutter, Space.x2),
          sliver: SliverToBoxAdapter(
            child: Semantics(
              header: true,
              child: Text(
                city.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall
                    ?.copyWith(letterSpacing: 1.6, color: context.colors.bronze400),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
          sliver: SliverList.separated(
            itemCount: byCity[city]!.length,
            separatorBuilder: (_, _) => const SizedBox(height: Space.x3),
            itemBuilder: (context, i) {
              final branch = byCity[city]![i];
              return BranchCard(
                branch: branch,
                selected: branch.id == currentId,
                onTap: () => _choose(context, ref, branch),
                onInfo: () => context.push(Routes.branchInfo(branch.id)),
              );
            },
          ),
        ),
      ],
      const SliverToBoxAdapter(child: SizedBox(height: Space.x12)),
    ];
  }

  Future<void> _choose(BuildContext context, WidgetRef ref, BranchSummary branch) async {
    final current = ref.read(orderSessionProvider);
    final type = await showOrderTypeSheet(
      context,
      branch: branch,
      current: current?.branchId == branch.id ? current?.orderType : null,
    );
    if (type == null || !context.mounted) return;
    final moved = await switchBranch(context, ref, branch, type);
    if (!moved || !context.mounted) return;
    context.go(Routes.menu);
  }
}

class BranchCard extends StatelessWidget {
  const BranchCard({
    super.key,
    required this.branch,
    required this.onTap,
    this.onInfo,
    this.selected = false,
  });

  final BranchSummary branch;
  final VoidCallback onTap;
  final VoidCallback? onInfo;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final services = branch.services.orderTypes;
    return Material(
      color: c.ink800,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.cardAll,
        side: BorderSide(color: selected ? c.bronze400 : c.border, width: selected ? 1.5 : 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Space.x4, Space.x4, Space.x2, Space.x4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(branch.name, style: t.titleMedium),
                    if (branch.area != null) ...[
                      const SizedBox(height: 2),
                      Text(branch.area!, style: t.bodyMedium),
                    ],
                    const SizedBox(height: Space.x3),
                    StatusBadge.branch(
                      acceptingOrders: branch.status.acceptingOrders,
                      isOpen: branch.status.isOpen,
                      label: branch.status.label,
                    ),
                    const SizedBox(height: Space.x3),
                    Wrap(
                      spacing: Space.x2,
                      runSpacing: Space.x2,
                      children: [for (final s in services) _ServiceTag(type: s)],
                    ),
                    if (branch.services.delivery) ...[
                      const SizedBox(height: Space.x3),
                      Text(
                        'Delivery ${branch.deliveryFeeMoney.format()} · minimum ${branch.minDeliveryOrderMoney.format()}'
                        '${branch.estimatedDeliveryMinutes > 0 ? ' · about ${branch.estimatedDeliveryMinutes} min' : ''}',
                        style: t.bodySmall,
                      ),
                    ],
                    if (selected) ...[
                      const SizedBox(height: Space.x2),
                      Text('Your current branch', style: t.labelSmall?.copyWith(color: c.bronze400)),
                    ],
                  ],
                ),
              ),
              if (onInfo != null)
                IconButton(
                  tooltip: 'Branch details for ${branch.name}',
                  onPressed: onInfo,
                  icon: const Icon(Icons.info_outline_rounded),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceTag extends StatelessWidget {
  const _ServiceTag({required this.type});

  final OrderType type;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Space.x2 + 2, vertical: Space.x1),
      decoration: BoxDecoration(
        color: c.creamSurface,
        borderRadius: BorderRadius.circular(Radii.pill),
        border: Border.all(color: c.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(orderTypeIcon(type), size: 14, color: c.cream200),
          const SizedBox(width: Space.x1),
          Text(type.label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: c.cream50)),
        ],
      ),
    );
  }
}

IconData orderTypeIcon(OrderType type) => switch (type) {
  OrderType.delivery => Icons.delivery_dining_rounded,
  OrderType.pickup => Icons.shopping_bag_outlined,
  OrderType.dineIn => Icons.restaurant_rounded,
  _ => Icons.receipt_long_rounded,
};

class _BranchListSkeleton extends StatelessWidget {
  const _BranchListSkeleton();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Space.gutter, vertical: Space.x4),
      sliver: SliverList.separated(
        itemCount: 4,
        separatorBuilder: (_, _) => const SizedBox(height: Space.x3),
        itemBuilder: (_, _) => SkeletonPulse(
          child: Container(
            padding: const EdgeInsets.all(Space.x4),
            decoration: BoxDecoration(
              borderRadius: Radii.cardAll,
              border: Border.all(color: context.colors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLine(widthFactor: 0.6, style: t.titleMedium),
                SkeletonLine(widthFactor: 0.3, style: t.bodyMedium),
                const SizedBox(height: Space.x3),
                const SkeletonBox(width: 150, height: 26, radius: Radii.pill),
                const SizedBox(height: Space.x3),
                const Row(
                  children: [
                    SkeletonBox(width: 80, height: 24, radius: Radii.pill),
                    SizedBox(width: Space.x2),
                    SkeletonBox(width: 70, height: 24, radius: Radii.pill),
                  ],
                ),
                const SizedBox(height: Space.x3),
                SkeletonLine(widthFactor: 0.8, style: t.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
