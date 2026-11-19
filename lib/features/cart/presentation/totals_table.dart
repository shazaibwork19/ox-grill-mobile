import 'package:flutter/material.dart';

import '../../../core/domain/enums.dart';
import '../../../core/domain/pricing.dart';
import '../../../core/money/money.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';

/// Server totals: subtotal, discount, delivery fee, tax, total.
class TotalsTable extends StatelessWidget {
  const TotalsTable({
    super.key,
    required this.totals,
    this.paymentMethod,
    this.updating = false,
    this.orderType,
  });

  final Totals totals;
  final PaymentMethod? paymentMethod;
  final OrderType? orderType;

  /// A newer quote is loading; numbers are shown dimmed until it arrives.
  final bool updating;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final taxNote = paymentMethod == null
        ? totals.taxRateLabel
        : '${totals.taxRateLabel}, ${paymentMethod!.label.toLowerCase()}';
    return AnimatedOpacity(
      opacity: updating ? 0.55 : 1,
      duration: Motion.of(context, Motion.direct),
      child: Container(
        padding: const EdgeInsets.all(Space.x4),
        decoration: BoxDecoration(
          color: c.ink800,
          borderRadius: Radii.cardAll,
          border: Border.all(color: c.border),
        ),
        child: Column(
          children: [
            _Row(label: 'Subtotal', value: totals.subtotalMoney),
            if (totals.discountTotal > 0)
              _Row(label: 'Discount', value: Money(-totals.discountTotal), color: c.bronze400),
            if (totals.deliveryFee > 0 || orderType == OrderType.delivery)
              _Row(label: 'Delivery fee', value: totals.deliveryFeeMoney),
            _Row(label: 'Tax ($taxNote)', value: totals.taxMoney),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Space.x2),
              child: Divider(color: c.border),
            ),
            _Row(label: 'Total', value: totals.totalMoney, emphasis: true),
            if (updating)
              Padding(
                padding: const EdgeInsets.only(top: Space.x2),
                child: Semantics(
                  liveRegion: true,
                  child: Text('Updating totals…', style: Theme.of(context).textTheme.bodySmall),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Shown before the server quote arrives: only the on-device subtotal, clearly
/// labelled, with tax and fees left to the server.
class EstimateTable extends StatelessWidget {
  const EstimateTable({super.key, required this.subtotal, this.loading = false});

  final Money subtotal;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(Space.x4),
      decoration: BoxDecoration(
        color: c.ink800,
        borderRadius: Radii.cardAll,
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Row(label: 'Estimated subtotal', value: subtotal),
          const SizedBox(height: Space.x2),
          Row(
            children: [
              if (loading) ...[
                SizedBox.square(
                  dimension: 14,
                  child: CircularProgressIndicator(strokeWidth: 2, color: c.cream200),
                ),
                const SizedBox(width: Space.x2),
              ],
              Expanded(
                child: Text(
                  loading
                      ? 'Getting tax, fees and the final total from the branch…'
                      : 'Tax and fees are calculated by the branch.',
                  style: t.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value, this.emphasis = false, this.color});

  final String label;
  final Money value;
  final bool emphasis;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final style = emphasis ? t.titleMedium : t.bodyMedium?.copyWith(color: color ?? context.colors.cream200);
    final valueStyle = emphasis
        ? t.titleMedium
        : t.bodyMedium?.copyWith(color: color ?? context.colors.cream50);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Space.x1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(label, style: style)),
            const SizedBox(width: Space.x3),
            Text(value.format(), style: valueStyle, semanticsLabel: value.spoken),
          ],
        ),
      ),
    );
  }
}
