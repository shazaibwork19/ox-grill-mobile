import 'dart:async';

import 'package:dio/dio.dart';

import 'token_store.dart';

/// Calls `POST /auth/refresh`. Returns the new pair, or `null` when the
/// session is gone (refresh token expired, revoked or reused). Throws for
/// transient problems (offline, timeout, 5xx): the tokens are kept and the
/// user stays signed in.
typedef RefreshCall = Future<AuthTokens?> Function(String refreshToken);

/// Runs at most one refresh at a time. Callers that arrive while a refresh is
/// in flight wait for the same result instead of starting their own, because
/// refresh tokens rotate and a second refresh with the old token would revoke
/// the whole session.
class TokenRefresher {
  TokenRefresher({required this.store, required this.refreshCall, this.onSessionExpired});

  final TokenStore store;
  final RefreshCall refreshCall;
  final void Function()? onSessionExpired;

  Future<AuthTokens?>? _inFlight;

  Future<AuthTokens?> refresh() => _inFlight ??= _run().whenComplete(() => _inFlight = null);

  Future<AuthTokens?> _run() async {
    final current = await store.read();
    if (current == null) return null;
    final next = await refreshCall(current.refreshToken);
    if (next == null) {
      await store.clear();
      onSessionExpired?.call();
      return null;
    }
    await store.write(next);
    return next;
  }
}

/// Adds `Authorization: Bearer …` and recovers once from `401 TOKEN_EXPIRED`.
///
/// Requests flagged with `extra[AuthInterceptor.skipAuth] = true` (sign-in,
/// refresh, guest checkout) are sent without a token.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.store, required this.refresher, required this.retryDio});

  static const skipAuth = 'skipAuth';
  static const _retried = 'authRetried';

  final TokenStore store;
  final TokenRefresher refresher;

  /// Used to replay the failed request; must not contain this interceptor.
  final Dio retryDio;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra[skipAuth] != true) {
      final tokens = await store.read();
      if (tokens != null) options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    if (!_isTokenExpired(err) || options.extra[_retried] == true || options.extra[skipAuth] == true) {
      return handler.next(err);
    }
    final AuthTokens? tokens;
    try {
      tokens = await refresher.refresh();
    } catch (_) {
      // Offline or server trouble while refreshing: report the original 401.
      return handler.next(err);
    }
    if (tokens == null) return handler.next(err);
    try {
      options.extra[_retried] = true;
      options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
      final response = await retryDio.fetch<Object?>(options);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  static bool _isTokenExpired(DioException err) {
    if (err.response?.statusCode != 401) return false;
    final data = err.response?.data;
    return data is Map && data['error'] is Map && (data['error'] as Map)['code'] == 'TOKEN_EXPIRED';
  }
}
