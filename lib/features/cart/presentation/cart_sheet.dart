import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/domain/enums.dart';
import '../../../core/money/money.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/controls.dart';
import '../../../core/widgets/panels.dart';
import '../../branches/application/order_session.dart';
import '../../branches/presentation/branch_select_screen.dart';
import '../application/cart_controller.dart';
import '../application/quote_provider.dart';
import '../domain/cart.dart';
import '../domain/quote.dart';
import 'totals_table.dart';

/// Full-height sheet on phones, side sheet on tablets.
Future<void> openCart(BuildContext context) {
  if (Breakpoints.isTablet(context)) {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close cart',
      barrierColor: Colors.black54,
      transitionDuration: Motion.of(context, Motion.sheet),
      pageBuilder: (_, _, _) => const Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 440,
          child: Material(child: SafeArea(child: CartView())),
        ),
      ),
      transitionBuilder: (_, animation, _, child) => SlideTransition(
        position: Tween(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
        child: child,
      ),
    );
  }
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    sheetAnimationStyle: AnimationStyle(
      duration: Motion.of(context, Motion.sheet),
      reverseDuration: Motion.of(context, Motion.sheet),
    ),
    builder: (_) => const FractionallySizedBox(heightFactor: 0.94, child: CartView()),
  );
}

/// Why checkout is blocked, or `null` when it is allowed.
String? checkoutBlocker({
  required List<CartLine> lines,
  required AsyncValue<Quote?> quote,
  required bool acceptingOrders,
  required String? branchLabel,
}) {
  if (lines.isEmpty) return 'Your cart is empty.';
  if (!acceptingOrders) return '${branchLabel ?? 'This branch is closed'}. Ordering is paused.';
  if (quote.hasError) return 'Couldn’t check prices. Try again to continue.';
  final q = quote.value;
  if (quote.isLoading || q == null) return 'Updating totals…';
  if (q.issues.isNotEmpty) {
    return q.issues.length == 1
        ? 'Fix the highlighted item to continue.'
        : 'Fix the highlighted items to continue.';
  }
  if (!q.meetsMinimum) {
    return 'Add ${Money(q.minDeliveryOrder - q.totals.subtotal).format()} more to reach the delivery minimum.';
  }
  return null;
}

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context).textTheme;
    final lines = ref.watch(cartProvider);
    final quote = ref.watch(quoteProvider);
    final session = ref.watch(orderSessionProvider);
    final branch = ref.watch(selectedBranchProvider).value;
    final blocker = checkoutBlocker(
      lines: lines,
      quote: quote,
      acceptingOrders: branch?.status.acceptingOrders ?? true,
      branchLabel: branch?.status.label,
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.x2, Space.x2),
          child: Row(
            children: [
              Expanded(
                child: Semantics(header: true, child: Text('Your cart', style: t.headlineSmall)),
              ),
              IconButton(
                tooltip: 'Close cart',
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            ],
          ),
        ),
        Expanded(
          child: lines.isEmpty
              ? MessagePanel(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Your cart is empty',
                  message: 'Add dishes from the menu and they’ll show up here.',
                  actionLabel: 'Browse the menu',
                  onAction: () => Navigator.of(context).maybePop(),
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(Space.gutter, 0, Space.gutter, Space.x6),
                  children: [
                    if (session != null)
                      _SessionBox(session: session, branchName: branch?.name ?? session.branchName),
                    const SizedBox(height: Space.x4),
                    for (var i = 0; i < lines.length; i++) ...[
                      _CartLineTile(
                        line: lines[i],
                        quoteLine: quote.value?.lineForIndex(i),
                        issue: quote.isLoading ? null : quote.value?.issueForIndex(i),
                      ),
                      const SizedBox(height: Space.x3),
                    ],
                    const SizedBox(height: Space.x2),
                    _QuoteSection(lines: lines, quote: quote, orderType: session?.orderType),
                  ],
                ),
        ),
        if (lines.isNotEmpty)
          BottomActionBar(
            above: blocker == null
                ? null
                : Text(
                    blocker,
                    textAlign: TextAlign.center,
                    style: t.bodySmall?.copyWith(color: context.colors.cream50),
                  ),
            child: FilledButton(
              onPressed: blocker == null
                  ? () {
                      Navigator.of(context).maybePop();
                      context.push(Routes.checkout);
                    }
                  : null,
              child: const Text('Go to checkout'),
            ),
          ),
      ],
    );
  }
}

class _SessionBox extends ConsumerWidget {
  const _SessionBox({required this.session, required this.branchName});

  final OrderSession session;
  final String branchName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final types = ref.watch(selectedBranchProvider).value?.services.orderTypes ?? [session.orderType];
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
          Row(
            children: [
              Icon(Icons.storefront_outlined, size: 20, color: c.bronze400),
              const SizedBox(width: Space.x2),
              Expanded(child: Text(branchName, style: t.titleSmall)),
              TextButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                  context.push(Routes.changeBranch());
                },
                child: const Text('Change'),
              ),
            ],
          ),
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
                  onSelected: (_) => ref.read(orderSessionProvider.notifier).setOrderType(type),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartLineTile extends ConsumerWidget {
  const _CartLineTile({required this.line, this.quoteLine, this.issue});

  final CartLine line;
  final QuoteLine? quoteLine;
  final QuoteIssue? issue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final t = Theme.of(context).textTheme;
    final cart = ref.read(cartProvider.notifier);
    final price = quoteLine != null ? Money(quoteLine!.lineTotal) : line.estimatedTotal;
    final optionText = line.options.map((o) => o.name).join(', ');
    final issue = this.issue;

    return Container(
      padding: const EdgeInsets.all(Space.x3),
      decoration: BoxDecoration(
        color: c.ink800,
        borderRadius: Radii.cardAll,
        border: Border.all(color: issue != null ? c.danger500 : c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: Radii.controlAll,
                child: SizedBox(
                  width: 64,
                  height: 48,
                  child: AppImage(url: line.imageUrl, semanticLabel: line.name, iconSize: 18),
                ),
              ),
              const SizedBox(width: Space.x3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(line.name, style: t.titleSmall),
                    if (optionText.isNotEmpty) Text(optionText, style: t.bodySmall),
                    if (line.notes != null && line.notes!.isNotEmpty)
                      Text('Note: ${line.notes}', style: t.bodySmall?.copyWith(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              const SizedBox(width: Space.x2),
              Semantics(
                label: quoteLine != null
                    ? 'Line total ${price.spoken}'
                    : 'Estimated line total ${price.spoken}',
                excludeSemantics: true,
                child: Text(price.format(), style: t.titleSmall),
              ),
            ],
          ),
          if (issue != null) ...[
            const SizedBox(height: Space.x3),
            InlineNotice(tone: PanelTone.danger, icon: Icons.error_outline_rounded, message: issue.message),
          ],
          const SizedBox(height: Space.x2),
          Row(
            children: [
              QuantityStepper(
                value: line.quantity,
                min: 0,
                itemName: line.name,
                compact: true,
                onChanged: (q) => cart.setQuantity(line.lineId, q),
              ),
              const Spacer(),
              if (issue == null || !issue.isUnavailable)
                IconButton(
                  tooltip: 'Edit ${line.name}',
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {
                    Navigator.of(context).maybePop();
                    context.push(Routes.item(line.menuItemId, editLineId: line.lineId));
                  },
                ),
              IconButton(
                tooltip: 'Remove ${line.name} from cart',
                icon: const Icon(Icons.delete_outline_rounded),
                onPressed: () => cart.remove(line.lineId),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuoteSection extends ConsumerWidget {
  const _QuoteSection({required this.lines, required this.quote, required this.orderType});

  final List<CartLine> lines;
  final AsyncValue<Quote?> quote;
  final OrderType? orderType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final q = quote.value;
    final method = ref.watch(selectedPaymentMethodProvider);
    if (quote.hasError && !quote.isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EstimateTable(subtotal: lines.estimatedSubtotal),
          const SizedBox(height: Space.x3),
          InlineNotice(
            tone: PanelTone.warning,
            icon: Icons.cloud_off_rounded,
            message:
                'Couldn’t get the latest prices from the branch. The subtotal above is an estimate; '
                'tax and fees are added once prices load.',
            actionLabel: 'Try again',
            onAction: () => ref.invalidate(quoteProvider),
          ),
        ],
      );
    }
    if (q == null) return EstimateTable(subtotal: lines.estimatedSubtotal, loading: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!q.meetsMinimum && orderType == OrderType.delivery) ...[
          InlineNotice(
            tone: PanelTone.warning,
            icon: Icons.delivery_dining_rounded,
            message:
                'Delivery minimum is ${Money(q.minDeliveryOrder).format()}. '
                'Add ${Money(q.minDeliveryOrder - q.totals.subtotal).format()} more to order for delivery.',
          ),
          const SizedBox(height: Space.x3),
        ],
        TotalsTable(totals: q.totals, paymentMethod: method, updating: quote.isLoading, orderType: orderType),
      ],
    );
  }
}
