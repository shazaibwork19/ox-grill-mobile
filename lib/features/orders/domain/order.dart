import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/enums.dart';
import '../../../core/domain/pricing.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    String? menuItemId,
    required String name,
    required int quantity,
    required int unitPrice,
    @Default(0) int optionsTotal,
    required int lineTotal,
    String? notes,
    @Default([]) List<PricedOption> options,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

@freezed
abstract class DeliveryInfo with _$DeliveryInfo {
  const factory DeliveryInfo({
    String? addressLine,
    String? area,
    String? city,
    double? latitude,
    double? longitude,
    String? instructions,
  }) = _DeliveryInfo;

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) => _$DeliveryInfoFromJson(json);
}

@freezed
abstract class OrderAssignment with _$OrderAssignment {
  const factory OrderAssignment({
    required String id,
    required String status,
    required String riderId,
    String? riderName,
    String? riderPhone,
    required DateTime assignedAt,
  }) = _OrderAssignment;

  factory OrderAssignment.fromJson(Map<String, dynamic> json) => _$OrderAssignmentFromJson(json);
}

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    required String id,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) required PaymentMethod method,
    @Default('') String provider,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) required PaymentStatus status,
    required int amount,
    @Default(0) int refundedAmount,
    DateTime? paidAt,
    String? checkoutUrl,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}

@freezed
abstract class OrderStatusHistory with _$OrderStatusHistory {
  const factory OrderStatusHistory({
    required String id,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus? fromStatus,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) required OrderStatus toStatus,
    @Default('SYSTEM') String actorRole,
    String? actorName,
    String? reason,
    required DateTime createdAt,
  }) = _OrderStatusHistory;

  factory OrderStatusHistory.fromJson(Map<String, dynamic> json) => _$OrderStatusHistoryFromJson(json);
}

/// `Order` as returned by `POST /orders` and `GET /orders/track/{token}`.
@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    required String orderNumber,
    required String branchId,
    required String branchName,
    @JsonKey(unknownEnumValue: OrderType.unknown) required OrderType type,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) required OrderStatus status,
    @Default('MOBILE') String source,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) required PaymentMethod paymentMethod,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) required PaymentStatus paymentStatus,
    String? customerName,
    String? customerPhone,
    @Default(0) int itemCount,
    required int total,
    @Default('PKR') String currency,
    String? tableRef,
    required DateTime placedAt,
    required DateTime updatedAt,
    @Default([]) List<OrderItem> items,
    required Totals totals,
    String? notes,
    String? pickupName,
    DeliveryInfo? delivery,
    Payment? payment,
    OrderAssignment? assignment,
    DateTime? estimatedReadyAt,
    DateTime? confirmedAt,
    DateTime? readyAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
    String? cancelReason,
    @Default(false) bool canCancel,

    /// Statuses the signed-in caller may move this order to (staff screens
    /// show buttons only for these).
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default([]) List<OrderStatus> allowedTransitions,
    @Default([]) List<OrderStatusHistory> history,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

/// `OrderSummary`: list rows for staff order boards.
@freezed
abstract class OrderSummary with _$OrderSummary {
  const factory OrderSummary({
    required String id,
    required String orderNumber,
    required String branchId,
    @Default('') String branchName,
    @JsonKey(unknownEnumValue: OrderType.unknown) required OrderType type,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) required OrderStatus status,
    @Default('WEB') String source,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) required PaymentMethod paymentMethod,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) required PaymentStatus paymentStatus,
    String? customerName,
    String? customerPhone,
    @Default(0) int itemCount,
    required int total,
    String? tableRef,
    required DateTime placedAt,
    required DateTime updatedAt,
  }) = _OrderSummary;

  factory OrderSummary.fromJson(Map<String, dynamic> json) => _$OrderSummaryFromJson(json);
}

@freezed
abstract class TrackingStep with _$TrackingStep {
  const factory TrackingStep({
    @JsonKey(unknownEnumValue: OrderStatus.unknown) required OrderStatus status,
    required String label,
    DateTime? reachedAt,
    @JsonKey(unknownEnumValue: TrackingStepState.unknown) required TrackingStepState state,
  }) = _TrackingStep;

  factory TrackingStep.fromJson(Map<String, dynamic> json) => _$TrackingStepFromJson(json);
}

@freezed
abstract class TrackingContact with _$TrackingContact {
  const factory TrackingContact({String? name, String? phone}) = _TrackingContact;

  factory TrackingContact.fromJson(Map<String, dynamic> json) => _$TrackingContactFromJson(json);
}

@freezed
abstract class TrackingBranch with _$TrackingBranch {
  const factory TrackingBranch({required String id, required String name, required String phone}) =
      _TrackingBranch;

  factory TrackingBranch.fromJson(Map<String, dynamic> json) => _$TrackingBranchFromJson(json);
}

@freezed
abstract class LocationPoint with _$LocationPoint {
  const factory LocationPoint({
    required double latitude,
    required double longitude,
    required DateTime recordedAt,
  }) = _LocationPoint;

  factory LocationPoint.fromJson(Map<String, dynamic> json) => _$LocationPointFromJson(json);
}

/// `OrderTracking`: a ready-to-render timeline.
@freezed
abstract class OrderTracking with _$OrderTracking {
  const factory OrderTracking({
    required String orderId,
    required String orderNumber,
    @JsonKey(unknownEnumValue: OrderType.unknown) required OrderType type,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) required OrderStatus status,
    @Default([]) List<TrackingStep> steps,
    @Default([]) List<OrderStatusHistory> history,
    DateTime? estimatedReadyAt,
    TrackingContact? rider,
    LocationPoint? riderLocation,
    required TrackingBranch branch,
  }) = _OrderTracking;

  factory OrderTracking.fromJson(Map<String, dynamic> json) => _$OrderTrackingFromJson(json);
}

/// `GET /orders/track/{token}` (`PublicOrderStatus`).
@freezed
abstract class PublicOrderStatus with _$PublicOrderStatus {
  const factory PublicOrderStatus({required Order order, required OrderTracking tracking}) =
      _PublicOrderStatus;

  factory PublicOrderStatus.fromJson(Map<String, dynamic> json) => _$PublicOrderStatusFromJson(json);
}

@freezed
abstract class PaymentAction with _$PaymentAction {
  const factory PaymentAction({required String type, required String url}) = _PaymentAction;

  factory PaymentAction.fromJson(Map<String, dynamic> json) => _$PaymentActionFromJson(json);
}

/// `POST /orders` 201 reply (`CreateOrderResult`).
@freezed
abstract class CreateOrderResult with _$CreateOrderResult {
  const factory CreateOrderResult({
    required Order order,
    PaymentAction? paymentAction,
    int? changeDue,
    String? trackingToken,
  }) = _CreateOrderResult;

  factory CreateOrderResult.fromJson(Map<String, dynamic> json) => _$CreateOrderResultFromJson(json);
}
