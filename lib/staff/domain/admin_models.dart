import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/branches/domain/branch.dart';
import '../../features/menu/domain/menu.dart';

part 'admin_models.freezed.dart';
part 'admin_models.g.dart';

/// `BranchAdmin`: full branch configuration (`/branches/{b}/settings`, `/admin/branches`).
@freezed
abstract class BranchAdmin with _$BranchAdmin {
  const factory BranchAdmin({
    required String id,
    required String slug,
    required String name,
    required String city,
    String? area,
    required String addressLine,
    required String phone,
    double? latitude,
    double? longitude,
    String? imageUrl,
    required BranchServices services,
    @Default(0) int deliveryFee,
    @Default(0) int minDeliveryOrder,
    @Default(45) int estimatedDeliveryMinutes,
    @Default(20) int estimatedPickupMinutes,
    required BranchOpenStatus status,
    String? email,
    @Default('Asia/Karachi') String timezone,
    @Default(0) int seatingCapacity,
    @Default([]) List<BranchHours> hours,
    @Default(0) int taxRateCashBps,
    @Default(0) int taxRateCardBps,
    @Default(true) bool isActive,
    @Default(true) bool acceptsOrders,
    @Default(true) bool enforceOpeningHours,
    double? deliveryRadiusKm,
    @Default(60) int avgTableTurnoverMinutes,
    @Default(90) int reservationDurationMinutes,
    @Default(0) int staffCount,
  }) = _BranchAdmin;

  factory BranchAdmin.fromJson(Map<String, dynamic> json) => _$BranchAdminFromJson(json);
}

/// `AdminMenuItem`: a global menu item with its option groups.
@freezed
abstract class AdminMenuItem with _$AdminMenuItem {
  const factory AdminMenuItem({
    required String id,
    required String slug,
    required String name,
    @Default('') String description,
    String? imageUrl,
    required String categoryId,
    @Default('') String categoryName,
    required int basePrice,
    @Default(false) bool isFeatured,
    @Default(0) int preparationMinutes,
    @Default([]) List<String> tags,
    @Default([]) List<String> dietary,
    String? comboRole,
    @Default(false) bool hasOptions,
    @Default(true) bool isActive,
    @Default(0) int sortOrder,
    @Default([]) List<MenuOptionGroup> optionGroups,
    @Default(0) int branchCount,
  }) = _AdminMenuItem;

  factory AdminMenuItem.fromJson(Map<String, dynamic> json) => _$AdminMenuItemFromJson(json);
}

@freezed
abstract class AdminUser with _$AdminUser {
  const factory AdminUser({
    required String id,
    String? name,
    String? email,
    String? phone,
    required String status,
    DateTime? lastLoginAt,
    required DateTime createdAt,
    @Default(false) bool isYou,
  }) = _AdminUser;

  factory AdminUser.fromJson(Map<String, dynamic> json) => _$AdminUserFromJson(json);
}

@freezed
abstract class Customer with _$Customer {
  const factory Customer({
    required String id,
    String? name,
    String? phone,
    String? email,
    required String status,
    @Default(0) int orderCount,
    @Default(0) int totalSpent,
    DateTime? lastOrderAt,
    required DateTime createdAt,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
}

@freezed
abstract class AuditLog with _$AuditLog {
  const factory AuditLog({
    required String id,
    String? actorId,
    String? actorName,
    @Default('') String actorRole,
    required String action,
    required String entityType,
    String? entityId,
    String? branchId,
    Object? before,
    Object? after,
    String? ip,
    required DateTime createdAt,
  }) = _AuditLog;

  factory AuditLog.fromJson(Map<String, dynamic> json) => _$AuditLogFromJson(json);
}

/// `SystemSetting`: a feature flag or setting. `value` is bool, number, string or null.
@freezed
abstract class SystemSetting with _$SystemSetting {
  const factory SystemSetting({
    required String key,
    Object? value,
    String? description,
    @Default('environment') String source,
    DateTime? updatedAt,
  }) = _SystemSetting;

  factory SystemSetting.fromJson(Map<String, dynamic> json) => _$SystemSettingFromJson(json);
}

/// Re-exported for admin category screens.
typedef AdminCategory = MenuCategory;
