import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/errors/app_failure.dart';
import 'package:ox_grill/core/network/auth/token_store.dart';
import 'package:ox_grill/core/providers.dart';
import 'package:ox_grill/staff/core/permissions.dart';
import 'package:ox_grill/staff/core/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/fake_api.dart';
import '../helpers/staff_fixtures.dart';
import '../helpers/test_container.dart';

Future<(ProviderContainer, FakeAdapter, MemoryTokenStore)> _container(
  Responder responder, {
  AuthTokens? stored,
}) async {
  SharedPreferences.setMockInitialValues({});
  FlutterSecureStorage.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final adapter = FakeAdapter(responder);
  final store = MemoryTokenStore(stored);
  final container = ProviderContainer(
    overrides: [
      appConfigProvider.overrideWithValue(testConfig),
      sharedPreferencesProvider.overrideWithValue(prefs),
      staffTokenStoreProvider.overrideWithValue(store),
      staffPublicApiProvider.overrideWith((ref) {
        final c = fakeApi(adapter.responder).$1;
        c.dio.httpClientAdapter = adapter;
        return c;
      }),
      staffApiProvider.overrideWith((ref) {
        final c = fakeApi(adapter.responder).$1;
        c.dio.httpClientAdapter = adapter;
        return c;
      }),
    ],
  );
  addTearDown(container.dispose);
  return (container, adapter, store);
}

final _stored = AuthTokens.fromJson(Map<String, dynamic>.from(tokensJson()));

void main() {
  test('no stored tokens → signed out', () async {
    final (c, _, _) = await _container(staffRoutes(role: 'CASHIER'));
    expect(await c.read(sessionProvider.future), isNull);
  });

  test('staff login stores tokens and sets the role', () async {
    final (c, adapter, store) = await _container(staffRoutes(role: 'BRANCH_MANAGER'));
    await c.read(sessionProvider.future);
    await c.read(sessionProvider.notifier).login(email: ' manager.f7@oxgrill.test ', password: 'secret-pass');
    final s = c.read(sessionProvider).value!;
    expect(s.role, StaffRole.manager);
    expect(s.ownBranchId, branchId);
    expect((await store.read())!.accessToken, 'access-1');
    final login = adapter.requests.firstWhere((r) => r.path.endsWith('/auth/login'));
    expect((login.body! as Map)['email'], 'manager.f7@oxgrill.test');
  });

  test('a customer account is refused and its session revoked', () async {
    final (c, adapter, store) = await _container(staffRoutes(role: 'CUSTOMER'));
    await c.read(sessionProvider.future);
    await expectLater(
      c.read(sessionProvider.notifier).login(email: 'a@b.co', password: 'x'),
      throwsA(isA<AccessFailure>().having((f) => f.userMessage, 'message', contains('for Ox & Grill staff'))),
    );
    await Future<void>.delayed(const Duration(milliseconds: 10));
    expect(await store.read(), isNull);
    expect(adapter.requests.any((r) => r.path.endsWith('/auth/logout')), isTrue);
    expect(c.read(sessionProvider).value, isNull);
  });

  test('wrong password surfaces the server error', () async {
    final (c, _, _) = await _container(
      (o) async => const FakeReply(401, {
        'success': false,
        'error': {'code': 'INVALID_CREDENTIALS', 'message': 'Invalid email or password'},
      }),
    );
    await c.read(sessionProvider.future);
    await expectLater(
      c.read(sessionProvider.notifier).login(email: 'a@b.co', password: 'x'),
      throwsA(isA<ApiFailure>().having((f) => f.statusCode, 'status', 401)),
    );
  });

  test('stored tokens → /auth/me restores the session', () async {
    final (c, adapter, _) = await _container(staffRoutes(role: 'DELIVERY_AGENT'), stored: _stored);
    final s = await c.read(sessionProvider.future);
    expect(s!.role, StaffRole.rider);
    expect(adapter.requests.single.path, endsWith('/auth/me'));
  });

  test('offline at start keeps the last known profile', () async {
    var online = true;
    final routes = staffRoutes(role: 'CASHIER');
    final (c, _, _) = await _container((o) async {
      if (!online) throwConnectionError(o);
      return routes(o);
    }, stored: _stored);
    await c.read(sessionProvider.future);
    await c.read(sessionProvider.notifier).login(email: 'c@oxgrill.test', password: 'p');
    // Rebuild the session while offline.
    online = false;
    c.invalidate(sessionProvider);
    final s = await c.read(sessionProvider.future);
    expect(s?.role, StaffRole.cashier);
  });

  test('a rejected session at start signs out', () async {
    final (c, _, store) = await _container(
      (o) async => const FakeReply(401, {
        'success': false,
        'error': {'code': 'UNAUTHENTICATED', 'message': 'Session revoked'},
      }),
      stored: _stored,
    );
    expect(await c.read(sessionProvider.future), isNull);
    expect(await store.read(), isNull);
  });

  test('logout revokes the refresh token', () async {
    final (c, adapter, store) = await _container(staffRoutes(role: 'CASHIER'), stored: _stored);
    await c.read(sessionProvider.future);
    await c.read(sessionProvider.notifier).logout();
    final logout = adapter.requests.firstWhere((r) => r.path.endsWith('/auth/logout'));
    expect((logout.body! as Map)['refreshToken'], 'refresh-1');
    expect(logout.headers['Authorization'], 'Bearer access-1');
    expect(await store.read(), isNull);
    expect(c.read(sessionProvider).value, isNull);
  });

  test('expired() ends the session and flags it for the sign-in screen', () async {
    final (c, _, _) = await _container(staffRoutes(role: 'CASHIER'), stored: _stored);
    await c.read(sessionProvider.future);
    c.read(sessionProvider.notifier).expired();
    expect(c.read(sessionProvider).value, isNull);
    expect(c.read(sessionProvider.notifier).sessionEnded, isTrue);
  });

  test('DioException is never shown raw', () {
    final f = AppFailure.from(
      DioException(
        requestOptions: RequestOptions(path: '/x'),
        type: DioExceptionType.unknown,
        error: 'boom',
      ),
    );
    expect(f.userMessage, isNot(contains('boom')));
  });
}
