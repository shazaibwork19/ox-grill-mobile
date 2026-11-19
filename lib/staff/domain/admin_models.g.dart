// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchAdmin _$BranchAdminFromJson(Map<String, dynamic> json) => _BranchAdmin(
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
  estimatedDeliveryMinutes: (json['estimatedDeliveryMinutes'] as num?)?.toInt() ?? 45,
  estimatedPickupMinutes: (json['estimatedPickupMinutes'] as num?)?.toInt() ?? 20,
  status: BranchOpenStatus.fromJson(json['status'] as Map<String, dynamic>),
  email: json['email'] as String?,
  timezone: json['timezone'] as String? ?? 'Asia/Karachi',
  seatingCapacity: (json['seatingCapacity'] as num?)?.toInt() ?? 0,
  hours:
      (json['hours'] as List<dynamic>?)
          ?.map((e) => BranchHours.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  taxRateCashBps: (json['taxRateCashBps'] as num?)?.toInt() ?? 0,
  taxRateCardBps: (json['taxRateCardBps'] as num?)?.toInt() ?? 0,
  isActive: json['isActive'] as bool? ?? true,
  acceptsOrders: json['acceptsOrders'] as bool? ?? true,
  enforceOpeningHours: json['enforceOpeningHours'] as bool? ?? true,
  deliveryRadiusKm: (json['deliveryRadiusKm'] as num?)?.toDouble(),
  avgTableTurnoverMinutes: (json['avgTableTurnoverMinutes'] as num?)?.toInt() ?? 60,
  reservationDurationMinutes: (json['reservationDurationMinutes'] as num?)?.toInt() ?? 90,
  staffCount: (json['staffCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BranchAdminToJson(_BranchAdmin instance) => <String, dynamic>{
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
  'seatingCapacity': instance.seatingCapacity,
  'hours': instance.hours.map((e) => e.toJson()).toList(),
  'taxRateCashBps': instance.taxRateCashBps,
  'taxRateCardBps': instance.taxRateCardBps,
  'isActive': instance.isActive,
  'acceptsOrders': instance.acceptsOrders,
  'enforceOpeningHours': instance.enforceOpeningHours,
  'deliveryRadiusKm': ?instance.deliveryRadiusKm,
  'avgTableTurnoverMinutes': instance.avgTableTurnoverMinutes,
  'reservationDurationMinutes': instance.reservationDurationMinutes,
  'staffCount': instance.staffCount,
};

_AdminMenuItem _$AdminMenuItemFromJson(Map<String, dynamic> json) => _AdminMenuItem(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  categoryId: json['categoryId'] as String,
  categoryName: json['categoryName'] as String? ?? '',
  basePrice: (json['basePrice'] as num).toInt(),
  isFeatured: json['isFeatured'] as bool? ?? false,
  preparationMinutes: (json['preparationMinutes'] as num?)?.toInt() ?? 0,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  dietary: (json['dietary'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  comboRole: json['comboRole'] as String?,
  hasOptions: json['hasOptions'] as bool? ?? false,
  isActive: json['isActive'] as bool? ?? true,
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  optionGroups:
      (json['optionGroups'] as List<dynamic>?)
          ?.map((e) => MenuOptionGroup.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  branchCount: (json['branchCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AdminMenuItemToJson(_AdminMenuItem instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'description': instance.description,
  'imageUrl': ?instance.imageUrl,
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'basePrice': instance.basePrice,
  'isFeatured': instance.isFeatured,
  'preparationMinutes': instance.preparationMinutes,
  'tags': instance.tags,
  'dietary': instance.dietary,
  'comboRole': ?instance.comboRole,
  'hasOptions': instance.hasOptions,
  'isActive': instance.isActive,
  'sortOrder': instance.sortOrder,
  'optionGroups': instance.optionGroups.map((e) => e.toJson()).toList(),
  'branchCount': instance.branchCount,
};

_AdminUser _$AdminUserFromJson(Map<String, dynamic> json) => _AdminUser(
  id: json['id'] as String,
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  status: json['status'] as String,
  lastLoginAt: json['lastLoginAt'] == null ? null : DateTime.parse(json['lastLoginAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  isYou: json['isYou'] as bool? ?? false,
);

Map<String, dynamic> _$AdminUserToJson(_AdminUser instance) => <String, dynamic>{
  'id': instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'phone': ?instance.phone,
  'status': instance.status,
  'lastLoginAt': ?instance.lastLoginAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'isYou': instance.isYou,
};

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
  id: json['id'] as String,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  status: json['status'] as String,
  orderCount: (json['orderCount'] as num?)?.toInt() ?? 0,
  totalSpent: (json['totalSpent'] as num?)?.toInt() ?? 0,
  lastOrderAt: json['lastOrderAt'] == null ? null : DateTime.parse(json['lastOrderAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'id': instance.id,
  'name': ?instance.name,
  'phone': ?instance.phone,
  'email': ?instance.email,
  'status': instance.status,
  'orderCount': instance.orderCount,
  'totalSpent': instance.totalSpent,
  'lastOrderAt': ?instance.lastOrderAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
};

_AuditLog _$AuditLogFromJson(Map<String, dynamic> json) => _AuditLog(
  id: json['id'] as String,
  actorId: json['actorId'] as String?,
  actorName: json['actorName'] as String?,
  actorRole: json['actorRole'] as String? ?? '',
  action: json['action'] as String,
  entityType: json['entityType'] as String,
  entityId: json['entityId'] as String?,
  branchId: json['branchId'] as String?,
  before: json['before'],
  after: json['after'],
  ip: json['ip'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AuditLogToJson(_AuditLog instance) => <String, dynamic>{
  'id': instance.id,
  'actorId': ?instance.actorId,
  'actorName': ?instance.actorName,
  'actorRole': instance.actorRole,
  'action': instance.action,
  'entityType': instance.entityType,
  'entityId': ?instance.entityId,
  'branchId': ?instance.branchId,
  'before': ?instance.before,
  'after': ?instance.after,
  'ip': ?instance.ip,
  'createdAt': instance.createdAt.toIso8601String(),
};

_SystemSetting _$SystemSettingFromJson(Map<String, dynamic> json) => _SystemSetting(
  key: json['key'] as String,
  value: json['value'],
  description: json['description'] as String?,
  source: json['source'] as String? ?? 'environment',
  updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$SystemSettingToJson(_SystemSetting instance) => <String, dynamic>{
  'key': instance.key,
  'value': ?instance.value,
  'description': ?instance.description,
  'source': instance.source,
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
};
