import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../app/router.dart';
import '../../../core/money/money.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/controls.dart';
import '../../../core/widgets/panels.dart';
import '../../../core/widgets/skeleton.dart';
import '../../branches/application/order_session.dart';
import '../../cart/application/cart_controller.dart';
import '../../cart/domain/cart.dart';
import '../data/menu_repository.dart';
import '../domain/menu.dart';
import '../domain/option_selection.dart';

class ItemDetailScreen extends ConsumerWidget {
  const ItemDetailScreen({super.key, required this.itemId, this.editLineId});

  final String itemId;

  /// When set, the screen edits that cart line instead of adding a new one.
  final String? editLineId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchId = ref.watch(orderSessionProvider.select((s) => s?.branchId));
    if (branchId == null) {
      return Scaffold(
        appBar: AppBar(),
        body: MessagePanel(
          icon: Icons.storefront_outlined,
          title: 'Choose a branch first',
          message: 'Prices and availability depend on the branch.',
          actionLabel: 'Choose branch',
          onAction: () => context.go(Routes.branches),
        ),
      );
    }
    final detail = ref.watch(menuItemDetailProvider((itemId: itemId, branchId: branchId)));
    return switch (detail) {
      AsyncData(:final value) => ItemCustomizer(
        key: ValueKey(value.id),
        item: value,
        editLine: editLineId == null
            ? null
            : ref.read(cartProvider).where((l) => l.lineId == editLineId).firstOrNull,
      ),
      AsyncError(:final error) => Scaffold(
        appBar: AppBar(),
        body: MessagePanel.failure(
          error,
          title: 'Couldn’t load this dish',
          onRetry: () => ref.invalidate(menuItemDetailProvider((itemId: itemId, branchId: branchId))),
        ),
      ),
      _ => const _DetailSkeleton(),
    };
  }
}

/// Gallery, option groups, quantity, notes and the sticky "Add · Rs X" button.
class ItemCustomizer extends ConsumerStatefulWidget {
  const ItemCustomizer({super.key, required this.item, this.editLine});

  final MenuItemDetail item;
  final CartLine? editLine;

  @override
  ConsumerState<ItemCustomizer> createState() => _ItemCustomizerState();
}

class _ItemCustomizerState extends ConsumerState<ItemCustomizer> {
  late OptionSelection _selection;
  late int _quantity;
  late final TextEditingController _notes;

  @override
  void initState() {
    super.initState();
    final line = widget.editLine;
    _selection = line == null
        ? OptionSelection.initial(widget.item)
        : OptionSelection.fromLine(widget.item, line);
    _quantity = line?.quantity ?? 1;
    _notes = TextEditingController(text: line?.notes ?? '');
  }

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  void _submit() {
    final item = widget.item;
    final notes = _notes.text.trim();
    final line = CartLine(
      lineId: widget.editLine?.lineId ?? const Uuid().v4(),
      menuItemId: item.id,
      name: item.name,
      imageUrl: item.imageUrl,
      unitPrice: item.price,
      quantity: _quantity,
      options: _selection.cartOptions,
      notes: notes.isEmpty ? null : notes,
    );
    final cart = ref.read(cartProvider.notifier);
    final editing = widget.editLine != null;
    if (editing) {
      cart.replace(widget.editLine!.lineId, line);
    } else {
      cart.add(line);
    }
    final messenger = ScaffoldMessenger.of(context);
    Navigator.of(context).maybePop();
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(editing ? 'Updated ${item.name}' : 'Added ${item.name} to cart'),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final total = _selection.unitEstimate * _quantity;
    final reason = !item.isAvailable ? 'Sold out at this branch' : _selection.blockingReason;
    final verb = widget.editLine != null ? 'Update' : 'Add';
    final wide = Breakpoints.isTablet(context);

    final gallery = _Gallery(images: item.images, name: item.name);
    final details = <Widget>[
      Text(item.name, style: t.headlineMedium),
      const SizedBox(height: Space.x2),
      Text(item.priceMoney.format(), style: t.titleMedium?.copyWith(color: c.bronze400)),
      if (item.description.isNotEmpty) ...[
        const SizedBox(height: Space.x3),
        Text(item.description, style: t.bodyLarge?.copyWith(color: c.cream200)),
      ],
      if (!item.isAvailable) ...[
        const SizedBox(height: Space.x4),
        const InlineNotice(
          tone: PanelTone.danger,
          icon: Icons.block_rounded,
          message: 'Sold out at this branch right now.',
        ),
      ],
      for (final group in item.orderedGroups) ...[
        const SizedBox(height: Space.x6),
        _GroupSection(
          group: group,
          selection: _selection,
          onToggle: (o) => setState(() => _selection = _selection.toggle(group, o)),
        ),
      ],
      const SizedBox(height: Space.x6),
      Text('Quantity', style: t.titleSmall),
      const SizedBox(height: Space.x2),
      Align(
        alignment: Alignment.centerLeft,
        child: QuantityStepper(
          value: _quantity,
          max: CartLine.maxQuantity,
          itemName: item.name,
          onChanged: (q) => setState(() => _quantity = q),
        ),
      ),
      const SizedBox(height: Space.x6),
      TextField(
        controller: _notes,
        maxLength: CartLine.maxNotesLength,
        maxLines: 3,
        minLines: 1,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          labelText: 'Notes for the kitchen (optional)',
          hintText: 'e.g. medium rare, no onions',
        ),
      ),
      const SizedBox(height: Space.x8),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(item.categoryName, style: t.labelMedium?.copyWith(color: c.cream200)),
        leading: IconButton(
          tooltip: 'Close',
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(padding: const EdgeInsets.all(Space.x6), child: gallery),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(0, Space.x6, Space.x6, 0),
                    children: details,
                  ),
                ),
              ],
            )
          : ListView(
              children: [
                gallery,
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x4, Space.gutter, 0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: details),
                ),
              ],
            ),
      bottomNavigationBar: BottomActionBar(
        above: reason == null
            ? null
            : Semantics(
                liveRegion: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline_rounded, size: 16, color: c.amber500),
                    const SizedBox(width: Space.x1),
                    Flexible(
                      child: Text(
                        reason,
                        textAlign: TextAlign.center,
                        style: t.bodySmall?.copyWith(color: c.cream50),
                      ),
                    ),
                  ],
                ),
              ),
        child: FilledButton(
          key: const Key('customizer-submit'),
          onPressed: reason == null ? _submit : null,
          child: Text('$verb · ${total.format()}', semanticsLabel: '$verb to cart, ${total.spoken}'),
        ),
      ),
    );
  }
}

class _GroupSection extends StatelessWidget {
  const _GroupSection({required this.group, required this.selection, required this.onToggle});

  final MenuOptionGroup group;
  final OptionSelection selection;
  final ValueChanged<MenuOption> onToggle;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final met = selection.chosenIn(group).length >= group.minSelect;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Semantics(header: true, child: Text(group.name, style: t.titleSmall)),
            ),
            if (group.isRequired)
              _RuleTag(
                label: met ? 'Done' : 'Required',
                color: met ? c.sage500 : c.amber500,
                icon: met ? Icons.check_rounded : Icons.priority_high_rounded,
              ),
          ],
        ),
        const SizedBox(height: 2),
        Text(group.ruleLabel, style: t.bodySmall),
        const SizedBox(height: Space.x2),
        for (final option in group.activeOptions)
          _OptionTile(
            option: option,
            single: group.isSingleChoice,
            selected: selection.isSelected(group, option),
            enabled:
                selection.isSelected(group, option) || group.isSingleChoice || selection.canAddMore(group),
            onTap: () => onToggle(option),
          ),
      ],
    );
  }
}

class _RuleTag extends StatelessWidget {
  const _RuleTag({required this.label, required this.color, required this.icon});

  final String label;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: Space.x2, vertical: 2),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.16),
      borderRadius: BorderRadius.circular(Radii.pill),
      border: Border.all(color: color.withValues(alpha: 0.5)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 2),
        Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: context.colors.cream50)),
      ],
    ),
  );
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.option,
    required this.single,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  final MenuOption option;
  final bool single;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final delta = option.priceDelta;
    return Semantics(
      inMutuallyExclusiveGroup: single,
      checked: selected,
      enabled: enabled,
      label: delta > 0 ? '${option.name}, adds ${Money(delta).spoken}' : option.name,
      excludeSemantics: true,
      onTap: enabled ? onTap : null,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: Radii.controlAll,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: Space.minTap + 8),
          child: Opacity(
            opacity: enabled ? 1 : 0.45,
            child: Row(
              children: [
                Icon(
                  single
                      ? (selected ? Icons.radio_button_checked_rounded : Icons.radio_button_unchecked_rounded)
                      : (selected ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded),
                  color: selected ? c.ember500 : c.cream200,
                ),
                const SizedBox(width: Space.x3),
                Expanded(child: Text(option.name, style: t.bodyLarge)),
                if (delta != 0)
                  Text('+${Money(delta).format()}', style: t.labelMedium?.copyWith(color: c.cream200)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Up to three images, swipeable, with a page indicator when there is more than one.
class _Gallery extends StatefulWidget {
  const _Gallery({required this.images, required this.name});

  final List<String> images;
  final String name;

  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final images = widget.images.take(3).toList();
    final c = context.colors;
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: [
          Positioned.fill(
            child: images.length <= 1
                ? AppImage(url: images.firstOrNull, semanticLabel: 'Photo of ${widget.name}', iconSize: 56)
                : PageView.builder(
                    itemCount: images.length,
                    onPageChanged: (p) => setState(() => _page = p),
                    itemBuilder: (_, i) => AppImage(
                      url: images[i],
                      semanticLabel: 'Photo ${i + 1} of ${images.length}: ${widget.name}',
                      iconSize: 56,
                    ),
                  ),
          ),
          if (images.length > 1)
            Positioned(
              bottom: Space.x3,
              left: 0,
              right: 0,
              child: Semantics(
                label: 'Photo ${_page + 1} of ${images.length}',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < images.length; i++)
                      AnimatedContainer(
                        duration: Motion.of(context, Motion.direct),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: i == _page ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: i == _page ? c.cream50 : c.cream50.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(Radii.pill),
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DetailSkeleton extends StatelessWidget {
  const _DetailSkeleton();

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SkeletonPulse(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const AspectRatio(aspectRatio: 4 / 3, child: SkeletonBox(radius: 0)),
            Padding(
              padding: const EdgeInsets.all(Space.gutter),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLine(widthFactor: 0.7, style: t.headlineMedium),
                  const SizedBox(height: Space.x2),
                  SkeletonLine(widthFactor: 0.25, style: t.titleMedium),
                  const SizedBox(height: Space.x3),
                  SkeletonLine(style: t.bodyLarge),
                  SkeletonLine(widthFactor: 0.8, style: t.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
