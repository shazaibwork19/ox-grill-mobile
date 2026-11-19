import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_client.dart';
import '../core/session.dart';
import '../domain/ops_models.dart';

/// Reservations and the walk-in waitlist (features `reservations`, `waitlist`).
class FrontDeskRepository {
  FrontDeskRepository(this._api);

  final ApiClient _api;

  static String _b(String id) => '/branches/${Uri.encodeComponent(id)}';

  /// [date] is `YYYY-MM-DD` in restaurant time.
  Future<Paged<Reservation>> reservations(String branchId, {String? date, String? status, int page = 1}) =>
      _api.getPage(
        '${_b(branchId)}/reservations',
        query: {'date': date, 'status': status, 'page': page, 'pageSize': 100},
        item: Reservation.fromJson,
      );

  /// Phone booking: confirmed immediately.
  Future<Reservation> book(
    String branchId, {
    required String date,
    required String time,
    required int partySize,
    required String name,
    required String phone,
    String? notes,
  }) async => (await _api.post(
    '${_b(branchId)}/reservations',
    body: {
      'date': date,
      'time': time,
      'partySize': partySize,
      'name': name,
      'phone': phone,
      if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
    },
    decode: (d) => Reservation.fromJson(asJsonMap(d)),
  )).data;

  /// `CONFIRMED | SEATED | COMPLETED | CANCELLED | NO_SHOW`.
  Future<Reservation> setReservationStatus(
    String branchId,
    String id,
    String status, {
    String? reason,
  }) async => (await _api.patch(
    '${_b(branchId)}/reservations/$id/status',
    body: {'status': status, if (reason != null && reason.trim().isNotEmpty) 'reason': reason.trim()},
    decode: (d) => Reservation.fromJson(asJsonMap(d)),
  )).data;

  Future<List<WaitlistEntry>> waitlist(String branchId) =>
      _api.get('${_b(branchId)}/waitlist', decode: (d) => asJsonList(d, WaitlistEntry.fromJson));

  Future<WaitlistEntry> addWalkIn(
    String branchId, {
    required String name,
    String? phone,
    required int partySize,
    String? notes,
  }) async => (await _api.post(
    '${_b(branchId)}/waitlist',
    body: {
      'name': name,
      if (phone != null && phone.trim().isNotEmpty) 'phone': phone.trim(),
      'partySize': partySize,
      if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
    },
    decode: (d) => WaitlistEntry.fromJson(asJsonMap(d)),
  )).data;

  Future<WaitlistEntry> notifyNext(String branchId) async => (await _api.post(
    '${_b(branchId)}/waitlist/notify-next',
    decode: (d) => WaitlistEntry.fromJson(asJsonMap(d)),
  )).data;

  /// `NOTIFIED | SEATED | CANCELLED`.
  Future<WaitlistEntry> setWaitlistStatus(String branchId, String id, String status) async =>
      (await _api.patch(
        '${_b(branchId)}/waitlist/$id/status',
        body: {'status': status},
        decode: (d) => WaitlistEntry.fromJson(asJsonMap(d)),
      )).data;
}

final frontDeskRepositoryProvider = Provider((ref) => FrontDeskRepository(ref.watch(staffApiProvider)));
