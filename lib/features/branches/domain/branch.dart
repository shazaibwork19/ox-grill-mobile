import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/enums.dart';
import '../../../core/money/money.dart';

part 'branch.freezed.dart';
part 'branch.g.dart';

@freezed
abstract class BranchServices with _$BranchServices {
  const factory BranchServices({
    @Default(false) bool dineIn,
    @Default(false) bool pickup,
    @Default(false) bool delivery,
  }) = _BranchServices;

  const BranchServices._();

  factory BranchServices.fromJson(Map<String, dynamic> json) => _$BranchServicesFromJson(json);

  bool offers(OrderType type) => switch (type) {
    OrderType.delivery => delivery,
    OrderType.pickup => pickup,
    OrderType.dineIn => dineIn,
    _ => false,
  };

  List<OrderType> get orderTypes => [
    for (final t in OrderType.customerTypes)
      if (offers(t)) t,
  ];
}

@freezed
abstract class BranchOpenStatus with _$BranchOpenStatus {
  const factory BranchOpenStatus({
    required bool isOpen,
    required bool acceptingOrders,
    String? todayOpensAt,
    String? todayClosesAt,
    required String label,
  }) = _BranchOpenStatus;

  factory BranchOpenStatus.fromJson(Map<String, dynamic> json) => _$BranchOpenStatusFromJson(json);
}

/// `GET /branches` item (`BranchSummary`).
@freezed
abstract class BranchSummary with _$BranchSummary {
  const factory BranchSummary({
    required String id,
    required String slug,
    required String name,
    required String city,
    String? area,
    required String addressLine,
    required String phone,
    double? latitude,
    double? longitude,
    String? imageUrl,
    required BranchServices services,
    @Default(0) int deliveryFee,
    @Default(0) int minDeliveryOrder,
    @Default(0) int estimatedDeliveryMinutes,
    @Default(0) int estimatedPickupMinutes,
    required BranchOpenStatus status,
  }) = _BranchSummary;

  const BranchSummary._();

  factory BranchSummary.fromJson(Map<String, dynamic> json) => _$BranchSummaryFromJson(json);

  Money get deliveryFeeMoney => Money(deliveryFee);
  Money get minDeliveryOrderMoney => Money(minDeliveryOrder);
}

@freezed
abstract class BranchHours with _$BranchHours {
  const factory BranchHours({
    required int dayOfWeek,
    required String opensAt,
    required String closesAt,
    @Default(false) bool isClosed,
  }) = _BranchHours;

  factory BranchHours.fromJson(Map<String, dynamic> json) => _$BranchHoursFromJson(json);
}

/// `GET /branches/{id}` (`BranchDetail`).
@freezed
abstract class BranchDetail with _$BranchDetail {
  const factory BranchDetail({
    required String id,
    required String slug,
    required String name,
    required String city,
    String? area,
    required String addressLine,
    required String phone,
    double? latitude,
    double? longitude,
    String? imageUrl,
    required BranchServices services,
    @Default(0) int deliveryFee,
    @Default(0) int minDeliveryOrder,
    @Default(0) int estimatedDeliveryMinutes,
    @Default(0) int estimatedPickupMinutes,
    required BranchOpenStatus status,
    String? email,
    @Default('Asia/Karachi') String timezone,
    @Default([]) List<BranchHours> hours,
    @Default({}) Map<String, List<String>> paymentMethods,
    @Default(0) int taxRateCashBps,
    @Default(0) int taxRateCardBps,
  }) = _BranchDetail;

  const BranchDetail._();

  factory BranchDetail.fromJson(Map<String, dynamic> json) => _$BranchDetailFromJson(json);

  Money get deliveryFeeMoney => Money(deliveryFee);
  Money get minDeliveryOrderMoney => Money(minDeliveryOrder);

  /// Tax rate the server will apply for [method], for the "tax differs by
  /// payment method" hint. Totals still come from `POST /menu/quote`.
  int taxRateBpsFor(PaymentMethod method) => method.isCashRate ? taxRateCashBps : taxRateCardBps;
}
