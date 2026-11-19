// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartOption _$CartOptionFromJson(Map<String, dynamic> json) => _CartOption(
  id: json['id'] as String,
  groupId: json['groupId'] as String,
  groupName: json['groupName'] as String,
  name: json['name'] as String,
  priceDelta: (json['priceDelta'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CartOptionToJson(_CartOption instance) => <String, dynamic>{
  'id': instance.id,
  'groupId': instance.groupId,
  'groupName': instance.groupName,
  'name': instance.name,
  'priceDelta': instance.priceDelta,
};

_CartLine _$CartLineFromJson(Map<String, dynamic> json) => _CartLine(
  lineId: json['lineId'] as String,
  menuItemId: json['menuItemId'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String?,
  unitPrice: (json['unitPrice'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => CartOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CartLineToJson(_CartLine instance) => <String, dynamic>{
  'lineId': instance.lineId,
  'menuItemId': instance.menuItemId,
  'name': instance.name,
  'imageUrl': ?instance.imageUrl,
  'unitPrice': instance.unitPrice,
  'quantity': instance.quantity,
  'options': instance.options.map((e) => e.toJson()).toList(),
  'notes': ?instance.notes,
};
