import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Chooses the `Idempotency-Key` for `POST /orders`.
///
/// One key per checkout attempt. The same request body (same cart, same
/// details) keeps the same key across retries, timeouts and app restarts, so
/// the server can return the original order instead of creating a duplicate.
/// A different body gets a fresh key (the server rejects a reused key with a
/// different body as `IDEMPOTENCY_KEY_REUSED`).
class IdempotencyKeys {
  IdempotencyKeys(this._prefs, {String Function()? newKey}) : _newKey = newKey ?? const Uuid().v4;

  static const _storageKey = 'checkout.pendingAttempt.v1';

  final SharedPreferences _prefs;
  final String Function() _newKey;

  /// Canonical JSON of the request body. Map keys are sorted so the same
  /// content always produces the same fingerprint.
  static String fingerprint(Object? body) => jsonEncode(_canonical(body));

  static Object? _canonical(Object? v) {
    if (v is Map) {
      final keys = v.keys.map((k) => k.toString()).toList()..sort();
      return {for (final k in keys) k: _canonical(v[k])};
    }
    if (v is List) return v.map(_canonical).toList();
    return v;
  }

  /// The key to send for [body]: the pending one if the body is unchanged,
  /// otherwise a new key (which becomes the pending one).
  /// The new key is stored before it is returned, so it survives the app
  /// being killed while the request is in flight.
  Future<String> keyFor(Map<String, Object?> body) async {
    final fp = fingerprint(body);
    final pending = _readPending();
    if (pending != null && pending.fingerprint == fp) return pending.key;
    final key = _newKey();
    await _prefs.setString(_storageKey, jsonEncode({'key': key, 'fingerprint': fp}));
    return key;
  }

  /// Call after a 201: the attempt is finished, the next checkout starts fresh.
  Future<void> complete() => _prefs.remove(_storageKey);

  /// Whether an attempt with an unknown outcome is waiting to be retried.
  bool get hasPendingAttempt => _readPending() != null;

  ({String key, String fingerprint})? _readPending() {
    final raw = _prefs.getString(_storageKey);
    if (raw == null) return null;
    try {
      final m = jsonDecode(raw) as Map<String, dynamic>;
      return (key: m['key'] as String, fingerprint: m['fingerprint'] as String);
    } catch (_) {
      return null;
    }
  }
}
