// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Totals _$TotalsFromJson(Map<String, dynamic> json) => _Totals(
  subtotal: (json['subtotal'] as num).toInt(),
  discountTotal: (json['discountTotal'] as num?)?.toInt() ?? 0,
  taxTotal: (json['taxTotal'] as num).toInt(),
  taxRateBps: (json['taxRateBps'] as num).toInt(),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num).toInt(),
  currency: json['currency'] as String? ?? 'PKR',
);

Map<String, dynamic> _$TotalsToJson(_Totals instance) => <String, dynamic>{
  'subtotal': instance.subtotal,
  'discountTotal': instance.discountTotal,
  'taxTotal': instance.taxTotal,
  'taxRateBps': instance.taxRateBps,
  'deliveryFee': instance.deliveryFee,
  'total': instance.total,
  'currency': instance.currency,
};

_PricedOption _$PricedOptionFromJson(Map<String, dynamic> json) => _PricedOption(
  id: json['id'] as String,
  groupName: json['groupName'] as String,
  name: json['name'] as String,
  priceDelta: (json['priceDelta'] as num).toInt(),
);

Map<String, dynamic> _$PricedOptionToJson(_PricedOption instance) => <String, dynamic>{
  'id': instance.id,
  'groupName': instance.groupName,
  'name': instance.name,
  'priceDelta': instance.priceDelta,
};
