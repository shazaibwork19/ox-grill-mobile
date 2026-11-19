import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../app/router.dart';
import '../../../core/domain/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/brand.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/skeleton.dart';
import '../../branches/application/order_session.dart';
import '../../branches/domain/branch.dart';
import '../../branches/presentation/branch_select_screen.dart';
import '../../cart/application/cart_controller.dart';
import '../../cart/domain/cart.dart';
import '../../cart/presentation/cart_bar.dart';
import '../data/menu_repository.dart';
import '../domain/menu.dart';
import 'menu_item_card.dart';
import 'menu_layout.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(orderSessionProvider);
    if (session == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) context.go(Routes.branches);
      });
      return const Scaffold();
    }
    final branch = ref.watch(selectedBranchProvider).value;
    final menu = ref.watch(menuProvider(session.branchId));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: math.max(64, MediaQuery.textScalerOf(context).scale(18) * 1.25 + 34),
        title: _SessionHeader(session: session, branch: branch),
        actions: [
          IconButton(
            tooltip: 'Order status',
            icon: const Icon(Icons.receipt_long_rounded),
            onPressed: () => context.push(Routes.orders),
          ),
          IconButton(
            tooltip: 'Branch details',
            icon: const Icon(Icons.storefront_outlined),
            onPressed: () => context.push(Routes.branchInfo(session.branchId)),
          ),
        ],
      ),
      body: switch (menu) {
        AsyncData(:final value) => _MenuBody(menu: value, branch: branch, session: session),
        AsyncError(:final error) => MessagePanel.failure(
          error,
          title: 'Couldn’t load the menu',
          onRetry: () => ref.invalidate(menuProvider(session.branchId)),
        ),
        _ => const _MenuSkeleton(),
      },
      bottomNavigationBar: const CartBar(),
    );
  }
}

/// "Delivery from · Ox & Grill F-7 Markaz ▾": tap to change type or branch.
class _SessionHeader extends ConsumerWidget {
  const _SessionHeader({required this.session, required this.branch});

  final OrderSession session;
  final BranchSummary? branch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final from = switch (session.orderType) {
      OrderType.delivery => 'Delivery from',
      OrderType.pickup => 'Pickup at',
      OrderType.dineIn => 'Dine-in at',
      _ => 'Ordering from',
    };
    return Semantics(
      button: true,
      label: '$from ${branch?.name ?? session.branchName}. Change order type or branch',
      excludeSemantics: true,
      child: InkWell(
        borderRadius: Radii.controlAll,
        onTap: () => _showSessionSheet(context, ref),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: Space.minTap),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Space.x1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(orderTypeIcon(session.orderType), size: 14, color: c.bronze400),
                    const SizedBox(width: Space.x1),
                    Flexible(
                      child: Text(from, style: t.labelSmall?.copyWith(color: c.bronze400)),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        branch?.name ?? session.branchName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: t.titleMedium,
                      ),
                    ),
                    const Icon(Icons.expand_more_rounded, size: 22),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showSessionSheet(BuildContext context, WidgetRef ref) async {
    final b = branch;
    await showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      sheetAnimationStyle: AnimationStyle(duration: Motion.of(context, Motion.sheet)),
      builder: (sheetContext) {
        final t = Theme.of(sheetContext).textTheme;
        final types = b?.services.orderTypes ?? [session.orderType];
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Your order', style: t.headlineSmall),
              const SizedBox(height: Space.x1),
              Text(b?.name ?? session.branchName, style: t.bodyMedium),
              const SizedBox(height: Space.x4),
              Text('Order type', style: t.labelMedium),
              const SizedBox(height: Space.x2),
              Wrap(
                spacing: Space.x2,
                runSpacing: Space.x2,
                children: [
                  for (final type in types)
                    ChoiceChip(
                      avatar: Icon(
                        orderTypeIcon(type),
                        size: 18,
                        color: type == session.orderType ? context.colors.ink950 : context.colors.cream200,
                      ),
                      label: Text(type.label),
                      selected: type == session.orderType,
                      onSelected: (_) {
                        ref.read(orderSessionProvider.notifier).setOrderType(type);
                        Navigator.pop(sheetContext);
                      },
                    ),
                ],
              ),
              const SizedBox(height: Space.x6),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(sheetContext);
                  context.push(Routes.changeBranch());
                },
                icon: const Icon(Icons.swap_horiz_rounded),
                label: const Text('Change branch'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MenuBody extends ConsumerStatefulWidget {
  const _MenuBody({required this.menu, required this.branch, required this.session});

  final MenuResponse menu;
  final BranchSummary? branch;
  final OrderSession session;

  @override
  ConsumerState<_MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends ConsumerState<_MenuBody> {
  final _scroll = ScrollController();
  final _search = TextEditingController();
  final _heroKey = GlobalKey();
  final _chipKeys = <int, GlobalKey>{};
  double _heroHeight = 0;
  int _active = 0;
  bool _jumping = false;
  late List<MenuSection> _sections;

  @override
  void initState() {
    super.initState();
    _sections = buildSections(widget.menu);
    _scroll.addListener(_onScroll);
    _search.addListener(_onSearchChanged);
  }

  String _lastQuery = '';

  void _onSearchChanged() {
    final query = _search.text.trim();
    final started = _lastQuery.isEmpty && query.isNotEmpty;
    _lastQuery = query;
    setState(() {});
    // Results start right under the pinned search field.
    if (started && _scroll.hasClients) {
      _measureHero();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scroll.hasClients) _scroll.jumpTo(_heroHeight.clamp(0, _scroll.position.maxScrollExtent));
      });
    }
  }

  @override
  void didUpdateWidget(covariant _MenuBody old) {
    super.didUpdateWidget(old);
    if (old.menu != widget.menu) _sections = buildSections(widget.menu);
  }

  @override
  void dispose() {
    _scroll.dispose();
    _search.dispose();
    super.dispose();
  }

  MenuGeometry _geometry(BuildContext context) => MenuGeometry(
    itemCounts: [for (final s in _sections) s.items.length],
    columns: Breakpoints.isTablet(context) ? 2 : 1,
    headerExtent: _SectionHeader.extentFor(context),
    itemExtent: MenuItemCard.extentFor(context),
    sectionGap: Space.x2,
  );

  void _measureHero() {
    final box = _heroKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null && box.hasSize && box.size.height != _heroHeight) _heroHeight = box.size.height;
  }

  void _onScroll() {
    if (_jumping || _search.text.isNotEmpty || _sections.isEmpty) return;
    _measureHero();
    final index = _geometry(context).activeIndexAt(_scroll.offset - _heroHeight);
    if (index != _active) {
      setState(() => _active = index);
      _revealChip(index);
    }
  }

  void _revealChip(int index) {
    final ctx = _chipKeys[index]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx, alignment: 0.5, duration: Motion.of(context, Motion.direct));
    }
  }

  Future<void> _jumpTo(int index) async {
    _measureHero();
    final target = (_heroHeight + _geometry(context).offsetOf(index)).clamp(
      0.0,
      _scroll.position.maxScrollExtent,
    );
    setState(() => _active = index);
    _revealChip(index);
    _jumping = true;
    final duration = Motion.of(context, Motion.sheet);
    if (duration == Duration.zero) {
      _scroll.jumpTo(target);
    } else {
      await _scroll.animateTo(target, duration: duration, curve: Curves.easeOutCubic);
    }
    _jumping = false;
  }

  void _open(MenuItem item) => context.push(Routes.item(item.id));

  void _quickAdd(MenuItem item) {
    if (item.hasOptions) return _open(item);
    ref
        .read(cartProvider.notifier)
        .add(
          CartLine(
            lineId: const Uuid().v4(),
            menuItemId: item.id,
            name: item.name,
            imageUrl: item.imageUrl,
            unitPrice: item.price,
            quantity: 1,
          ),
        );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('Added ${item.name} to cart'), duration: const Duration(seconds: 2)),
      );
  }

  @override
  Widget build(BuildContext context) {
    final query = _search.text.trim();
    final tablet = Breakpoints.isTablet(context);
    final geometry = _geometry(context);
    final pinnedExtent = _PinnedHeader.extentFor(context, hasChips: query.isEmpty);
    final itemExtent = MenuItemCard.extentFor(context);

    Widget itemsSliver(List<MenuItem> items) => tablet
        ? SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Space.x3,
              mainAxisExtent: itemExtent,
            ),
            itemCount: items.length,
            itemBuilder: (_, i) =>
                MenuItemCard(item: items[i], onOpen: () => _open(items[i]), onAdd: () => _quickAdd(items[i])),
          )
        : SliverFixedExtentList.builder(
            itemExtent: itemExtent,
            itemCount: items.length,
            itemBuilder: (_, i) =>
                MenuItemCard(item: items[i], onOpen: () => _open(items[i]), onAdd: () => _quickAdd(items[i])),
          );

    final results = query.isEmpty ? const <MenuItem>[] : searchItems(widget.menu, query);

    return LayoutBuilder(
      builder: (context, constraints) {
        final lastExtent = _sections.isEmpty ? 0.0 : geometry.extentOf(_sections.length - 1);
        // Enough room at the end that the last section can scroll to the top.
        final tail = math.max(Space.x8, constraints.maxHeight - pinnedExtent - lastExtent);
        return CustomScrollView(
          controller: _scroll,
          slivers: [
            SliverToBoxAdapter(
              child: KeyedSubtree(
                key: _heroKey,
                child: _Hero(menu: widget.menu, branch: widget.branch, onOpen: _open),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _PinnedHeader(
                extent: pinnedExtent,
                search: _search,
                sections: query.isEmpty ? _sections : const [],
                active: _active,
                chipKeys: _chipKeys,
                onChip: _jumpTo,
              ),
            ),
            if (query.isNotEmpty) ...[
              if (results.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: MessagePanel(
                    icon: Icons.search_off_rounded,
                    title: 'No dishes found',
                    message:
                        'Nothing on this menu matches “$query”. Try another word, like “steak” or “fries”.',
                    actionLabel: 'Clear search',
                    onAction: _search.clear,
                  ),
                )
              else ...[
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x3, Space.gutter, Space.x2),
                  sliver: SliverToBoxAdapter(
                    child: Semantics(
                      liveRegion: true,
                      child: Text(
                        '${results.length} ${results.length == 1 ? 'dish' : 'dishes'} found',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
                  sliver: itemsSliver(results),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: Space.x8)),
              ],
            ] else if (_sections.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: MessagePanel(
                  icon: Icons.no_food_outlined,
                  title: 'The menu is empty',
                  message: 'This branch has no dishes listed right now. Please try another branch.',
                ),
              )
            else ...[
              for (final section in _sections) ...[
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: geometry.headerExtent,
                    child: _SectionHeader(category: section.category, count: section.items.length),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
                  sliver: itemsSliver(section.items),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: Space.x2)),
              ],
              SliverToBoxAdapter(child: SizedBox(height: tail)),
            ],
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.category, required this.count});

  final MenuCategory category;
  final int count;

  static double extentFor(BuildContext context) =>
      (Space.x6 + MediaQuery.textScalerOf(context).scale(TypeScale.xl) * 1.2 + Space.x3).ceilToDouble();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x6, Space.gutter, Space.x3),
      child: Semantics(
        header: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: t.headlineSmall?.copyWith(height: 1.2),
              ),
            ),
            Text('$count', style: t.labelSmall),
          ],
        ),
      ),
    );
  }
}

/// Search field plus category chips; stays pinned under the app bar.
class _PinnedHeader extends SliverPersistentHeaderDelegate {
  _PinnedHeader({
    required this.extent,
    required this.search,
    required this.sections,
    required this.active,
    required this.chipKeys,
    required this.onChip,
  });

  final double extent;
  final TextEditingController search;
  final List<MenuSection> sections;
  final int active;
  final Map<int, GlobalKey> chipKeys;
  final ValueChanged<int> onChip;

  static double _fieldHeight(BuildContext context) =>
      math.max(Space.minTap, 24 + MediaQuery.textScalerOf(context).scale(TypeScale.md) * 1.25 + 4);

  static double _chipsHeight(BuildContext context) => math.max(
    Space.minTap,
    MediaQuery.textScalerOf(context).scale(TypeScale.sm) * TypeScale.labelHeight + 20,
  );

  static double extentFor(BuildContext context, {required bool hasChips}) =>
      (Space.x2 + _fieldHeight(context) + Space.x2 + (hasChips ? _chipsHeight(context) + Space.x2 : 0))
          .ceilToDouble();

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(covariant _PinnedHeader old) =>
      old.extent != extent || old.active != active || old.sections != sections || old.search != search;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final c = context.colors;
    return Material(
      color: c.ink950,
      elevation: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: overlapsContent || shrinkOffset > 0 ? Border(bottom: BorderSide(color: c.border)) : null,
        ),
        child: ClipRect(
          child: Column(
            children: [
              const SizedBox(height: Space.x2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
                child: SizedBox(
                  height: _fieldHeight(context),
                  child: _SearchField(controller: search),
                ),
              ),
              const SizedBox(height: Space.x2),
              if (sections.isNotEmpty)
                SizedBox(
                  height: _chipsHeight(context),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
                    child: Row(
                      children: [
                        for (var i = 0; i < sections.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: Space.x2),
                            child: _CategoryChip(
                              key: chipKeys.putIfAbsent(i, GlobalKey.new),
                              label: sections[i].category.name,
                              selected: i == active,
                              onTap: () => onChip(i),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.25),
      decoration: InputDecoration(
        // Visually the icon and placeholder carry it; screen readers get the label.
        hintText: 'Search the menu, e.g. steak',
        semanticCounterText: '',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(horizontal: Space.x4, vertical: Space.x3),
        prefixIcon: const Icon(Icons.search_rounded, semanticLabel: 'Search the menu'),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                tooltip: 'Clear search',
                icon: const Icon(Icons.close_rounded),
                onPressed: controller.clear,
              ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({super.key, required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      selected: selected,
      label: 'Jump to $label',
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Radii.pill),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: Space.minTap),
          child: Center(
            child: AnimatedContainer(
              duration: Motion.of(context, Motion.direct),
              padding: const EdgeInsets.symmetric(horizontal: Space.x4, vertical: Space.x2),
              decoration: BoxDecoration(
                color: selected ? c.cream50 : c.creamSurface,
                borderRadius: BorderRadius.circular(Radii.pill),
                border: Border.all(color: selected ? c.cream50 : c.border),
              ),
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelMedium
                    ?.copyWith(color: selected ? c.ink950 : c.cream50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Brand header + branch notice + "Chef's picks" (featured items). The API has
/// no banner/campaign endpoint, so this uses brand type and the featured dishes.
class _Hero extends StatelessWidget {
  const _Hero({required this.menu, required this.branch, required this.onOpen});

  final MenuResponse menu;
  final BranchSummary? branch;
  final ValueChanged<MenuItem> onOpen;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final featured = menu.items.where((i) => i.isFeatured && i.isAvailable).take(10).toList();
    final b = branch;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x6, Space.gutter, Space.x4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Wordmark(size: 36, showTagline: true),
              const SizedBox(height: Space.x3),
              Text(
                'Prime cuts, flame-grilled. Order for delivery, pickup or your table.',
                style: t.bodyMedium,
              ),
              if (b != null && !b.status.acceptingOrders) ...[
                const SizedBox(height: Space.x4),
                InlineNotice(
                  tone: PanelTone.warning,
                  icon: Icons.pause_circle_outline_rounded,
                  message: '${b.status.label}. You can browse, but ${b.name} isn’t taking orders right now.',
                ),
              ],
            ],
          ),
        ),
        if (featured.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x3),
            child: Semantics(
              header: true,
              child: Text('Chef’s picks', style: t.titleMedium?.copyWith(color: c.bronze400)),
            ),
          ),
          SizedBox(
            height:
                150 +
                MediaQuery.textScalerOf(context).scale(TypeScale.sm) * TypeScale.labelHeight * 2 +
                Space.x3,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
              itemCount: featured.length,
              separatorBuilder: (_, _) => const SizedBox(width: Space.x3),
              itemBuilder: (_, i) => _FeaturedCard(item: featured[i], onTap: () => onOpen(featured[i])),
            ),
          ),
        ],
        const SizedBox(height: Space.x2),
      ],
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({required this.item, required this.onTap});

  final MenuItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Semantics(
      button: true,
      label: '${item.name}, ${item.priceMoney.spoken}',
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: Radii.cardAll,
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: Radii.cardAll,
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppImage(url: item.imageUrl, semanticLabel: item.name),
                      Positioned(
                        left: Space.x2,
                        bottom: Space.x2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: Space.x2, vertical: Space.x1),
                          decoration: BoxDecoration(
                            color: context.colors.ink950.withValues(alpha: 0.85),
                            borderRadius: BorderRadius.circular(Radii.pill),
                          ),
                          child: Text(item.priceMoney.format(), style: t.labelMedium),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Space.x2),
              Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: t.labelMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuSkeleton extends StatelessWidget {
  const _MenuSkeleton();

  @override
  Widget build(BuildContext context) {
    return SkeletonPulse(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: Space.gutter),
        children: [
          const SizedBox(height: Space.x6),
          const SkeletonBox(width: 220, height: 40),
          const SizedBox(height: Space.x3),
          SkeletonLine(widthFactor: 0.9, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: Space.x4),
          const SkeletonBox(height: Space.minTap),
          const SizedBox(height: Space.x3),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            child: Row(
              children: [
                SkeletonBox(width: 90, height: 36, radius: Radii.pill),
                SizedBox(width: Space.x2),
                SkeletonBox(width: 110, height: 36, radius: Radii.pill),
                SizedBox(width: Space.x2),
                SkeletonBox(width: 80, height: 36, radius: Radii.pill),
              ],
            ),
          ),
          const SizedBox(height: Space.x6),
          const SkeletonBox(width: 160, height: 26),
          const SizedBox(height: Space.x3),
          for (var i = 0; i < 4; i++) const MenuItemCardSkeleton(),
        ],
      ),
    );
  }
}
