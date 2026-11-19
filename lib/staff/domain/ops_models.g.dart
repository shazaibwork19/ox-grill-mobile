// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ops_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KitchenTicketItem _$KitchenTicketItemFromJson(Map<String, dynamic> json) => _KitchenTicketItem(
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toInt(),
  notes: json['notes'] as String?,
  options: (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
);

Map<String, dynamic> _$KitchenTicketItemToJson(_KitchenTicketItem instance) => <String, dynamic>{
  'name': instance.name,
  'quantity': instance.quantity,
  'notes': ?instance.notes,
  'options': instance.options,
};

_KitchenTicket _$KitchenTicketFromJson(Map<String, dynamic> json) => _KitchenTicket(
  id: json['id'] as String,
  orderNumber: json['orderNumber'] as String,
  branchId: json['branchId'] as String,
  type: $enumDecode(_$OrderTypeEnumMap, json['type'], unknownValue: OrderType.unknown),
  status: $enumDecode(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown),
  tableRef: json['tableRef'] as String?,
  pickupName: json['pickupName'] as String?,
  customerName: json['customerName'] as String?,
  notes: json['notes'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => KitchenTicketItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  placedAt: DateTime.parse(json['placedAt'] as String),
  confirmedAt: json['confirmedAt'] == null ? null : DateTime.parse(json['confirmedAt'] as String),
  preparingAt: json['preparingAt'] == null ? null : DateTime.parse(json['preparingAt'] as String),
  readyAt: json['readyAt'] == null ? null : DateTime.parse(json['readyAt'] as String),
);

Map<String, dynamic> _$KitchenTicketToJson(_KitchenTicket instance) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'branchId': instance.branchId,
  'type': _$OrderTypeEnumMap[instance.type]!,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'tableRef': ?instance.tableRef,
  'pickupName': ?instance.pickupName,
  'customerName': ?instance.customerName,
  'notes': ?instance.notes,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'placedAt': instance.placedAt.toIso8601String(),
  'confirmedAt': ?instance.confirmedAt?.toIso8601String(),
  'preparingAt': ?instance.preparingAt?.toIso8601String(),
  'readyAt': ?instance.readyAt?.toIso8601String(),
};

const _$OrderTypeEnumMap = {
  OrderType.delivery: 'DELIVERY',
  OrderType.pickup: 'PICKUP',
  OrderType.dineIn: 'DINE_IN',
  OrderType.counterPos: 'COUNTER_POS',
  OrderType.unknown: 'UNKNOWN',
};

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'PENDING',
  OrderStatus.confirmed: 'CONFIRMED',
  OrderStatus.rejected: 'REJECTED',
  OrderStatus.preparing: 'PREPARING',
  OrderStatus.ready: 'READY',
  OrderStatus.outForDelivery: 'OUT_FOR_DELIVERY',
  OrderStatus.delivered: 'DELIVERED',
  OrderStatus.completed: 'COMPLETED',
  OrderStatus.cancelled: 'CANCELLED',
  OrderStatus.unknown: 'UNKNOWN',
};

_DeliveryAssignment _$DeliveryAssignmentFromJson(Map<String, dynamic> json) => _DeliveryAssignment(
  id: json['id'] as String,
  orderId: json['orderId'] as String,
  orderNumber: json['orderNumber'] as String,
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String? ?? '',
  branchAddress: json['branchAddress'] as String? ?? '',
  status: $enumDecode(_$AssignmentStatusEnumMap, json['status'], unknownValue: AssignmentStatus.unknown),
  customerName: json['customerName'] as String?,
  customerPhone: json['customerPhone'] as String?,
  delivery: json['delivery'] == null ? null : DeliveryInfo.fromJson(json['delivery'] as Map<String, dynamic>),
  items:
      (json['items'] as List<dynamic>?)?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>)).toList() ??
      const [],
  total: (json['total'] as num).toInt(),
  paymentMethod: $enumDecode(
    _$PaymentMethodEnumMap,
    json['paymentMethod'],
    unknownValue: PaymentMethod.unknown,
  ),
  amountToCollect: (json['amountToCollect'] as num?)?.toInt() ?? 0,
  orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus'], unknownValue: OrderStatus.unknown),
  assignedAt: DateTime.parse(json['assignedAt'] as String),
  acceptedAt: json['acceptedAt'] == null ? null : DateTime.parse(json['acceptedAt'] as String),
  pickedUpAt: json['pickedUpAt'] == null ? null : DateTime.parse(json['pickedUpAt'] as String),
  deliveredAt: json['deliveredAt'] == null ? null : DateTime.parse(json['deliveredAt'] as String),
);

Map<String, dynamic> _$DeliveryAssignmentToJson(_DeliveryAssignment instance) => <String, dynamic>{
  'id': instance.id,
  'orderId': instance.orderId,
  'orderNumber': instance.orderNumber,
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'branchAddress': instance.branchAddress,
  'status': _$AssignmentStatusEnumMap[instance.status]!,
  'customerName': ?instance.customerName,
  'customerPhone': ?instance.customerPhone,
  'delivery': ?instance.delivery?.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'total': instance.total,
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'amountToCollect': instance.amountToCollect,
  'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
  'assignedAt': instance.assignedAt.toIso8601String(),
  'acceptedAt': ?instance.acceptedAt?.toIso8601String(),
  'pickedUpAt': ?instance.pickedUpAt?.toIso8601String(),
  'deliveredAt': ?instance.deliveredAt?.toIso8601String(),
};

const _$AssignmentStatusEnumMap = {
  AssignmentStatus.assigned: 'ASSIGNED',
  AssignmentStatus.accepted: 'ACCEPTED',
  AssignmentStatus.pickedUp: 'PICKED_UP',
  AssignmentStatus.delivered: 'DELIVERED',
  AssignmentStatus.cancelled: 'CANCELLED',
  AssignmentStatus.unknown: 'UNKNOWN',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'CASH',
  PaymentMethod.cashOnDelivery: 'CASH_ON_DELIVERY',
  PaymentMethod.cardAtCounter: 'CARD_AT_COUNTER',
  PaymentMethod.online: 'ONLINE',
  PaymentMethod.unknown: 'UNKNOWN',
};

_Rider _$RiderFromJson(Map<String, dynamic> json) => _Rider(
  id: json['id'] as String,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  onDuty: json['onDuty'] as bool? ?? false,
  activeAssignments: (json['activeAssignments'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$RiderToJson(_Rider instance) => <String, dynamic>{
  'id': instance.id,
  'name': ?instance.name,
  'phone': ?instance.phone,
  'onDuty': instance.onDuty,
  'activeAssignments': instance.activeAssignments,
};

_ReceiptBranch _$ReceiptBranchFromJson(Map<String, dynamic> json) => _ReceiptBranch(
  name: json['name'] as String,
  addressLine: json['addressLine'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
);

Map<String, dynamic> _$ReceiptBranchToJson(_ReceiptBranch instance) => <String, dynamic>{
  'name': instance.name,
  'addressLine': instance.addressLine,
  'phone': instance.phone,
};

_Receipt _$ReceiptFromJson(Map<String, dynamic> json) => _Receipt(
  orderNumber: json['orderNumber'] as String,
  branch: ReceiptBranch.fromJson(json['branch'] as Map<String, dynamic>),
  type: $enumDecode(_$OrderTypeEnumMap, json['type'], unknownValue: OrderType.unknown),
  placedAt: DateTime.parse(json['placedAt'] as String),
  cashierName: json['cashierName'] as String?,
  customerName: json['customerName'] as String?,
  tableRef: json['tableRef'] as String?,
  lines:
      (json['lines'] as List<dynamic>?)?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>)).toList() ??
      const [],
  totals: Totals.fromJson(json['totals'] as Map<String, dynamic>),
  paymentMethod: $enumDecode(
    _$PaymentMethodEnumMap,
    json['paymentMethod'],
    unknownValue: PaymentMethod.unknown,
  ),
  paymentStatus: $enumDecode(
    _$PaymentStatusEnumMap,
    json['paymentStatus'],
    unknownValue: PaymentStatus.unknown,
  ),
  amountTendered: (json['amountTendered'] as num?)?.toInt(),
  changeDue: (json['changeDue'] as num?)?.toInt(),
);

Map<String, dynamic> _$ReceiptToJson(_Receipt instance) => <String, dynamic>{
  'orderNumber': instance.orderNumber,
  'branch': instance.branch.toJson(),
  'type': _$OrderTypeEnumMap[instance.type]!,
  'placedAt': instance.placedAt.toIso8601String(),
  'cashierName': ?instance.cashierName,
  'customerName': ?instance.customerName,
  'tableRef': ?instance.tableRef,
  'lines': instance.lines.map((e) => e.toJson()).toList(),
  'totals': instance.totals.toJson(),
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
  'amountTendered': ?instance.amountTendered,
  'changeDue': ?instance.changeDue,
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'PENDING',
  PaymentStatus.authorized: 'AUTHORIZED',
  PaymentStatus.paid: 'PAID',
  PaymentStatus.failed: 'FAILED',
  PaymentStatus.refunded: 'REFUNDED',
  PaymentStatus.partiallyRefunded: 'PARTIALLY_REFUNDED',
  PaymentStatus.unknown: 'UNKNOWN',
};

_BranchMenuItem _$BranchMenuItemFromJson(Map<String, dynamic> json) => _BranchMenuItem(
  menuItemId: json['menuItemId'] as String,
  branchId: json['branchId'] as String,
  name: json['name'] as String,
  categoryName: json['categoryName'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  basePrice: (json['basePrice'] as num).toInt(),
  priceOverride: (json['priceOverride'] as num?)?.toInt(),
  effectivePrice: (json['effectivePrice'] as num).toInt(),
  isAvailable: json['isAvailable'] as bool,
  isActiveGlobally: json['isActiveGlobally'] as bool? ?? true,
  stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$BranchMenuItemToJson(_BranchMenuItem instance) => <String, dynamic>{
  'menuItemId': instance.menuItemId,
  'branchId': instance.branchId,
  'name': instance.name,
  'categoryName': instance.categoryName,
  'imageUrl': ?instance.imageUrl,
  'basePrice': instance.basePrice,
  'priceOverride': ?instance.priceOverride,
  'effectivePrice': instance.effectivePrice,
  'isAvailable': instance.isAvailable,
  'isActiveGlobally': instance.isActiveGlobally,
  'stockQuantity': ?instance.stockQuantity,
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
};

_DashboardToday _$DashboardTodayFromJson(Map<String, dynamic> json) => _DashboardToday(
  revenue: (json['revenue'] as num?)?.toInt() ?? 0,
  orders: (json['orders'] as num?)?.toInt() ?? 0,
  averageOrderValue: (json['averageOrderValue'] as num?)?.toInt() ?? 0,
  activeOrders: (json['activeOrders'] as num?)?.toInt() ?? 0,
  pendingOrders: (json['pendingOrders'] as num?)?.toInt() ?? 0,
  cancelledOrders: (json['cancelledOrders'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DashboardTodayToJson(_DashboardToday instance) => <String, dynamic>{
  'revenue': instance.revenue,
  'orders': instance.orders,
  'averageOrderValue': instance.averageOrderValue,
  'activeOrders': instance.activeOrders,
  'pendingOrders': instance.pendingOrders,
  'cancelledOrders': instance.cancelledOrders,
};

_NamedAmount _$NamedAmountFromJson(Map<String, dynamic> json) => _NamedAmount(
  branchId: json['branchId'] as String?,
  branchName: json['branchName'] as String?,
  name: json['name'] as String?,
  method: json['method'] as String?,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  orders: (json['orders'] as num?)?.toInt() ?? 0,
  revenue: (json['revenue'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$NamedAmountToJson(_NamedAmount instance) => <String, dynamic>{
  'branchId': ?instance.branchId,
  'branchName': ?instance.branchName,
  'name': ?instance.name,
  'method': ?instance.method,
  'quantity': instance.quantity,
  'orders': instance.orders,
  'revenue': instance.revenue,
};

_ActivityEntry _$ActivityEntryFromJson(Map<String, dynamic> json) => _ActivityEntry(
  id: json['id'] as String,
  action: json['action'] as String,
  entityType: json['entityType'] as String? ?? '',
  actorName: json['actorName'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ActivityEntryToJson(_ActivityEntry instance) => <String, dynamic>{
  'id': instance.id,
  'action': instance.action,
  'entityType': instance.entityType,
  'actorName': ?instance.actorName,
  'createdAt': instance.createdAt.toIso8601String(),
};

_Dashboard _$DashboardFromJson(Map<String, dynamic> json) => _Dashboard(
  today: DashboardToday.fromJson(json['today'] as Map<String, dynamic>),
  topItems:
      (json['topItems'] as List<dynamic>?)
          ?.map((e) => NamedAmount.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  salesByBranch:
      (json['salesByBranch'] as List<dynamic>?)
          ?.map((e) => NamedAmount.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  paymentBreakdown:
      (json['paymentBreakdown'] as List<dynamic>?)
          ?.map((e) => NamedAmount.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  recentOrders:
      (json['recentOrders'] as List<dynamic>?)
          ?.map((e) => OrderSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  recentActivity:
      (json['recentActivity'] as List<dynamic>?)
          ?.map((e) => ActivityEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DashboardToJson(_Dashboard instance) => <String, dynamic>{
  'today': instance.today.toJson(),
  'topItems': instance.topItems.map((e) => e.toJson()).toList(),
  'salesByBranch': instance.salesByBranch.map((e) => e.toJson()).toList(),
  'paymentBreakdown': instance.paymentBreakdown.map((e) => e.toJson()).toList(),
  'recentOrders': instance.recentOrders.map((e) => e.toJson()).toList(),
  'recentActivity': instance.recentActivity.map((e) => e.toJson()).toList(),
};

_StaffMember _$StaffMemberFromJson(Map<String, dynamic> json) => _StaffMember(
  id: json['id'] as String,
  userId: json['userId'] as String,
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  staffRole: $enumDecode(_$StaffRoleWireEnumMap, json['staffRole'], unknownValue: StaffRoleWire.unknown),
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String? ?? '',
  status: $enumDecode(_$StaffStatusEnumMap, json['status'], unknownValue: StaffStatus.unknown),
  onDuty: json['onDuty'] as bool? ?? false,
  lastLoginAt: json['lastLoginAt'] == null ? null : DateTime.parse(json['lastLoginAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$StaffMemberToJson(_StaffMember instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'name': ?instance.name,
  'email': ?instance.email,
  'phone': ?instance.phone,
  'staffRole': _$StaffRoleWireEnumMap[instance.staffRole]!,
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'status': _$StaffStatusEnumMap[instance.status]!,
  'onDuty': instance.onDuty,
  'lastLoginAt': ?instance.lastLoginAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$StaffRoleWireEnumMap = {
  StaffRoleWire.branchManager: 'BRANCH_MANAGER',
  StaffRoleWire.cashier: 'CASHIER',
  StaffRoleWire.kitchenStaff: 'KITCHEN_STAFF',
  StaffRoleWire.deliveryAgent: 'DELIVERY_AGENT',
  StaffRoleWire.unknown: 'UNKNOWN',
};

const _$StaffStatusEnumMap = {
  StaffStatus.active: 'ACTIVE',
  StaffStatus.suspended: 'SUSPENDED',
  StaffStatus.inactive: 'INACTIVE',
  StaffStatus.unknown: 'UNKNOWN',
};

_ShiftSummary _$ShiftSummaryFromJson(Map<String, dynamic> json) => _ShiftSummary(
  orderCount: (json['orderCount'] as num?)?.toInt() ?? 0,
  salesTotal: (json['salesTotal'] as num?)?.toInt() ?? 0,
  cashTotal: (json['cashTotal'] as num?)?.toInt() ?? 0,
  cardTotal: (json['cardTotal'] as num?)?.toInt() ?? 0,
  codTotal: (json['codTotal'] as num?)?.toInt() ?? 0,
  onlineTotal: (json['onlineTotal'] as num?)?.toInt() ?? 0,
  cancelledCount: (json['cancelledCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ShiftSummaryToJson(_ShiftSummary instance) => <String, dynamic>{
  'orderCount': instance.orderCount,
  'salesTotal': instance.salesTotal,
  'cashTotal': instance.cashTotal,
  'cardTotal': instance.cardTotal,
  'codTotal': instance.codTotal,
  'onlineTotal': instance.onlineTotal,
  'cancelledCount': instance.cancelledCount,
};

_Shift _$ShiftFromJson(Map<String, dynamic> json) => _Shift(
  id: json['id'] as String,
  branchId: json['branchId'] as String,
  staffId: json['staffId'] as String,
  staffName: json['staffName'] as String?,
  status: json['status'] as String,
  openedAt: DateTime.parse(json['openedAt'] as String),
  closedAt: json['closedAt'] == null ? null : DateTime.parse(json['closedAt'] as String),
  openingFloat: (json['openingFloat'] as num?)?.toInt() ?? 0,
  expectedCash: (json['expectedCash'] as num?)?.toInt(),
  countedCash: (json['countedCash'] as num?)?.toInt(),
  variance: (json['variance'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  summary: json['summary'] == null
      ? const ShiftSummary()
      : ShiftSummary.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShiftToJson(_Shift instance) => <String, dynamic>{
  'id': instance.id,
  'branchId': instance.branchId,
  'staffId': instance.staffId,
  'staffName': ?instance.staffName,
  'status': instance.status,
  'openedAt': instance.openedAt.toIso8601String(),
  'closedAt': ?instance.closedAt?.toIso8601String(),
  'openingFloat': instance.openingFloat,
  'expectedCash': ?instance.expectedCash,
  'countedCash': ?instance.countedCash,
  'variance': ?instance.variance,
  'notes': ?instance.notes,
  'summary': instance.summary.toJson(),
};

_Reservation _$ReservationFromJson(Map<String, dynamic> json) => _Reservation(
  id: json['id'] as String,
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String? ?? '',
  name: json['name'] as String,
  phone: json['phone'] as String,
  partySize: (json['partySize'] as num).toInt(),
  reservedFor: DateTime.parse(json['reservedFor'] as String),
  durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 90,
  status: json['status'] as String,
  notes: json['notes'] as String?,
  cancelReason: json['cancelReason'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ReservationToJson(_Reservation instance) => <String, dynamic>{
  'id': instance.id,
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'name': instance.name,
  'phone': instance.phone,
  'partySize': instance.partySize,
  'reservedFor': instance.reservedFor.toIso8601String(),
  'durationMinutes': instance.durationMinutes,
  'status': instance.status,
  'notes': ?instance.notes,
  'cancelReason': ?instance.cancelReason,
  'createdAt': instance.createdAt.toIso8601String(),
};

_WaitlistEntry _$WaitlistEntryFromJson(Map<String, dynamic> json) => _WaitlistEntry(
  id: json['id'] as String,
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String? ?? '',
  name: json['name'] as String,
  phone: json['phone'] as String?,
  partySize: (json['partySize'] as num).toInt(),
  status: json['status'] as String,
  position: (json['position'] as num?)?.toInt(),
  estimatedWaitMinutes: (json['estimatedWaitMinutes'] as num?)?.toInt(),
  joinedAt: DateTime.parse(json['joinedAt'] as String),
  notifiedAt: json['notifiedAt'] == null ? null : DateTime.parse(json['notifiedAt'] as String),
  expiresAt: json['expiresAt'] == null ? null : DateTime.parse(json['expiresAt'] as String),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$WaitlistEntryToJson(_WaitlistEntry instance) => <String, dynamic>{
  'id': instance.id,
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'name': instance.name,
  'phone': ?instance.phone,
  'partySize': instance.partySize,
  'status': instance.status,
  'position': ?instance.position,
  'estimatedWaitMinutes': ?instance.estimatedWaitMinutes,
  'joinedAt': instance.joinedAt.toIso8601String(),
  'notifiedAt': ?instance.notifiedAt?.toIso8601String(),
  'expiresAt': ?instance.expiresAt?.toIso8601String(),
  'notes': ?instance.notes,
};
