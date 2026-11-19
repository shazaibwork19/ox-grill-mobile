import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@JsonEnum(valueField: 'wire')
enum GlobalRole {
  customer('CUSTOMER'),
  staff('STAFF'),
  superAdmin('SUPER_ADMIN'),
  unknown('UNKNOWN');

  const GlobalRole(this.wire);
  final String wire;
}

@JsonEnum(valueField: 'wire')
enum StaffRoleWire {
  branchManager('BRANCH_MANAGER'),
  cashier('CASHIER'),
  kitchenStaff('KITCHEN_STAFF'),
  deliveryAgent('DELIVERY_AGENT'),
  unknown('UNKNOWN');

  const StaffRoleWire(this.wire);
  final String wire;

  String get label => switch (this) {
    branchManager => 'Branch manager',
    cashier => 'Cashier',
    kitchenStaff => 'Kitchen',
    deliveryAgent => 'Rider',
    unknown => 'Staff',
  };

  static const assignable = [branchManager, cashier, kitchenStaff, deliveryAgent];
}

@JsonEnum(valueField: 'wire')
enum StaffStatus {
  active('ACTIVE'),
  suspended('SUSPENDED'),
  inactive('INACTIVE'),
  unknown('UNKNOWN');

  const StaffStatus(this.wire);
  final String wire;

  String get label => switch (this) {
    active => 'Active',
    suspended => 'Suspended',
    inactive => 'Inactive',
    unknown => 'Unknown',
  };
}

@freezed
abstract class StaffProfile with _$StaffProfile {
  const factory StaffProfile({
    required String id,
    required String branchId,
    @Default('') String branchName,
    @JsonKey(unknownEnumValue: StaffRoleWire.unknown) required StaffRoleWire staffRole,
    @JsonKey(unknownEnumValue: StaffStatus.unknown) required StaffStatus status,
    @Default(false) bool onDuty,
  }) = _StaffProfile;

  factory StaffProfile.fromJson(Map<String, dynamic> json) => _$StaffProfileFromJson(json);
}

/// `User` from `/auth/login`, `/auth/refresh` and `/auth/me`.
@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    String? name,
    String? phone,
    String? email,
    @JsonKey(unknownEnumValue: GlobalRole.unknown) required GlobalRole globalRole,
    @Default(false) bool hasPassword,
    StaffProfile? staffProfile,
  }) = _AppUser;

  const AppUser._();

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  String get displayName => (name?.trim().isNotEmpty ?? false) ? name! : (email ?? 'Staff member');
}
