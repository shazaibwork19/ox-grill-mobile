// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchServices _$BranchServicesFromJson(Map<String, dynamic> json) => _BranchServices(
  dineIn: json['dineIn'] as bool? ?? false,
  pickup: json['pickup'] as bool? ?? false,
  delivery: json['delivery'] as bool? ?? false,
);

Map<String, dynamic> _$BranchServicesToJson(_BranchServices instance) => <String, dynamic>{
  'dineIn': instance.dineIn,
  'pickup': instance.pickup,
  'delivery': instance.delivery,
};

_BranchOpenStatus _$BranchOpenStatusFromJson(Map<String, dynamic> json) => _BranchOpenStatus(
  isOpen: json['isOpen'] as bool,
  acceptingOrders: json['acceptingOrders'] as bool,
  todayOpensAt: json['todayOpensAt'] as String?,
  todayClosesAt: json['todayClosesAt'] as String?,
  label: json['label'] as String,
);

Map<String, dynamic> _$BranchOpenStatusToJson(_BranchOpenStatus instance) => <String, dynamic>{
  'isOpen': instance.isOpen,
  'acceptingOrders': instance.acceptingOrders,
  'todayOpensAt': ?instance.todayOpensAt,
  'todayClosesAt': ?instance.todayClosesAt,
  'label': instance.label,
};

_BranchSummary _$BranchSummaryFromJson(Map<String, dynamic> json) => _BranchSummary(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  city: json['city'] as String,
  area: json['area'] as String?,
  addressLine: json['addressLine'] as String,
  phone: json['phone'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  imageUrl: json['imageUrl'] as String?,
  services: BranchServices.fromJson(json['services'] as Map<String, dynamic>),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt() ?? 0,
  minDeliveryOrder: (json['minDeliveryOrder'] as num?)?.toInt() ?? 0,
  estimatedDeliveryMinutes: (json['estimatedDeliveryMinutes'] as num?)?.toInt() ?? 0,
  estimatedPickupMinutes: (json['estimatedPickupMinutes'] as num?)?.toInt() ?? 0,
  status: BranchOpenStatus.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BranchSummaryToJson(_BranchSummary instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'city': instance.city,
  'area': ?instance.area,
  'addressLine': instance.addressLine,
  'phone': instance.phone,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'imageUrl': ?instance.imageUrl,
  'services': instance.services.toJson(),
  'deliveryFee': instance.deliveryFee,
  'minDeliveryOrder': instance.minDeliveryOrder,
  'estimatedDeliveryMinutes': instance.estimatedDeliveryMinutes,
  'estimatedPickupMinutes': instance.estimatedPickupMinutes,
  'status': instance.status.toJson(),
};

_BranchHours _$BranchHoursFromJson(Map<String, dynamic> json) => _BranchHours(
  dayOfWeek: (json['dayOfWeek'] as num).toInt(),
  opensAt: json['opensAt'] as String,
  closesAt: json['closesAt'] as String,
  isClosed: json['isClosed'] as bool? ?? false,
);

Map<String, dynamic> _$BranchHoursToJson(_BranchHours instance) => <String, dynamic>{
  'dayOfWeek': instance.dayOfWeek,
  'opensAt': instance.opensAt,
  'closesAt': instance.closesAt,
  'isClosed': instance.isClosed,
};

_BranchDetail _$BranchDetailFromJson(Map<String, dynamic> json) => _BranchDetail(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  city: json['city'] as String,
  area: json['area'] as String?,
  addressLine: json['addressLine'] as String,
  phone: json['phone'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  imageUrl: json['imageUrl'] as String?,
  services: BranchServices.fromJson(json['services'] as Map<String, dynamic>),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt() ?? 0,
  minDeliveryOrder: (json['minDeliveryOrder'] as num?)?.toInt() ?? 0,
  estimatedDeliveryMinutes: (json['estimatedDeliveryMinutes'] as num?)?.toInt() ?? 0,
  estimatedPickupMinutes: (json['estimatedPickupMinutes'] as num?)?.toInt() ?? 0,
  status: BranchOpenStatus.fromJson(json['status'] as Map<String, dynamic>),
  email: json['email'] as String?,
  timezone: json['timezone'] as String? ?? 'Asia/Karachi',
  hours:
      (json['hours'] as List<dynamic>?)
          ?.map((e) => BranchHours.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  paymentMethods:
      (json['paymentMethods'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ) ??
      const {},
  taxRateCashBps: (json['taxRateCashBps'] as num?)?.toInt() ?? 0,
  taxRateCardBps: (json['taxRateCardBps'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BranchDetailToJson(_BranchDetail instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'city': instance.city,
  'area': ?instance.area,
  'addressLine': instance.addressLine,
  'phone': instance.phone,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'imageUrl': ?instance.imageUrl,
  'services': instance.services.toJson(),
  'deliveryFee': instance.deliveryFee,
  'minDeliveryOrder': instance.minDeliveryOrder,
  'estimatedDeliveryMinutes': instance.estimatedDeliveryMinutes,
  'estimatedPickupMinutes': instance.estimatedPickupMinutes,
  'status': instance.status.toJson(),
  'email': ?instance.email,
  'timezone': instance.timezone,
  'hours': instance.hours.map((e) => e.toJson()).toList(),
  'paymentMethods': instance.paymentMethods,
  'taxRateCashBps': instance.taxRateCashBps,
  'taxRateCardBps': instance.taxRateCardBps,
};
