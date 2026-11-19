import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart' show Options;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_failure.dart';
import '../../core/network/api_client.dart';
import '../../core/network/auth/auth_interceptor.dart';
import '../../core/network/auth/token_store.dart';
import '../../core/providers.dart';
import '../domain/auth_models.dart';
import 'permissions.dart';

/// The signed-in staff member.
class StaffSession {
  const StaffSession({required this.user, required this.role});

  final AppUser user;
  final StaffRole role;

  bool can(Capability c) => role.can(c);

  /// Staff work at one branch. The owner has none of their own.
  String? get ownBranchId => user.staffProfile?.branchId;
  String? get ownBranchName => user.staffProfile?.branchName;
}

final staffTokenStoreProvider = Provider<TokenStore>(
  (ref) => SecureTokenStore(ref.watch(secureStorageProvider)),
);

/// Client without the auth interceptor: sign-in, refresh and request replays.
final staffPublicApiProvider = Provider<ApiClient>((ref) {
  return ApiClient.create(baseUrl: ref.watch(appConfigProvider).apiBaseUrl);
});

AuthTokens _tokensOf(Object? data) =>
    AuthTokens.fromJson(Map<String, dynamic>.from((data! as Map)['tokens'] as Map));

final tokenRefresherProvider = Provider<TokenRefresher>((ref) {
  final api = ref.watch(staffPublicApiProvider);
  return TokenRefresher(
    store: ref.watch(staffTokenStoreProvider),
    refreshCall: (refreshToken) async {
      try {
        final r = await api.post('/auth/refresh', body: {'refreshToken': refreshToken}, decode: _tokensOf);
        return r.data;
      } on ApiFailure catch (e) {
        // 400/401/403: the refresh token is no longer valid. Anything else is transient.
        if (e.statusCode >= 400 && e.statusCode < 500 && e.statusCode != 429) return null;
        rethrow;
      }
    },
    onSessionExpired: () => ref.read(sessionProvider.notifier).expired(),
  );
});

/// Client for every authenticated staff call.
final staffApiProvider = Provider<ApiClient>((ref) {
  final config = ref.watch(appConfigProvider);
  final store = ref.watch(staffTokenStoreProvider);
  final retry = ref.watch(staffPublicApiProvider).dio;
  final client = ApiClient.create(baseUrl: config.apiBaseUrl);
  client.dio.interceptors.insert(
    0,
    AuthInterceptor(store: store, refresher: ref.watch(tokenRefresherProvider), retryDio: retry),
  );
  return client;
});

class SessionController extends AsyncNotifier<StaffSession?> {
  static const _userKey = 'staff.user.v1';

  /// Set when the server ended the session (shown once on the sign-in screen).
  bool sessionEnded = false;

  @override
  Future<StaffSession?> build() async {
    final store = ref.read(staffTokenStoreProvider);
    if (await store.read() == null) return null;
    try {
      final user = await ref
          .read(staffApiProvider)
          .get('/auth/me', decode: (d) => AppUser.fromJson(asJsonMap(d)));
      return await _accept(user);
    } on NetworkFailure {
      // Offline at start: keep working with the last known profile.
      final cached = await _cachedUser();
      return cached == null ? null : _sessionOf(cached);
    } on AppFailure {
      await _clear();
      return null;
    }
  }

  Future<void> login({
    required String email,
    required String password,
    String deviceName = 'Staff app',
  }) async {
    final r = await ref
        .read(staffPublicApiProvider)
        .post(
          '/auth/login',
          body: {'email': email.trim(), 'password': password, 'deviceName': deviceName},
          decode: (d) => (user: AppUser.fromJson(asJsonMap((d! as Map)['user'])), tokens: _tokensOf(d)),
        );
    final role = StaffRole.of(r.data.user);
    if (role == null) {
      // Sign the rejected session out again so it does not linger on the server.
      unawaited(_revoke(r.data.tokens));
      throw AccessFailure(_rejectionMessage(r.data.user));
    }
    await ref.read(staffTokenStoreProvider).write(r.data.tokens);
    sessionEnded = false;
    state = AsyncData(await _accept(r.data.user));
  }

  /// Reloads the profile (role, branch, on-duty flag).
  Future<void> refreshProfile() async {
    final user = await ref
        .read(staffApiProvider)
        .get('/auth/me', decode: (d) => AppUser.fromJson(asJsonMap(d)));
    state = AsyncData(await _accept(user));
  }

  /// Updates the cached profile after a change made elsewhere (e.g. duty toggle).
  void updateUser(AppUser user) {
    final role = StaffRole.of(user);
    if (role != null) state = AsyncData(StaffSession(user: user, role: role));
  }

  Future<void> logout() async {
    final tokens = await ref.read(staffTokenStoreProvider).read();
    if (tokens != null) await _revoke(tokens);
    await _clear();
    state = const AsyncData(null);
  }

  /// Called when a refresh is rejected (token revoked, reused or expired).
  void expired() {
    sessionEnded = true;
    unawaited(_clear());
    state = const AsyncData(null);
  }

  Future<StaffSession?> _accept(AppUser user) async {
    final session = _sessionOf(user);
    if (session == null) {
      await _clear();
      return null;
    }
    await ref.read(secureStorageProvider).write(key: _userKey, value: jsonEncode(user.toJson()));
    return session;
  }

  StaffSession? _sessionOf(AppUser user) {
    final role = StaffRole.of(user);
    return role == null ? null : StaffSession(user: user, role: role);
  }

  Future<AppUser?> _cachedUser() async {
    final raw = await ref.read(secureStorageProvider).read(key: _userKey);
    if (raw == null) return null;
    try {
      return AppUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> _revoke(AuthTokens tokens) async {
    try {
      final api = ref.read(staffPublicApiProvider);
      await api.dio.post<Object?>(
        'auth/logout',
        data: {'refreshToken': tokens.refreshToken},
        options: Options(headers: {'Authorization': 'Bearer ${tokens.accessToken}'}),
      );
    } catch (_) {
      // Best effort: the local sign-out still happens.
    }
  }

  Future<void> _clear() async {
    await ref.read(staffTokenStoreProvider).clear();
    await ref.read(secureStorageProvider).delete(key: _userKey);
  }

  static String _rejectionMessage(AppUser user) {
    if (user.globalRole == GlobalRole.customer) {
      return 'This app is for Ox & Grill staff. Customers can order in the Ox & Grill app.';
    }
    final status = user.staffProfile?.status;
    if (status != null && status != StaffStatus.active) {
      return 'Your staff account is ${status.label.toLowerCase()}. Please contact your branch manager.';
    }
    return 'This account has no staff role. Please contact your branch manager.';
  }
}

final sessionProvider = AsyncNotifierProvider<SessionController, StaffSession?>(
  SessionController.new,
  retry: (_, _) => null,
);
