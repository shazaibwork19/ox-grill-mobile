import 'package:flutter/material.dart';

import '../../../core/domain/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../domain/branch.dart';
import 'branch_select_screen.dart';

/// Asks how the customer wants the order. Offers only the services the branch has.
Future<OrderType?> showOrderTypeSheet(
  BuildContext context, {
  required BranchSummary branch,
  OrderType? current,
}) {
  return showModalBottomSheet<OrderType>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    sheetAnimationStyle: AnimationStyle(
      duration: Motion.of(context, Motion.sheet),
      reverseDuration: Motion.of(context, Motion.sheet),
    ),
    builder: (context) => _OrderTypeSheet(branch: branch, current: current),
  );
}

class _OrderTypeSheet extends StatelessWidget {
  const _OrderTypeSheet({required this.branch, this.current});

  final BranchSummary branch;
  final OrderType? current;

  String _subtitle(OrderType type) => switch (type) {
    OrderType.delivery =>
      '${branch.deliveryFeeMoney.format()} delivery · minimum order ${branch.minDeliveryOrderMoney.format()}'
          '${branch.estimatedDeliveryMinutes > 0 ? ' · about ${branch.estimatedDeliveryMinutes} min' : ''}',
    OrderType.pickup =>
      'Collect from the branch${branch.estimatedPickupMinutes > 0 ? ' · ready in about ${branch.estimatedPickupMinutes} min' : ''}',
    OrderType.dineIn => 'Order for your table at the branch',
    _ => '',
  };

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final c = context.colors;
    final types = branch.services.orderTypes;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('How would you like your order?', style: t.headlineSmall),
          const SizedBox(height: Space.x1),
          Text(branch.name, style: t.bodyMedium),
          if (!branch.status.acceptingOrders) ...[
            const SizedBox(height: Space.x3),
            Text(
              '${branch.status.label}. You can browse the menu, but ordering is paused.',
              style: t.bodyMedium?.copyWith(color: c.amber500),
            ),
          ],
          const SizedBox(height: Space.x4),
          if (types.isEmpty)
            Text('This branch is not taking app orders right now.', style: t.bodyMedium)
          else
            for (final type in types) ...[
              _TypeTile(
                type: type,
                subtitle: _subtitle(type),
                selected: type == current,
                onTap: () => Navigator.of(context).pop(type),
              ),
              const SizedBox(height: Space.x3),
            ],
        ],
      ),
    );
  }
}

class _TypeTile extends StatelessWidget {
  const _TypeTile({required this.type, required this.subtitle, required this.onTap, this.selected = false});

  final OrderType type;
  final String subtitle;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: c.ink800,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.cardAll,
          side: BorderSide(color: selected ? c.ember500 : c.border, width: selected ? 2 : 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(Space.x4),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: c.ember600.withValues(alpha: 0.16),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(orderTypeIcon(type), color: c.cream50),
                ),
                const SizedBox(width: Space.x4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(type.label, style: t.titleSmall),
                      if (subtitle.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(subtitle, style: t.bodySmall),
                      ],
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: c.cream200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
