import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../../features/branches/domain/branch.dart';
import '../../features/menu/domain/menu.dart';
import '../core/session.dart';
import '../domain/admin_models.dart';

/// Owner (`SUPER_ADMIN`) back office: `/admin/*`.
class AdminRepository {
  AdminRepository(this._api);

  final ApiClient _api;

  // ---- Branches ----

  Future<BranchAdmin> branch(String id) =>
      _api.get('/admin/branches/$id', decode: (d) => BranchAdmin.fromJson(asJsonMap(d)));

  /// [body] is `CreateBranch`.
  Future<BranchAdmin> createBranch(Map<String, Object?> body) async => (await _api.post(
    '/admin/branches',
    body: body,
    decode: (d) => BranchAdmin.fromJson(asJsonMap(d)),
  )).data;

  /// [patch] is `UpdateBranch` (includes `isActive` to deactivate).
  Future<BranchAdmin> updateBranch(String id, Map<String, Object?> patch) async => (await _api.patch(
    '/admin/branches/$id',
    body: patch,
    decode: (d) => BranchAdmin.fromJson(asJsonMap(d)),
  )).data;

  Future<BranchAdmin> replaceHours(String id, List<BranchHours> hours) async => (await _api.put(
    '/admin/branches/$id/hours',
    body: {
      'hours': [for (final h in hours) h.toJson()],
    },
    decode: (d) => BranchAdmin.fromJson(asJsonMap(d)),
  )).data;

  // ---- Categories ----

  Future<List<MenuCategory>> categories() =>
      _api.get('/admin/categories', decode: (d) => asJsonList(d, MenuCategory.fromJson));

  /// [body] is `UpsertCategory`.
  Future<MenuCategory> createCategory(Map<String, Object?> body) async => (await _api.post(
    '/admin/categories',
    body: body,
    decode: (d) => MenuCategory.fromJson(asJsonMap(d)),
  )).data;

  Future<MenuCategory> updateCategory(String id, Map<String, Object?> patch) async => (await _api.patch(
    '/admin/categories/$id',
    body: patch,
    decode: (d) => MenuCategory.fromJson(asJsonMap(d)),
  )).data;

  /// Only empty categories can be deleted.
  Future<void> deleteCategory(String id) => _api.delete('/admin/categories/$id', decode: (_) => null);

  // ---- Menu items ----

  Future<List<AdminMenuItem>> menuItems({String? categoryId, String? query, bool includeInactive = true}) =>
      _api.get(
        '/admin/menu-items',
        query: {'categoryId': categoryId, 'q': query, 'includeInactive': includeInactive ? 'true' : 'false'},
        decode: (d) => asJsonList(d, AdminMenuItem.fromJson),
      );

  Future<AdminMenuItem> menuItem(String id) =>
      _api.get('/admin/menu-items/$id', decode: (d) => AdminMenuItem.fromJson(asJsonMap(d)));

  /// [body] is `CreateMenuItem` (base price in paisa, option groups inline).
  Future<AdminMenuItem> createMenuItem(Map<String, Object?> body) async => (await _api.post(
    '/admin/menu-items',
    body: body,
    decode: (d) => AdminMenuItem.fromJson(asJsonMap(d)),
  )).data;

  Future<AdminMenuItem> updateMenuItem(String id, Map<String, Object?> patch) async => (await _api.patch(
    '/admin/menu-items/$id',
    body: patch,
    decode: (d) => AdminMenuItem.fromJson(asJsonMap(d)),
  )).data;

  /// Archives (soft-deletes) the item.
  Future<void> archiveMenuItem(String id) => _api.delete('/admin/menu-items/$id', decode: (_) => null);

  /// JPEG, PNG, WebP or AVIF up to 5 MB. Returns the public URL.
  Future<String> uploadImage({
    required List<int> bytes,
    required String filename,
    required String contentType,
  }) async {
    final r = await _api.upload(
      '/admin/uploads',
      field: 'file',
      bytes: bytes,
      filename: filename,
      contentType: contentType,
      decode: (d) => (d! as Map)['url'] as String,
    );
    return r.data;
  }

  // ---- Owner logins ----

  Future<List<AdminUser>> admins() =>
      _api.get('/admin/admins', decode: (d) => asJsonList(d, AdminUser.fromJson));

  /// [body] is `CreateAdminUser`: name, email, phone?, password (≥ 10).
  Future<AdminUser> createAdmin(Map<String, Object?> body) async =>
      (await _api.post('/admin/admins', body: body, decode: (d) => AdminUser.fromJson(asJsonMap(d)))).data;

  /// [patch] is `UpdateAdminUser`: name, phone, status (ACTIVE|DISABLED), resetPassword.
  Future<AdminUser> updateAdmin(String id, Map<String, Object?> patch) async => (await _api.patch(
    '/admin/admins/$id',
    body: patch,
    decode: (d) => AdminUser.fromJson(asJsonMap(d)),
  )).data;

  // ---- Customers ----

  Future<Paged<Customer>> customers({String? query, int page = 1}) => _api.getPage(
    '/admin/customers',
    query: {'q': query, 'page': page, 'pageSize': 50},
    item: Customer.fromJson,
  );

  Future<Customer> setCustomerStatus(String id, {required bool active}) async => (await _api.patch(
    '/admin/customers/$id/status',
    body: {'status': active ? 'ACTIVE' : 'DISABLED'},
    decode: (d) => Customer.fromJson(asJsonMap(d)),
  )).data;

  // ---- Settings & audit ----

  Future<List<SystemSetting>> settings() =>
      _api.get('/admin/settings', decode: (d) => asJsonList(d, SystemSetting.fromJson));

  /// `value: null` resets the setting to the environment default.
  Future<SystemSetting> updateSetting(String key, Object? value) async => (await _api.patch(
    '/admin/settings/${Uri.encodeComponent(key)}',
    body: {'value': value},
    decode: (d) => SystemSetting.fromJson(asJsonMap(d)),
  )).data;

  Future<Paged<AuditLog>> auditLogs({String? entityType, String? branchId, int page = 1}) => _api.getPage(
    '/admin/audit-logs',
    query: {'entityType': entityType, 'branchId': branchId, 'page': page, 'pageSize': 50},
    item: AuditLog.fromJson,
  );
}

final adminRepositoryProvider = Provider((ref) => AdminRepository(ref.watch(staffApiProvider)));
