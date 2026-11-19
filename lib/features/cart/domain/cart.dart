import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/money/money.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

/// An option the customer picked, with the menu's price at the time for the
/// on-device estimate. The server re-prices from `optionIds` only.
@freezed
abstract class CartOption with _$CartOption {
  const factory CartOption({
    required String id,
    required String groupId,
    required String groupName,
    required String name,
    @Default(0) int priceDelta,
  }) = _CartOption;

  factory CartOption.fromJson(Map<String, dynamic> json) => _$CartOptionFromJson(json);
}

/// One line in the on-device cart.
@freezed
abstract class CartLine with _$CartLine {
  const factory CartLine({
    /// Local id, stable across edits. Not sent to the server.
    required String lineId,
    required String menuItemId,
    required String name,
    String? imageUrl,

    /// Menu price when added (paisa). Display estimate only.
    required int unitPrice,
    required int quantity,
    @Default([]) List<CartOption> options,
    String? notes,
  }) = _CartLine;

  const CartLine._();

  factory CartLine.fromJson(Map<String, dynamic> json) => _$CartLineFromJson(json);

  static const maxQuantity = 50;
  static const maxNotesLength = 200;

  List<String> get optionIds => [for (final o in options) o.id];

  Money get estimatedUnit => Money(unitPrice + options.fold(0, (sum, o) => sum + o.priceDelta));

  Money get estimatedTotal => estimatedUnit * quantity;

  /// Two lines are "the same" when item, options (order-insensitive) and notes match.
  String get mergeKey {
    final ids = optionIds.toList()..sort();
    return '$menuItemId|${ids.join(',')}|${(notes ?? '').trim()}';
  }

  /// `{ menuItemId, quantity, optionIds, notes }` as `CartItemInput`.
  Map<String, Object?> toCartItemInput() => {
    'menuItemId': menuItemId,
    'quantity': quantity,
    'optionIds': optionIds,
    if (notes != null && notes!.trim().isNotEmpty) 'notes': notes!.trim(),
  };
}

/// Pure cart operations. Kept free of Flutter and storage so they are easy to test.
extension CartOps on List<CartLine> {
  int get itemCount => fold(0, (sum, l) => sum + l.quantity);

  Money get estimatedSubtotal => fold(Money.zero, (sum, l) => sum + l.estimatedTotal);

  /// Adds [line], merging into an identical existing line (quantity capped at 50).
  List<CartLine> addLine(CartLine line) {
    final index = indexWhere((l) => l.mergeKey == line.mergeKey);
    if (index < 0) return [...this, line];
    final existing = this[index];
    final merged = existing.copyWith(
      quantity: (existing.quantity + line.quantity).clamp(1, CartLine.maxQuantity),
    );
    return [...take(index), merged, ...skip(index + 1)];
  }

  /// Replaces the line with [lineId] (after editing its options). If the edit
  /// makes it identical to another line, the two are merged.
  List<CartLine> replaceLine(String lineId, CartLine updated) {
    final without = where((l) => l.lineId != lineId).toList();
    final index = indexWhere((l) => l.lineId == lineId);
    if (index < 0) return without.addLine(updated);
    final twin = without.indexWhere((l) => l.mergeKey == updated.mergeKey);
    if (twin >= 0) {
      final t = without[twin];
      without[twin] = t.copyWith(quantity: (t.quantity + updated.quantity).clamp(1, CartLine.maxQuantity));
      return without;
    }
    final next = toList();
    next[index] = updated.copyWith(lineId: lineId);
    return next;
  }

  List<CartLine> setQuantity(String lineId, int quantity) {
    if (quantity <= 0) return removeLine(lineId);
    return [
      for (final l in this)
        if (l.lineId == lineId) l.copyWith(quantity: quantity.clamp(1, CartLine.maxQuantity)) else l,
    ];
  }

  List<CartLine> removeLine(String lineId) => where((l) => l.lineId != lineId).toList();
}
