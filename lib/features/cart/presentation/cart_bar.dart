import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../application/cart_controller.dart';
import '../application/quote_provider.dart';
import '../domain/cart.dart';
import 'cart_sheet.dart';

/// Persistent bar at the bottom of the menu: item count + total, opens the cart.
class CartBar extends ConsumerWidget {
  const CartBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lines = ref.watch(cartProvider);
    if (lines.isEmpty) return const SizedBox.shrink();
    final quote = ref.watch(quoteProvider);
    final c = context.colors;
    final t = Theme.of(context).textTheme;

    final serverTotal = !quote.isLoading && !quote.hasError ? quote.value?.totals.totalMoney : null;
    final amount = serverTotal ?? lines.estimatedSubtotal;
    final caption = serverTotal != null ? 'Total' : 'Estimated subtotal';
    final count = lines.itemCount;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.ink900,
        border: Border(top: BorderSide(color: c.border)),
        boxShadow: [BoxShadow(color: c.shadow, blurRadius: 24, offset: const Offset(0, -6))],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Space.gutter, Space.x3, Space.gutter, Space.x3),
          child: Semantics(
            button: true,
            label: 'View cart, $count ${count == 1 ? 'item' : 'items'}, $caption ${amount.spoken}',
            excludeSemantics: true,
            child: Material(
              color: c.ember600,
              borderRadius: Radii.controlAll,
              child: InkWell(
                borderRadius: Radii.controlAll,
                onTap: () => openCart(context),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 56),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Space.x4, vertical: Space.x2),
                    child: Row(
                      children: [
                        Container(
                          constraints: const BoxConstraints(minWidth: 32),
                          padding: const EdgeInsets.symmetric(horizontal: Space.x2, vertical: Space.x1),
                          decoration: BoxDecoration(
                            color: c.ink950.withValues(alpha: 0.28),
                            borderRadius: BorderRadius.circular(Radii.pill),
                          ),
                          child: Text('$count', textAlign: TextAlign.center, style: t.labelMedium),
                        ),
                        const SizedBox(width: Space.x3),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('View cart', style: t.labelLarge),
                              Text(caption, style: t.labelSmall?.copyWith(color: c.cream50)),
                            ],
                          ),
                        ),
                        const SizedBox(width: Space.x2),
                        Text(amount.format(), style: t.titleSmall),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
