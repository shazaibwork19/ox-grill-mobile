import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../core/session.dart';
import '../domain/auth_models.dart';
import '../domain/ops_models.dart';

/// Staff accounts, duty, shifts and the signed-in profile.
class PeopleRepository {
  PeopleRepository(this._api);

  final ApiClient _api;

  static String _b(String id) => '/branches/${Uri.encodeComponent(id)}';

  // ---- Me ----

  Future<StaffMember> setDuty(bool onDuty) async => (await _api.patch(
    '/staff/me/duty',
    body: {'onDuty': onDuty},
    decode: (d) => StaffMember.fromJson(asJsonMap(d)),
  )).data;

  Future<AppUser> updateProfile({String? name, String? email}) async => (await _api.patch(
    '/auth/me',
    body: {'name': ?name, 'email': ?email},
    decode: (d) => AppUser.fromJson(asJsonMap(d)),
  )).data;

  Future<void> changePassword({String? currentPassword, required String newPassword}) => _api.post(
    '/auth/me/password',
    body: {'currentPassword': ?currentPassword, 'newPassword': newPassword},
    decode: (_) => null,
  );

  // ---- Staff (branch manager: own branch; owner: any branch via /admin/staff) ----

  Future<Paged<StaffMember>> staff({
    String? branchId,
    bool admin = false,
    StaffRoleWire? role,
    String? query,
    int page = 1,
  }) {
    final q = {'page': page, 'pageSize': 50, 'role': role?.wire, 'q': query};
    if (admin) {
      return _api.getPage('/admin/staff', query: {...q, 'branchId': branchId}, item: StaffMember.fromJson);
    }
    return _api.getPage('${_b(branchId!)}/staff', query: q, item: StaffMember.fromJson);
  }

  /// [body] is `CreateStaff`: name, email, phone?, staffRole, temporaryPassword (+ branchId for admin).
  Future<StaffMember> createStaff({
    String? branchId,
    bool admin = false,
    required Map<String, Object?> body,
  }) async {
    final path = admin ? '/admin/staff' : '${_b(branchId!)}/staff';
    return (await _api.post(path, body: body, decode: (d) => StaffMember.fromJson(asJsonMap(d)))).data;
  }

  /// [patch] is `UpdateStaff`: name, phone, staffRole, branchId (admin), status, onDuty, resetPassword.
  Future<StaffMember> updateStaff(
    String staffId, {
    String? branchId,
    bool admin = false,
    required Map<String, Object?> patch,
  }) async {
    final path = admin ? '/admin/staff/$staffId' : '${_b(branchId!)}/staff/$staffId';
    return (await _api.patch(path, body: patch, decode: (d) => StaffMember.fromJson(asJsonMap(d)))).data;
  }

  // ---- Shifts ----

  Future<Shift?> currentShift(String branchId) => _api.get(
    '${_b(branchId)}/shifts/current',
    decode: (d) => d == null ? null : Shift.fromJson(asJsonMap(d)),
  );

  Future<Shift> openShift(String branchId, {required int openingFloat}) async => (await _api.post(
    '${_b(branchId)}/shifts/open',
    body: {'openingFloat': openingFloat},
    decode: (d) => Shift.fromJson(asJsonMap(d)),
  )).data;

  Future<Shift> closeShift(
    String branchId,
    String shiftId, {
    required int countedCash,
    String? notes,
  }) async => (await _api.post(
    '${_b(branchId)}/shifts/$shiftId/close',
    body: {'countedCash': countedCash, if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim()},
    decode: (d) => Shift.fromJson(asJsonMap(d)),
  )).data;

  Future<Paged<Shift>> shifts(String branchId, {int page = 1}) =>
      _api.getPage('${_b(branchId)}/shifts', query: {'page': page, 'pageSize': 30}, item: Shift.fromJson);
}

final peopleRepositoryProvider = Provider((ref) => PeopleRepository(ref.watch(staffApiProvider)));
