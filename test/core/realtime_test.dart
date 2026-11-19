import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/domain/enums.dart';
import 'package:ox_grill/core/network/redacting_log_interceptor.dart';
import 'package:ox_grill/core/realtime/tracking_events.dart';
import 'package:ox_grill/features/orders/application/tracking_controller.dart';

import '../helpers/fake_api.dart';
import '../helpers/fake_tracking_channel.dart';
import '../helpers/test_container.dart';

const _token = 'mock-tracking-token-000000000001';

void main() {
  group('TrackingEvent.parse (Socket.IO payloads, MOBILE_APP_SPEC §6)', () {
    test('order:statusChanged', () {
      final e = TrackingEvent.parse('order:statusChanged', {
        'orderId': 'o1',
        'orderNumber': 'OG-1',
        'branchId': 'b1',
        'type': 'DELIVERY',
        'fromStatus': 'PENDING',
        'toStatus': 'CONFIRMED',
        'actorRole': 'CASHIER',
        'reason': null,
        'changedAt': '2026-10-28T15:05:00.000Z',
        'order': <String, Object?>{},
      });
      expect(e, isA<OrderStatusChanged>());
      final s = e! as OrderStatusChanged;
      expect(s.orderId, 'o1');
      expect(s.toStatus, OrderStatus.confirmed);
      expect(s.changedAt, DateTime.utc(2026, 10, 28, 15, 5));
    });

    test('order:paymentUpdated', () {
      final e = TrackingEvent.parse('order:paymentUpdated', {'orderId': 'o1', 'paymentStatus': 'PAID'});
      expect((e! as OrderPaymentUpdated).paymentStatus, 'PAID');
    });

    test('delivery:locationUpdate', () {
      final e = TrackingEvent.parse('delivery:locationUpdate', {
        'orderId': 'o1',
        'assignmentId': 'a1',
        'latitude': 33.72,
        'longitude': 73,
        'recordedAt': '2026-10-28T15:05:00.000Z',
      });
      expect((e! as RiderLocationUpdated).longitude, 73.0);
    });

    test('malformed or unknown payloads are ignored', () {
      expect(TrackingEvent.parse('order:statusChanged', 'nope'), isNull);
      expect(TrackingEvent.parse('order:statusChanged', {'toStatus': 'READY'}), isNull);
      expect(TrackingEvent.parse('kitchen:newOrder', {'orderId': 'o1'}), isNull);
      expect(TrackingEvent.parse('delivery:locationUpdate', {'orderId': 'o1', 'latitude': 'x'}), isNull);
    });

    test('unknown status value maps to unknown', () {
      final e = TrackingEvent.parse('order:statusChanged', {'orderId': 'o1', 'toStatus': 'ON_HOLD'});
      expect((e! as OrderStatusChanged).toStatus, OrderStatus.unknown);
    });
  });

  group('TrackingController', () {
    late ProviderContainer container;
    late FakeAdapter adapter;
    late FakeTrackingChannel channel;

    setUp(() async {
      channel = FakeTrackingChannel();
      final (api, a) = fakeApi(
        fixtureRoutes({'GET /orders/track/$_token': (_) => FakeReply.fixture('mock_track_pending.json')}),
      );
      adapter = a;
      container = ProviderContainer(
        overrides: [
          ...await testOverrides(api: api, channels: (_) => channel),
          trackingPollIntervalProvider.overrideWithValue(const Duration(milliseconds: 30)),
        ],
      );
    });

    tearDown(() => container.dispose());

    test('refetches on a socket event', () async {
      final sub = container.listen(trackingProvider(_token), (_, _) {});
      await container.read(trackingProvider(_token).future);
      channel.isLive = true;
      final before = adapter.requests.length;
      channel.emit(const OrderStatusChanged(orderId: 'mock-order-1', toStatus: OrderStatus.confirmed));
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(adapter.requests.length, before + 1);
      sub.close();
    });

    test('polls while the socket is not live, stops polling once live', () async {
      final sub = container.listen(trackingProvider(_token), (_, _) {});
      await container.read(trackingProvider(_token).future);
      await Future<void>.delayed(const Duration(milliseconds: 100));
      final polled = adapter.requests.length;
      expect(polled, greaterThan(2), reason: 'initial fetch + polls');

      channel.isLive = true;
      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(adapter.requests.length, polled, reason: 'no polling while live');
      sub.close();
    });

    test('closes the socket when the screen goes away', () async {
      final sub = container.listen(trackingProvider(_token), (_, _) {});
      await container.read(trackingProvider(_token).future);
      sub.close();
      await container.pump();
      expect(channel.disposed, isTrue);
    });
  });

  test('debug logs never contain the tracking token', () {
    expect(RedactingLogInterceptor.redactPath('/api/v1/orders/track/$_token'), '/api/v1/orders/track/***');
    final body = RedactingLogInterceptor.redactBody({
      'trackingToken': _token,
      'order': {'customerPhone': '+923001234567', 'orderNumber': 'OG-1'},
    });
    expect(body.toString(), isNot(contains(_token)));
    expect(body.toString(), isNot(contains('+923001234567')));
    expect(body.toString(), contains('OG-1'));
  });
}
