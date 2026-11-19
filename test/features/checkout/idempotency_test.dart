import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/domain/enums.dart';
import 'package:ox_grill/core/errors/app_failure.dart';
import 'package:ox_grill/core/providers.dart';
import 'package:ox_grill/features/branches/application/order_session.dart';
import 'package:ox_grill/features/cart/application/cart_controller.dart';
import 'package:ox_grill/features/cart/domain/cart.dart';
import 'package:ox_grill/features/checkout/application/checkout_controller.dart';
import 'package:ox_grill/features/checkout/application/idempotency.dart';
import 'package:ox_grill/features/orders/data/saved_orders_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/fake_api.dart';
import '../../helpers/test_container.dart';

const _session =
    '{"branchId":"cmuxu7tgo0000qkfvy7vg5wun","branchName":"Ox & Grill F-7 Markaz","orderType":"DELIVERY"}';

const _form = CheckoutForm(
  name: 'Test Customer',
  phone: '0300 123-4567',
  addressLine: 'House 7, Street 12, F-7/2',
  city: 'Islamabad',
);

void main() {
  group('IdempotencyKeys', () {
    late SharedPreferences prefs;
    var counter = 0;
    String nextKey() => 'key-${++counter}';

    setUp(() async {
      counter = 0;
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
    });

    test('same body reuses the key; a changed body gets a new one', () async {
      final keys = IdempotencyKeys(prefs, newKey: nextKey);
      final body = {
        'a': 1,
        'items': [
          {'id': 'x', 'q': 1},
        ],
      };
      expect(await keys.keyFor(body), 'key-1');
      expect(
        await keys.keyFor({
          'items': [
            {'q': 1, 'id': 'x'},
          ],
          'a': 1,
        }),
        'key-1',
        reason: 'key order is irrelevant',
      );
      expect(await keys.keyFor({'a': 2, 'items': []}), 'key-2');
    });

    test('the pending key survives an app restart', () async {
      final body = {'cart': 'x'};
      final first = await IdempotencyKeys(prefs, newKey: nextKey).keyFor(body);
      // New instance = new process reading the same storage.
      final second = await IdempotencyKeys(prefs, newKey: nextKey).keyFor(body);
      expect(second, first);
    });

    test('complete() starts the next checkout with a fresh key', () async {
      final keys = IdempotencyKeys(prefs, newKey: nextKey);
      final body = {'cart': 'x'};
      final first = await keys.keyFor(body);
      await keys.complete();
      expect(keys.hasPendingAttempt, isFalse);
      expect(await keys.keyFor(body), isNot(first));
    });
  });

  group('CheckoutController', () {
    late ProviderContainer container;
    late FakeAdapter adapter;
    var failNext = 0;

    Future<void> setUpContainer() async {
      final (api, a) = fakeApi(
        fixtureRoutes({
          'POST /orders': (o) {
            if (failNext > 0) {
              failNext--;
              throwConnectionError(o);
            }
            return FakeReply.fixture('mock_create_order.json', status: 201);
          },
        }),
      );
      adapter = a;
      container = ProviderContainer(
        overrides: await testOverrides(api: api, prefs: {'session.v1': _session}),
      );
      container
          .read(cartProvider.notifier)
          .add(
            const CartLine(
              lineId: 'l1',
              menuItemId: 'fries',
              name: 'Beef Chilli Fries',
              unitPrice: 99000,
              quantity: 2,
            ),
          );
    }

    tearDown(() => container.dispose());

    test('request body has no prices, uses the session and normalizes the phone', () async {
      failNext = 0;
      await setUpContainer();
      await container
          .read(checkoutControllerProvider.notifier)
          .submit(paymentMethod: PaymentMethod.cashOnDelivery, form: _form);
      final req = adapter.requests.single;
      final body = req.body! as Map<String, Object?>;
      expect(req.headers['Idempotency-Key'], isNotEmpty);
      expect(req.headers.containsKey('Authorization'), isFalse, reason: 'guest checkout');
      expect(body['branchId'], 'cmuxu7tgo0000qkfvy7vg5wun');
      expect(body['orderType'], 'DELIVERY');
      expect(body['paymentMethod'], 'CASH_ON_DELIVERY');
      expect(body['contactPhone'], '03001234567');
      expect(body['source'], 'MOBILE');
      expect((body['delivery']! as Map)['addressLine'], 'House 7, Street 12, F-7/2');
      expect(body.toString(), isNot(contains('99000')), reason: 'the app never sends prices');
    });

    test('a network failure keeps the cart and the retry reuses the same key', () async {
      failNext = 1;
      await setUpContainer();
      final ctl = container.read(checkoutControllerProvider.notifier);

      await ctl.submit(paymentMethod: PaymentMethod.cashOnDelivery, form: _form);
      final failed = container.read(checkoutControllerProvider);
      expect(failed, isA<CheckoutFailed>());
      expect((failed as CheckoutFailed).outcomeUnknown, isTrue);
      expect(failed.failure, isA<NetworkFailure>());
      expect(container.read(cartProvider), isNotEmpty, reason: 'cart is kept after an unknown outcome');

      await ctl.submit(paymentMethod: PaymentMethod.cashOnDelivery, form: _form);
      expect(container.read(checkoutControllerProvider), isA<CheckoutPlaced>());
      expect(adapter.requests, hasLength(2));
      expect(
        adapter.requests[1].headers['Idempotency-Key'],
        adapter.requests[0].headers['Idempotency-Key'],
        reason: 'the retry must not create a second order',
      );

      // After success: cart cleared, token saved, next checkout gets a new key.
      expect(container.read(cartProvider), isEmpty);
      final saved = await container.read(savedOrdersProvider.future);
      expect(saved.single.orderNumber, 'OG-MOCK-1001');
      expect(IdempotencyKeys(container.read(sharedPreferencesProvider)).hasPendingAttempt, isFalse);
    });

    test('double tap sends one request', () async {
      failNext = 0;
      await setUpContainer();
      final ctl = container.read(checkoutControllerProvider.notifier);
      await Future.wait([
        ctl.submit(paymentMethod: PaymentMethod.cashOnDelivery, form: _form),
        ctl.submit(paymentMethod: PaymentMethod.cashOnDelivery, form: _form),
      ]);
      expect(adapter.requests, hasLength(1));
    });

    test('a 422 is a definite failure, not an unknown outcome', () async {
      final (api, a) = fakeApi(
        fixtureRoutes({
          'POST /orders': (_) => const FakeReply(422, {
            'success': false,
            'error': {'code': 'BRANCH_CLOSED', 'message': 'The branch is closed right now.'},
            'requestId': 'r-1',
          }),
        }),
      );
      adapter = a;
      container = ProviderContainer(
        overrides: await testOverrides(api: api, prefs: {'session.v1': _session}),
      );
      container
          .read(cartProvider.notifier)
          .add(
            const CartLine(lineId: 'l1', menuItemId: 'fries', name: 'Fries', unitPrice: 99000, quantity: 1),
          );
      await container
          .read(checkoutControllerProvider.notifier)
          .submit(paymentMethod: PaymentMethod.cashOnDelivery, form: _form);
      final state = container.read(checkoutControllerProvider) as CheckoutFailed;
      expect(state.outcomeUnknown, isFalse);
      expect((state.failure as ApiFailure).code, 'BRANCH_CLOSED');
      expect(state.failure.userMessage, 'The branch is closed right now.');
    });

    test('order session was read from storage', () async {
      failNext = 0;
      await setUpContainer();
      expect(container.read(orderSessionProvider)!.orderType, OrderType.delivery);
    });
  });

  test('DioException timeouts map to an unknown-outcome network failure', () {
    final f = AppFailure.from(
      DioException(
        requestOptions: RequestOptions(path: '/orders'),
        type: DioExceptionType.receiveTimeout,
      ),
    );
    expect(f, isA<NetworkFailure>());
    expect(CheckoutFailed(f).outcomeUnknown, isTrue);
  });
}
