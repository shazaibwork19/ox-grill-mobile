// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quote _$QuoteFromJson(Map<String, dynamic> json) => _Quote(
  branchId: json['branchId'] as String,
  orderType: $enumDecode(_$OrderTypeEnumMap, json['orderType'], unknownValue: OrderType.unknown),
  lines:
      (json['lines'] as List<dynamic>?)?.map((e) => QuoteLine.fromJson(e as Map<String, dynamic>)).toList() ??
      const [],
  totals: Totals.fromJson(json['totals'] as Map<String, dynamic>),
  issues:
      (json['issues'] as List<dynamic>?)
          ?.map((e) => QuoteIssue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  minDeliveryOrder: (json['minDeliveryOrder'] as num?)?.toInt() ?? 0,
  meetsMinimum: json['meetsMinimum'] as bool? ?? true,
  allowedPaymentMethods:
      (json['allowedPaymentMethods'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PaymentMethodEnumMap, e, unknownValue: PaymentMethod.unknown))
          .toList() ??
      const [],
);

Map<String, dynamic> _$QuoteToJson(_Quote instance) => <String, dynamic>{
  'branchId': instance.branchId,
  'orderType': _$OrderTypeEnumMap[instance.orderType]!,
  'lines': instance.lines.map((e) => e.toJson()).toList(),
  'totals': instance.totals.toJson(),
  'issues': instance.issues.map((e) => e.toJson()).toList(),
  'minDeliveryOrder': instance.minDeliveryOrder,
  'meetsMinimum': instance.meetsMinimum,
  'allowedPaymentMethods': instance.allowedPaymentMethods.map((e) => _$PaymentMethodEnumMap[e]!).toList(),
};

const _$OrderTypeEnumMap = {
  OrderType.delivery: 'DELIVERY',
  OrderType.pickup: 'PICKUP',
  OrderType.dineIn: 'DINE_IN',
  OrderType.counterPos: 'COUNTER_POS',
  OrderType.unknown: 'UNKNOWN',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'CASH',
  PaymentMethod.cashOnDelivery: 'CASH_ON_DELIVERY',
  PaymentMethod.cardAtCounter: 'CARD_AT_COUNTER',
  PaymentMethod.online: 'ONLINE',
  PaymentMethod.unknown: 'UNKNOWN',
};

_QuoteLine _$QuoteLineFromJson(Map<String, dynamic> json) => _QuoteLine(
  menuItemId: json['menuItemId'] as String,
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toInt(),
  optionsTotal: (json['optionsTotal'] as num?)?.toInt() ?? 0,
  lineTotal: (json['lineTotal'] as num).toInt(),
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => PricedOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$QuoteLineToJson(_QuoteLine instance) => <String, dynamic>{
  'menuItemId': instance.menuItemId,
  'name': instance.name,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'optionsTotal': instance.optionsTotal,
  'lineTotal': instance.lineTotal,
  'options': instance.options.map((e) => e.toJson()).toList(),
  'notes': ?instance.notes,
};

_QuoteIssue _$QuoteIssueFromJson(Map<String, dynamic> json) => _QuoteIssue(
  index: (json['index'] as num).toInt(),
  menuItemId: json['menuItemId'] as String,
  code: json['code'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$QuoteIssueToJson(_QuoteIssue instance) => <String, dynamic>{
  'index': instance.index,
  'menuItemId': instance.menuItemId,
  'code': instance.code,
  'message': instance.message,
};
