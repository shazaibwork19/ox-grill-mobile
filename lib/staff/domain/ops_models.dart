import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/enums.dart';
import '../../core/domain/pricing.dart';
import '../../features/orders/domain/order.dart';
import 'auth_models.dart';

part 'ops_models.freezed.dart';
part 'ops_models.g.dart';

// ---- Kitchen ---------------------------------------------------------------

@freezed
abstract class KitchenTicketItem with _$KitchenTicketItem {
  const factory KitchenTicketItem({
    required String name,
    required int quantity,
    String? notes,
    @Default([]) List<String> options,
  }) = _KitchenTicketItem;

  factory KitchenTicketItem.fromJson(Map<String, dynamic> json) => _$KitchenTicketItemFromJson(json);
}

/// `KitchenTicket`: no prices, payment or customer contact data.
@freezed
abstract class KitchenTicket with _$KitchenTicket {
  const factory KitchenTicket({
    required String id,
    required String orderNumber,
    required String branchId,
    @JsonKey(unknownEnumValue: OrderType.unknown) required OrderType type,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) required OrderStatus status,
    String? tableRef,
    String? pickupName,
    String? customerName,
    String? notes,
    @Default([]) List<KitchenTicketItem> items,
    required DateTime placedAt,
    DateTime? confirmedAt,
    DateTime? preparingAt,
    DateTime? readyAt,
  }) = _KitchenTicket;

  factory KitchenTicket.fromJson(Map<String, dynamic> json) => _$KitchenTicketFromJson(json);
}

// ---- Delivery --------------------------------------------------------------

@JsonEnum(valueField: 'wire')
enum AssignmentStatus {
  assigned('ASSIGNED'),
  accepted('ACCEPTED'),
  pickedUp('PICKED_UP'),
  delivered('DELIVERED'),
  cancelled('CANCELLED'),
  unknown('UNKNOWN');

  const AssignmentStatus(this.wire);
  final String wire;
}

@freezed
abstract class DeliveryAssignment with _$DeliveryAssignment {
  const factory DeliveryAssignment({
    required String id,
    required String orderId,
    required String orderNumber,
    required String branchId,
    @Default('') String branchName,
    @Default('') String branchAddress,
    @JsonKey(unknownEnumValue: AssignmentStatus.unknown) required AssignmentStatus status,
    String? customerName,
    String? customerPhone,
    DeliveryInfo? delivery,
    @Default([]) List<OrderItem> items,
    required int total,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) required PaymentMethod paymentMethod,
    @Default(0) int amountToCollect,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) required OrderStatus orderStatus,
    required DateTime assignedAt,
    DateTime? acceptedAt,
    DateTime? pickedUpAt,
    DateTime? deliveredAt,
  }) = _DeliveryAssignment;

  factory DeliveryAssignment.fromJson(Map<String, dynamic> json) => _$DeliveryAssignmentFromJson(json);
}

@freezed
abstract class Rider with _$Rider {
  const factory Rider({
    required String id,
    String? name,
    String? phone,
    @Default(false) bool onDuty,
    @Default(0) int activeAssignments,
  }) = _Rider;

  factory Rider.fromJson(Map<String, dynamic> json) => _$RiderFromJson(json);
}

// ---- Orders ----------------------------------------------------------------

@freezed
abstract class ReceiptBranch with _$ReceiptBranch {
  const factory ReceiptBranch({
    required String name,
    @Default('') String addressLine,
    @Default('') String phone,
  }) = _ReceiptBranch;

  factory ReceiptBranch.fromJson(Map<String, dynamic> json) => _$ReceiptBranchFromJson(json);
}

@freezed
abstract class Receipt with _$Receipt {
  const factory Receipt({
    required String orderNumber,
    required ReceiptBranch branch,
    @JsonKey(unknownEnumValue: OrderType.unknown) required OrderType type,
    required DateTime placedAt,
    String? cashierName,
    String? customerName,
    String? tableRef,
    @Default([]) List<OrderItem> lines,
    required Totals totals,
    @JsonKey(unknownEnumValue: PaymentMethod.unknown) required PaymentMethod paymentMethod,
    @JsonKey(unknownEnumValue: PaymentStatus.unknown) required PaymentStatus paymentStatus,
    int? amountTendered,
    int? changeDue,
  }) = _Receipt;

  factory Receipt.fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);
}

// ---- Branch menu availability ----------------------------------------------

@freezed
abstract class BranchMenuItem with _$BranchMenuItem {
  const factory BranchMenuItem({
    required String menuItemId,
    required String branchId,
    required String name,
    @Default('') String categoryName,
    String? imageUrl,
    required int basePrice,
    int? priceOverride,
    required int effectivePrice,
    required bool isAvailable,
    @Default(true) bool isActiveGlobally,
    int? stockQuantity,
    DateTime? updatedAt,
  }) = _BranchMenuItem;

  factory BranchMenuItem.fromJson(Map<String, dynamic> json) => _$BranchMenuItemFromJson(json);
}

// ---- Dashboard -------------------------------------------------------------

@freezed
abstract class DashboardToday with _$DashboardToday {
  const factory DashboardToday({
    @Default(0) int revenue,
    @Default(0) int orders,
    @Default(0) int averageOrderValue,
    @Default(0) int activeOrders,
    @Default(0) int pendingOrders,
    @Default(0) int cancelledOrders,
  }) = _DashboardToday;

  factory DashboardToday.fromJson(Map<String, dynamic> json) => _$DashboardTodayFromJson(json);
}

@freezed
abstract class NamedAmount with _$NamedAmount {
  const factory NamedAmount({
    String? branchId,
    String? branchName,
    String? name,
    String? method,
    @Default(0) int quantity,
    @Default(0) int orders,
    @Default(0) int revenue,
  }) = _NamedAmount;

  factory NamedAmount.fromJson(Map<String, dynamic> json) => _$NamedAmountFromJson(json);
}

@freezed
abstract class ActivityEntry with _$ActivityEntry {
  const factory ActivityEntry({
    required String id,
    required String action,
    @Default('') String entityType,
    String? actorName,
    required DateTime createdAt,
  }) = _ActivityEntry;

  factory ActivityEntry.fromJson(Map<String, dynamic> json) => _$ActivityEntryFromJson(json);
}

/// `GET /branches/{b}/dashboard` and `GET /admin/dashboard`.
@freezed
abstract class Dashboard with _$Dashboard {
  const factory Dashboard({
    required DashboardToday today,
    @Default([]) List<NamedAmount> topItems,
    @Default([]) List<NamedAmount> salesByBranch,
    @Default([]) List<NamedAmount> paymentBreakdown,
    @Default([]) List<OrderSummary> recentOrders,
    @Default([]) List<ActivityEntry> recentActivity,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);
}

// ---- Staff -----------------------------------------------------------------

@freezed
abstract class StaffMember with _$StaffMember {
  const factory StaffMember({
    required String id,
    required String userId,
    String? name,
    String? email,
    String? phone,
    @JsonKey(unknownEnumValue: StaffRoleWire.unknown) required StaffRoleWire staffRole,
    required String branchId,
    @Default('') String branchName,
    @JsonKey(unknownEnumValue: StaffStatus.unknown) required StaffStatus status,
    @Default(false) bool onDuty,
    DateTime? lastLoginAt,
    required DateTime createdAt,
  }) = _StaffMember;

  factory StaffMember.fromJson(Map<String, dynamic> json) => _$StaffMemberFromJson(json);
}

// ---- Shifts ----------------------------------------------------------------

@freezed
abstract class ShiftSummary with _$ShiftSummary {
  const factory ShiftSummary({
    @Default(0) int orderCount,
    @Default(0) int salesTotal,
    @Default(0) int cashTotal,
    @Default(0) int cardTotal,
    @Default(0) int codTotal,
    @Default(0) int onlineTotal,
    @Default(0) int cancelledCount,
  }) = _ShiftSummary;

  factory ShiftSummary.fromJson(Map<String, dynamic> json) => _$ShiftSummaryFromJson(json);
}

@freezed
abstract class Shift with _$Shift {
  const factory Shift({
    required String id,
    required String branchId,
    required String staffId,
    String? staffName,
    required String status,
    required DateTime openedAt,
    DateTime? closedAt,
    @Default(0) int openingFloat,
    int? expectedCash,
    int? countedCash,
    int? variance,
    String? notes,
    @Default(ShiftSummary()) ShiftSummary summary,
  }) = _Shift;

  const Shift._();

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  bool get isOpen => status == 'OPEN';
}

// ---- Front of house --------------------------------------------------------

@freezed
abstract class Reservation with _$Reservation {
  const factory Reservation({
    required String id,
    required String branchId,
    @Default('') String branchName,
    required String name,
    required String phone,
    required int partySize,
    required DateTime reservedFor,
    @Default(90) int durationMinutes,
    required String status,
    String? notes,
    String? cancelReason,
    required DateTime createdAt,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);
}

@freezed
abstract class WaitlistEntry with _$WaitlistEntry {
  const factory WaitlistEntry({
    required String id,
    required String branchId,
    @Default('') String branchName,
    required String name,
    String? phone,
    required int partySize,
    required String status,
    int? position,
    int? estimatedWaitMinutes,
    required DateTime joinedAt,
    DateTime? notifiedAt,
    DateTime? expiresAt,
    String? notes,
  }) = _WaitlistEntry;

  factory WaitlistEntry.fromJson(Map<String, dynamic> json) => _$WaitlistEntryFromJson(json);
}
