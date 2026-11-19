import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';

part 'pricing.freezed.dart';
part 'pricing.g.dart';

/// Server-calculated totals (`Totals`). All amounts are paisa.
@freezed
abstract class Totals with _$Totals {
  const factory Totals({
    required int subtotal,
    @Default(0) int discountTotal,
    required int taxTotal,
    required int taxRateBps,
    @Default(0) int deliveryFee,
    required int total,
    @Default('PKR') String currency,
  }) = _Totals;

  const Totals._();

  factory Totals.fromJson(Map<String, dynamic> json) => _$TotalsFromJson(json);

  Money get subtotalMoney => Money(subtotal);
  Money get discountMoney => Money(discountTotal);
  Money get taxMoney => Money(taxTotal);
  Money get deliveryFeeMoney => Money(deliveryFee);
  Money get totalMoney => Money(total);

  /// `16%` from `1600` basis points; keeps one decimal when needed (`7.5%`).
  String get taxRateLabel => formatBps(taxRateBps);
}

/// An option chosen on a line, priced by the server (`PricedOption`).
@freezed
abstract class PricedOption with _$PricedOption {
  const factory PricedOption({
    required String id,
    required String groupName,
    required String name,
    required int priceDelta,
  }) = _PricedOption;

  factory PricedOption.fromJson(Map<String, dynamic> json) => _$PricedOptionFromJson(json);
}

String formatBps(int bps) {
  final whole = bps ~/ 100;
  final rest = bps % 100;
  if (rest == 0) return '$whole%';
  final decimals = (rest % 10 == 0) ? (rest ~/ 10).toString() : rest.toString().padLeft(2, '0');
  return '$whole.$decimals%';
}
