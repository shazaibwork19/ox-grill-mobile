import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/network/auth/auth_interceptor.dart';
import 'package:ox_grill/core/network/auth/token_store.dart';

import '../helpers/fake_api.dart';

AuthTokens tokens(String n) => AuthTokens(
  accessToken: 'access-$n',
  refreshToken: 'refresh-$n',
  accessTokenExpiresAt: DateTime.utc(2026, 10, 28, 12, 15),
  refreshTokenExpiresAt: DateTime.utc(2026, 11, 28),
);

const _expired = FakeReply(401, {
  'success': false,
  'error': {'code': 'TOKEN_EXPIRED', 'message': 'Access token expired'},
});

void main() {
  group('TokenRefresher', () {
    test('concurrent callers share one refresh (refresh tokens rotate)', () async {
      final store = MemoryTokenStore(tokens('1'));
      var calls = 0;
      final gate = Completer<void>();
      final refresher = TokenRefresher(
        store: store,
        refreshCall: (rt) async {
          calls++;
          expect(rt, 'refresh-1');
          await gate.future;
          return tokens('2');
        },
      );

      final results = [refresher.refresh(), refresher.refresh(), refresher.refresh()];
      gate.complete();
      final done = await Future.wait(results);

      expect(calls, 1);
      expect(done.map((t) => t!.accessToken).toSet(), {'access-2'});
      expect((await store.read())!.refreshToken, 'refresh-2', reason: 'new pair is stored');
    });

    test('a later refresh uses the rotated token', () async {
      final store = MemoryTokenStore(tokens('1'));
      final seen = <String>[];
      var n = 1;
      final refresher = TokenRefresher(
        store: store,
        refreshCall: (rt) async {
          seen.add(rt);
          return tokens('${++n}');
        },
      );
      await refresher.refresh();
      await refresher.refresh();
      expect(seen, ['refresh-1', 'refresh-2']);
    });

    test('failed refresh signs out cleanly', () async {
      final store = MemoryTokenStore(tokens('1'));
      var expired = false;
      final refresher = TokenRefresher(
        store: store,
        refreshCall: (_) async => null,
        onSessionExpired: () => expired = true,
      );
      expect(await refresher.refresh(), isNull);
      expect(await store.read(), isNull);
      expect(expired, isTrue);
    });
  });

  test('a network failure while refreshing keeps the session', () async {
    final store = MemoryTokenStore(tokens('1'));
    var expired = false;
    final refresher = TokenRefresher(
      store: store,
      refreshCall: (_) async => throw Exception('offline'),
      onSessionExpired: () => expired = true,
    );
    await expectLater(refresher.refresh(), throwsException);
    expect((await store.read())!.refreshToken, 'refresh-1');
    expect(expired, isFalse);
    // The next attempt is a fresh call, not the failed one.
    await expectLater(refresher.refresh(), throwsException);
  });

  group('AuthInterceptor', () {
    test('queued 401s wait for one refresh, then each request is retried once', () async {
      final store = MemoryTokenStore(tokens('1'));
      var refreshCalls = 0;
      final refresher = TokenRefresher(
        store: store,
        refreshCall: (_) async {
          refreshCalls++;
          await Future<void>.delayed(const Duration(milliseconds: 20));
          return tokens('2');
        },
      );

      Future<FakeReply> respond(RequestOptions o) async {
        final auth = o.headers['Authorization'];
        if (auth == 'Bearer access-2') return const FakeReply(200, {'success': true, 'data': 'ok'});
        return _expired;
      }

      final retryDio = Dio(BaseOptions(baseUrl: 'https://api.test/api/v1/'))
        ..httpClientAdapter = FakeAdapter(respond);
      final dio = Dio(BaseOptions(baseUrl: 'https://api.test/api/v1/'))
        ..httpClientAdapter = FakeAdapter(respond);
      dio.interceptors.add(AuthInterceptor(store: store, refresher: refresher, retryDio: retryDio));

      final responses = await Future.wait([
        dio.get<Object?>('a'),
        dio.get<Object?>('b'),
        dio.get<Object?>('c'),
      ]);

      expect(refreshCalls, 1);
      expect(responses.map((r) => r.statusCode), [200, 200, 200]);
    });

    test('does not loop when the retried request is still 401', () async {
      final store = MemoryTokenStore(tokens('1'));
      final refresher = TokenRefresher(store: store, refreshCall: (_) async => tokens('2'));
      final adapter = FakeAdapter((_) async => _expired);
      final retryDio = Dio()..httpClientAdapter = adapter;
      final dio = Dio()..httpClientAdapter = adapter;
      dio.interceptors.add(AuthInterceptor(store: store, refresher: refresher, retryDio: retryDio));

      await expectLater(dio.get<Object?>('https://api.test/x'), throwsA(isA<DioException>()));
      expect(adapter.requests, hasLength(2), reason: 'original + one retry');
    });

    test('skipAuth requests get no Authorization header', () async {
      final store = MemoryTokenStore(tokens('1'));
      final adapter = FakeAdapter((_) async => const FakeReply(200, {'success': true, 'data': null}));
      final dio = Dio()..httpClientAdapter = adapter;
      dio.interceptors.add(
        AuthInterceptor(
          store: store,
          refresher: TokenRefresher(store: store, refreshCall: (_) async => null),
          retryDio: Dio(),
        ),
      );
      await dio.get<Object?>('https://api.test/x', options: Options(extra: {AuthInterceptor.skipAuth: true}));
      await dio.get<Object?>('https://api.test/y');
      expect(adapter.requests[0].headers.containsKey('Authorization'), isFalse);
      expect(adapter.requests[1].headers['Authorization'], 'Bearer access-1');
    });
  });
}
