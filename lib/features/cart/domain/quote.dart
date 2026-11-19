import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/enums.dart';
import '../../../core/domain/pricing.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

/// `POST /menu/quote` reply (`Quote`). The authoritative cart total.
@freezed
abstract class Quote with _$Quote {
  const factory Quote({
    required String branchId,
    @JsonKey(unknownEnumValue: OrderType.unknown) required OrderType orderType,
    @Default([]) List<QuoteLine> lines,
    required Totals totals,
    @Default([]) List<QuoteIssue> issues,
    @Default(0) int minDeliveryOrder,
    @Default(true) bool meetsMinimum,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) @Default([]) List<PaymentMethod> allowedPaymentMethods,
  }) = _Quote;

  const Quote._();

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  bool get canCheckout => issues.isEmpty && meetsMinimum && lines.isNotEmpty;

  QuoteIssue? issueForIndex(int cartIndex) {
    for (final issue in issues) {
      if (issue.index == cartIndex) return issue;
    }
    return null;
  }

  /// Quote lines leave out lines with issues, so the n-th cart line maps to
  /// the n-th line *without* an issue. Returns `null` for issue lines.
  QuoteLine? lineForIndex(int cartIndex) {
    if (issueForIndex(cartIndex) != null) return null;
    var position = 0;
    for (var i = 0; i < cartIndex; i++) {
      if (issueForIndex(i) == null) position++;
    }
    return position < lines.length ? lines[position] : null;
  }
}

@freezed
abstract class QuoteLine with _$QuoteLine {
  const factory QuoteLine({
    required String menuItemId,
    required String name,
    required int quantity,
    required int unitPrice,
    @Default(0) int optionsTotal,
    required int lineTotal,
    @Default([]) List<PricedOption> options,
    String? notes,
  }) = _QuoteLine;

  factory QuoteLine.fromJson(Map<String, dynamic> json) => _$QuoteLineFromJson(json);
}

@freezed
abstract class QuoteIssue with _$QuoteIssue {
  const factory QuoteIssue({
    required int index,
    required String menuItemId,
    required String code,
    required String message,
  }) = _QuoteIssue;

  const QuoteIssue._();

  factory QuoteIssue.fromJson(Map<String, dynamic> json) => _$QuoteIssueFromJson(json);

  /// The item can't be ordered at this branch at all (vs. a fixable option choice).
  bool get isUnavailable => code == 'ITEM_NOT_FOUND' || code == 'ITEM_UNAVAILABLE' || code == 'OUT_OF_STOCK';
}
