// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StaffProfile _$StaffProfileFromJson(Map<String, dynamic> json) => _StaffProfile(
  id: json['id'] as String,
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String? ?? '',
  staffRole: $enumDecode(_$StaffRoleWireEnumMap, json['staffRole'], unknownValue: StaffRoleWire.unknown),
  status: $enumDecode(_$StaffStatusEnumMap, json['status'], unknownValue: StaffStatus.unknown),
  onDuty: json['onDuty'] as bool? ?? false,
);

Map<String, dynamic> _$StaffProfileToJson(_StaffProfile instance) => <String, dynamic>{
  'id': instance.id,
  'branchId': instance.branchId,
  'branchName': instance.branchName,
  'staffRole': _$StaffRoleWireEnumMap[instance.staffRole]!,
  'status': _$StaffStatusEnumMap[instance.status]!,
  'onDuty': instance.onDuty,
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

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['id'] as String,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  globalRole: $enumDecode(_$GlobalRoleEnumMap, json['globalRole'], unknownValue: GlobalRole.unknown),
  hasPassword: json['hasPassword'] as bool? ?? false,
  staffProfile: json['staffProfile'] == null
      ? null
      : StaffProfile.fromJson(json['staffProfile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'name': ?instance.name,
  'phone': ?instance.phone,
  'email': ?instance.email,
  'globalRole': _$GlobalRoleEnumMap[instance.globalRole]!,
  'hasPassword': instance.hasPassword,
  'staffProfile': ?instance.staffProfile?.toJson(),
};

const _$GlobalRoleEnumMap = {
  GlobalRole.customer: 'CUSTOMER',
  GlobalRole.staff: 'STAFF',
  GlobalRole.superAdmin: 'SUPER_ADMIN',
  GlobalRole.unknown: 'UNKNOWN',
};
