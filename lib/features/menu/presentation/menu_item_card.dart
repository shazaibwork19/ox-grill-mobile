import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/controls.dart';
import '../../../core/widgets/skeleton.dart';
import '../domain/menu.dart';

/// Fixed-height product card. The height depends only on the text scale, so
/// the menu can compute where every category section starts (scroll-spy and
/// tap-to-scroll without measuring off-screen widgets).
class MenuItemCard extends StatelessWidget {
  const MenuItemCard({super.key, required this.item, required this.onOpen, required this.onAdd});

  final MenuItem item;
  final VoidCallback onOpen;

  /// Adds directly (no options) or opens the customizer (has options).
  final VoidCallback onAdd;

  static const double _pad = Space.x3;
  static const double rowGap = Space.x3;

  static double imageWidth(BuildContext context) => MediaQuery.sizeOf(context).width < 360 ? 104 : 120;

  /// Total slot height including the gap below the card.
  static double extentFor(BuildContext context) {
    final s = MediaQuery.textScalerOf(context);
    final name = s.scale(TypeScale.md) * TypeScale.labelHeight * 2;
    final desc = s.scale(TypeScale.sm) * TypeScale.bodyHeight * 2;
    const actions = Space.minTap;
    final text = _pad + name + Space.x1 + desc + Space.x2 + actions + _pad;
    final image = _pad + imageWidth(context) * 3 / 4 + _pad;
    return math.max(text, image).ceilToDouble() + 2 + rowGap;
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final available = item.isAvailable;
    final imgW = imageWidth(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: rowGap),
      child: Semantics(
        button: true,
        label: '${item.name}, ${item.priceMoney.spoken}${available ? '' : ', sold out'}',
        child: Material(
          color: c.ink800,
          shape: RoundedRectangleBorder(
            borderRadius: Radii.cardAll,
            side: BorderSide(color: c.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onOpen,
            child: Opacity(
              opacity: available ? 1 : 0.55,
              child: Padding(
                padding: const EdgeInsets.all(_pad),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExcludeSemantics(
                            child: Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: t.titleSmall,
                            ),
                          ),
                          const SizedBox(height: Space.x1),
                          Text(
                            item.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: t.bodyMedium,
                          ),
                          const Spacer(),
                          SizedBox(
                            height: Space.minTap,
                            child: LayoutBuilder(
                              builder: (context, box) => Row(
                                children: [
                                  Expanded(
                                    child: ExcludeSemantics(
                                      child: Text(
                                        item.priceMoney.format(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: t.titleSmall?.copyWith(color: c.cream50),
                                      ),
                                    ),
                                  ),
                                  if (available)
                                    _AddButton(
                                      hasOptions: item.hasOptions,
                                      name: item.name,
                                      onTap: onAdd,
                                      // Narrow cards (small phones, large text) get an icon-only button.
                                      compact: box.maxWidth < 200,
                                    )
                                  else
                                    Flexible(
                                      child: Pill(
                                        label: 'Sold out',
                                        icon: Icons.block_rounded,
                                        color: c.danger500,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Space.x3),
                    ClipRRect(
                      borderRadius: Radii.controlAll,
                      child: SizedBox(
                        width: imgW,
                        height: imgW * 3 / 4,
                        child: AppImage(url: item.imageUrl, semanticLabel: item.name, iconSize: 28),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.hasOptions, required this.name, required this.onTap, this.compact = false});

  final bool hasOptions;
  final String name;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final label = hasOptions ? 'Choose' : 'Add';
    if (compact) {
      return IconButton.outlined(
        tooltip: hasOptions ? 'Choose options for $name' : 'Add $name to cart',
        onPressed: onTap,
        icon: Icon(hasOptions ? Icons.tune_rounded : Icons.add_rounded),
      );
    }
    return Semantics(
      label: hasOptions ? 'Choose options for $name' : 'Add $name to cart',
      button: true,
      excludeSemantics: true,
      child: OutlinedButton.icon(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: Space.x3),
          minimumSize: const Size(Space.minTap, Space.minTap),
          visualDensity: VisualDensity.compact,
        ),
        icon: Icon(hasOptions ? Icons.tune_rounded : Icons.add_rounded, size: 18),
        label: Text(label),
      ),
    );
  }
}

/// Skeleton with the same geometry as [MenuItemCard].
class MenuItemCardSkeleton extends StatelessWidget {
  const MenuItemCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final imgW = MenuItemCard.imageWidth(context);
    return SizedBox(
      height: MenuItemCard.extentFor(context),
      child: Padding(
        padding: const EdgeInsets.only(bottom: MenuItemCard.rowGap),
        child: Container(
          padding: const EdgeInsets.all(Space.x3),
          decoration: BoxDecoration(
            borderRadius: Radii.cardAll,
            border: Border.all(color: context.colors.border),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonLine(widthFactor: 0.7, style: t.titleSmall),
                    const SizedBox(height: Space.x1),
                    SkeletonLine(style: t.bodyMedium),
                    SkeletonLine(widthFactor: 0.55, style: t.bodyMedium),
                    const Spacer(),
                    const Row(
                      children: [
                        Flexible(child: SkeletonBox(width: 72, height: 20)),
                        Spacer(),
                        Flexible(child: SkeletonBox(width: 76, height: 40)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Space.x3),
              SkeletonBox(width: imgW, height: imgW * 3 / 4),
            ],
          ),
        ),
      ),
    );
  }
}
