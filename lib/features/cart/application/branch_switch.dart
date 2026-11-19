import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/enums.dart';
import '../../branches/application/order_session.dart';
import '../../branches/domain/branch.dart';
import '../../menu/data/menu_repository.dart';
import '../domain/cart.dart';
import 'cart_controller.dart';
import 'quote_provider.dart';

enum _CartMove { bring, leave }

/// Selects [branch] + [type]. When the customer is moving away from a branch
/// with items in the cart, asks whether to bring them along. Items that the
/// new branch can't sell are removed after re-quoting there.
///
/// Returns `false` if the customer cancelled.
Future<bool> switchBranch(BuildContext context, WidgetRef ref, BranchSummary branch, OrderType type) async {
  final session = ref.read(orderSessionProvider);
  final sessionCtl = ref.read(orderSessionProvider.notifier);

  if (session == null || session.branchId == branch.id) {
    await sessionCtl.select(branch, type);
    return true;
  }

  final oldLines = ref.read(cartProvider);
  if (oldLines.isEmpty) {
    await sessionCtl.select(branch, type);
    return true;
  }

  final count = oldLines.itemCount;
  final choice = await showDialog<_CartMove>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Move your cart to ${branch.name}?'),
      content: Text(
        'Your cart has $count ${count == 1 ? 'item' : 'items'} from ${session.branchName}. '
        'Prices and availability are rechecked at ${branch.name}, and anything it doesn’t serve is removed. '
        'If you leave them, they stay saved for ${session.branchName}.',
      ),
      actionsOverflowDirection: VerticalDirection.up,
      actionsOverflowButtonSpacing: 8,
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        OutlinedButton(
          onPressed: () => Navigator.pop(context, _CartMove.leave),
          child: const Text('Leave them'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, _CartMove.bring),
          child: const Text('Bring items'),
        ),
      ],
    ),
  );
  if (choice == null) return false;

  await sessionCtl.select(branch, type);
  if (choice == _CartMove.leave) return true;

  // Reading the cart first rebuilds it for the new branch before importing.
  ref.read(cartProvider);
  final cart = ref.read(cartProvider.notifier);
  await cart.importFrom(session.branchId, oldLines);
  final removed = await _pruneUnavailable(ref, branch.id, type);
  if (removed.isNotEmpty && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${removed.join(', ')} ${removed.length == 1 ? 'isn’t' : 'aren’t'} available at ${branch.name} '
          'and ${removed.length == 1 ? 'was' : 'were'} removed.',
        ),
      ),
    );
  }
  return true;
}

/// Quotes the cart at the new branch and drops lines it can't sell.
/// Network problems leave the cart unchanged; the cart screen shows issues later.
Future<List<String>> _pruneUnavailable(WidgetRef ref, String branchId, OrderType type) async {
  final lines = ref.read(cartProvider);
  try {
    final quote = await ref
        .read(menuRepositoryProvider)
        .quote(
          branchId: branchId,
          orderType: type,
          paymentMethod: ref.read(selectedPaymentMethodProvider),
          lines: lines,
        );
    final drop = <String>{};
    final names = <String>[];
    for (final issue in quote.issues.where((i) => i.isUnavailable)) {
      if (issue.index < lines.length) {
        drop.add(lines[issue.index].lineId);
        names.add(lines[issue.index].name);
      }
    }
    if (drop.isNotEmpty) ref.read(cartProvider.notifier).removeWhere((l) => drop.contains(l.lineId));
    return names;
  } catch (_) {
    return const [];
  }
}
