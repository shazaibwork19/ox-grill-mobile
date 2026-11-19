// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  id: json['id'] as String,
  menuItemId: json['menuItemId'] as String?,
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toInt(),
  optionsTotal: (json['optionsTotal'] as num?)?.toInt() ?? 0,
  lineTotal: (json['lineTotal'] as num).toInt(),
  notes: json['notes'] as String?,
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => PricedOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) => <String, dynamic>{
  'id': instance.id,
  'menuItemId': ?instance.menuItemId,
  'name': instance.name,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'optionsTotal': instance.optionsTotal,
  'lineTotal': instance.lineTotal,
  'notes': ?instance.notes,
  'options': instance.options.map((e) => e.toJson()).toList(),
};

_DeliveryInfo _$DeliveryInfoFromJson(Map<String, dynamic> json) => _DeliveryInfo(
  addressLine: json['addressLine'] as String?,
  area: json['area'] as String?,
  city: json['city'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  instructions: json['instructions'] as String?,
);

Map<String, dynamic> _$DeliveryInfoToJson(_DeliveryInfo instance) => <String, dynamic>{
  'addressLine': ?instance.addressLine,
  'area': ?instance.area,
  'city': ?instance.city,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'instructions': ?instance.instructions,
};

_OrderAssignment _$OrderAssignmentFromJson(Map<String, dynamic> json) => _OrderAssignment(
  id: json['id'] as String,
  status: json['status'] as String,
  riderId: json['riderId'] as String,
  riderName: json['riderName'] as String?,
  riderPhone: json['riderPhone'] as String?,
  assignedAt: DateTime.parse(json['assignedAt'] as String),
);

Map<String, dynamic> _$OrderAssignmentToJson(_OrderAssignment instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'riderId': instance.riderId,
  'riderName': ?instance.riderName,
  'riderPhone': ?instance.riderPhone,
  'assignedAt': instance.assignedAt.toIso8601String(),
};

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: json['id'] as String,
  method: $enumDecode(_$PaymentMethodEnumMap, json['method'], unknownValue: PaymentMethod.unknown),
  provider: json['provider'] as String? ?? '',
  status: $enumDecode(_$PaymentStatusEnumMap, json['status'], unknownValue: PaymentStatus.unknown),
  amount: (json['amount'] as num).toInt(),
  refundedAmount: (json['refundedAmount'] as num?)?.toInt() ?? 0,
  paidAt: json['paidAt'] == null ? null : DateTime.parse(json['paidAt'] as String),
  checkoutUrl: json['checkoutUrl'] as String?,
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'method': _$PaymentMethodEnumMap[instance.method]!,
  'provider': instance.provider,
  'status': _$PaymentStatusEnumMap[instance.status]!,
  'amount': instance.amount,
  'refundedAmount': instance.refundedAmount,
  'paidAt': ?instance.paidAt?.toIso8601String(),
  'checkoutUrl': ?instance.checkoutUrl,
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'CASH',
  PaymentMethod.cashOnDelivery: 'CASH_ON_DELIVERY',
  PaymentMethod.cardAtCounter: 'CARD_AT_COUNTER',
  PaymentMethod.online: 'ONLINE',
  PaymentMethod.unknown: 'UNKNOWN',
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

_OrderStatusHistory _$OrderStatusHistoryFromJson(Map<String, dynamic> json) => _OrderStatusHistory(
  id: json['id'] as String,
  fromStatus: $enumDecodeNullable(
    _$OrderStatusEnumMap,
    json['fromStatus'],
    unknownValue: OrderStatus.unknown,
  ),
  toStatus: $enumDecode(_$OrderStatusEnumMap, json['toStatus'], unknownValue: OrderStatus.unknown),
  actorRole: json['actorRole'] as String? ?? 'SYSTEM',
  actorName: json['actorName'] as String?,
  reason: json['reason'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderStatusHistoryToJson(_OrderStatusHistory instance) => <String, dynamic>{
  'id': instance.id,
  'fromStatus': ?_$OrderStatusEnumMap[instance.fromStatus],
  'toStatus': _$OrderStatusEnumMap[instance.toStatus]!,
  'actorRole': instance.actorRole,
  'actorName': ?instance.actorName,
  'reason': ?instance.reason,
  'createdAt': instance.createdAt.toIso8601String(),
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

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  orderNumber: json['orderNumber'] as String,
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String,
  type: $enumDecode(_$OrderTypeEnumMap, json['type'], unknownValue: OrderType.unknown),
  status: $enumDecode(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown),
  source: json['source'] as String? ?? 'MOBILE',
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
  customerName: json['customerName'] as String?,
  customerPhone: json['customerPhone'] as String?,
  itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num).toInt(),
  currency: json['currency'] as String? ?? 'PKR',
  tableRef: json['tableRef'] as String?,
  placedAt: DateTime.parse(json['placedAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  items:
      (json['items'] as List<dynamic>?)?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>)).toList() ??
      const [],
  totals: Totals.fromJson(json['totals'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
  pickupName: json['pickupName'] as String?,
  delivery: json['delivery'] == null ? null : DeliveryInfo.fromJson(json['delivery'] as Map<String, dynamic>),
  payment: json['payment'] == null ? null : Payment.fromJson(json['payment'] as Map<String, dynamic>),
  assignment: json['assignment'] == null
      ? null
      : OrderAssignment.fromJson(json['assignment'] as Map<String, dynamic>),
  estimatedReadyAt: json['estimatedReadyAt'] == null
      ? null
      : DateTime.parse(json['estimatedReadyAt'] as String),
  confirmedAt: json['confirmedAt'] == null ? null : DateTime.parse(json['confirmedAt'] as String),
  readyAt: json['readyAt'] == null ? null : DateTime.parse(json['readyAt'] as String),
  completedAt: json['completedAt'] == null ? null : DateTime.parse(json['completedAt'] as String),
  cancelledAt: json['cancelledAt'] == null ? null : DateTime.parse(json['cancelledAt'] as String),
  cancelReason: json['cancelReason'] as String?,
  canCancel: json['canCancel'] as bool? ?? false,
  allowedTransitions:
      (json['allowedTransitions'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$OrderStatusEnumMap, e, unknownValue: OrderStatus.unknown))
          .toList() ??
      const [],
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => OrderStatusHistory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'type': _$OrderTypeEnumMap[instance.type]!,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'source': instance.source,
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
  'customerName': ?instance.customerName,
  'customerPhone': ?instance.customerPhone,
  'itemCount': instance.itemCount,
  'total': instance.total,
  'currency': instance.currency,
  'tableRef': ?instance.tableRef,
  'placedAt': instance.placedAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'totals': instance.totals.toJson(),
  'notes': ?instance.notes,
  'pickupName': ?instance.pickupName,
  'delivery': ?instance.delivery?.toJson(),
  'payment': ?instance.payment?.toJson(),
  'assignment': ?instance.assignment?.toJson(),
  'estimatedReadyAt': ?instance.estimatedReadyAt?.toIso8601String(),
  'confirmedAt': ?instance.confirmedAt?.toIso8601String(),
  'readyAt': ?instance.readyAt?.toIso8601String(),
  'completedAt': ?instance.completedAt?.toIso8601String(),
  'cancelledAt': ?instance.cancelledAt?.toIso8601String(),
  'cancelReason': ?instance.cancelReason,
  'canCancel': instance.canCancel,
  'allowedTransitions': instance.allowedTransitions.map((e) => _$OrderStatusEnumMap[e]!).toList(),
  'history': instance.history.map((e) => e.toJson()).toList(),
};

const _$OrderTypeEnumMap = {
  OrderType.delivery: 'DELIVERY',
  OrderType.pickup: 'PICKUP',
  OrderType.dineIn: 'DINE_IN',
  OrderType.counterPos: 'COUNTER_POS',
  OrderType.unknown: 'UNKNOWN',
};

_OrderSummary _$OrderSummaryFromJson(Map<String, dynamic> json) => _OrderSummary(
  id: json['id'] as String,
  orderNumber: json['orderNumber'] as String,
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String? ?? '',
  type: $enumDecode(_$OrderTypeEnumMap, json['type'], unknownValue: OrderType.unknown),
  status: $enumDecode(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown),
  source: json['source'] as String? ?? 'WEB',
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
  customerName: json['customerName'] as String?,
  customerPhone: json['customerPhone'] as String?,
  itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num).toInt(),
  tableRef: json['tableRef'] as String?,
  placedAt: DateTime.parse(json['placedAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$OrderSummaryToJson(_OrderSummary instance) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'type': _$OrderTypeEnumMap[instance.type]!,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'source': instance.source,
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
  'customerName': ?instance.customerName,
  'customerPhone': ?instance.customerPhone,
  'itemCount': instance.itemCount,
  'total': instance.total,
  'tableRef': ?instance.tableRef,
  'placedAt': instance.placedAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_TrackingStep _$TrackingStepFromJson(Map<String, dynamic> json) => _TrackingStep(
  status: $enumDecode(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown),
  label: json['label'] as String,
  reachedAt: json['reachedAt'] == null ? null : DateTime.parse(json['reachedAt'] as String),
  state: $enumDecode(_$TrackingStepStateEnumMap, json['state'], unknownValue: TrackingStepState.unknown),
);

Map<String, dynamic> _$TrackingStepToJson(_TrackingStep instance) => <String, dynamic>{
  'status': _$OrderStatusEnumMap[instance.status]!,
  'label': instance.label,
  'reachedAt': ?instance.reachedAt?.toIso8601String(),
  'state': _$TrackingStepStateEnumMap[instance.state]!,
};

const _$TrackingStepStateEnumMap = {
  TrackingStepState.done: 'done',
  TrackingStepState.current: 'current',
  TrackingStepState.upcoming: 'upcoming',
  TrackingStepState.unknown: 'unknown',
};

_TrackingContact _$TrackingContactFromJson(Map<String, dynamic> json) =>
    _TrackingContact(name: json['name'] as String?, phone: json['phone'] as String?);

Map<String, dynamic> _$TrackingContactToJson(_TrackingContact instance) => <String, dynamic>{
  'name': ?instance.name,
  'phone': ?instance.phone,
};

_TrackingBranch _$TrackingBranchFromJson(Map<String, dynamic> json) =>
    _TrackingBranch(id: json['id'] as String, name: json['name'] as String, phone: json['phone'] as String);

Map<String, dynamic> _$TrackingBranchToJson(_TrackingBranch instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
};

_LocationPoint _$LocationPointFromJson(Map<String, dynamic> json) => _LocationPoint(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  recordedAt: DateTime.parse(json['recordedAt'] as String),
);

Map<String, dynamic> _$LocationPointToJson(_LocationPoint instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'recordedAt': instance.recordedAt.toIso8601String(),
};

_OrderTracking _$OrderTrackingFromJson(Map<String, dynamic> json) => _OrderTracking(
  orderId: json['orderId'] as String,
  orderNumber: json['orderNumber'] as String,
  type: $enumDecode(_$OrderTypeEnumMap, json['type'], unknownValue: OrderType.unknown),
  status: $enumDecode(_$OrderStatusEnumMap, json['status'], unknownValue: OrderStatus.unknown),
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => TrackingStep.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => OrderStatusHistory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  estimatedReadyAt: json['estimatedReadyAt'] == null
      ? null
      : DateTime.parse(json['estimatedReadyAt'] as String),
  rider: json['rider'] == null ? null : TrackingContact.fromJson(json['rider'] as Map<String, dynamic>),
  riderLocation: json['riderLocation'] == null
      ? null
      : LocationPoint.fromJson(json['riderLocation'] as Map<String, dynamic>),
  branch: TrackingBranch.fromJson(json['branch'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderTrackingToJson(_OrderTracking instance) => <String, dynamic>{
  'orderId': instance.orderId,
  'orderNumber': instance.orderNumber,
  'type': _$OrderTypeEnumMap[instance.type]!,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'steps': instance.steps.map((e) => e.toJson()).toList(),
  'history': instance.history.map((e) => e.toJson()).toList(),
  'estimatedReadyAt': ?instance.estimatedReadyAt?.toIso8601String(),
  'rider': ?instance.rider?.toJson(),
  'riderLocation': ?instance.riderLocation?.toJson(),
  'branch': instance.branch.toJson(),
};

_PublicOrderStatus _$PublicOrderStatusFromJson(Map<String, dynamic> json) => _PublicOrderStatus(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  tracking: OrderTracking.fromJson(json['tracking'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PublicOrderStatusToJson(_PublicOrderStatus instance) => <String, dynamic>{
  'order': instance.order.toJson(),
  'tracking': instance.tracking.toJson(),
};

_PaymentAction _$PaymentActionFromJson(Map<String, dynamic> json) =>
    _PaymentAction(type: json['type'] as String, url: json['url'] as String);

Map<String, dynamic> _$PaymentActionToJson(_PaymentAction instance) => <String, dynamic>{
  'type': instance.type,
  'url': instance.url,
};

_CreateOrderResult _$CreateOrderResultFromJson(Map<String, dynamic> json) => _CreateOrderResult(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  paymentAction: json['paymentAction'] == null
      ? null
      : PaymentAction.fromJson(json['paymentAction'] as Map<String, dynamic>),
  changeDue: (json['changeDue'] as num?)?.toInt(),
  trackingToken: json['trackingToken'] as String?,
);

Map<String, dynamic> _$CreateOrderResultToJson(_CreateOrderResult instance) => <String, dynamic>{
  'order': instance.order.toJson(),
  'paymentAction': ?instance.paymentAction?.toJson(),
  'changeDue': ?instance.changeDue,
  'trackingToken': ?instance.trackingToken,
};
