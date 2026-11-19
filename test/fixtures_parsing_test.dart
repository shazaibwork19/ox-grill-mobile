import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/domain/enums.dart';
import 'package:ox_grill/core/errors/app_failure.dart';
import 'package:ox_grill/features/bootstrap/domain/client_config.dart';
import 'package:ox_grill/features/branches/domain/branch.dart';
import 'package:ox_grill/features/cart/domain/quote.dart';
import 'package:ox_grill/features/menu/domain/menu.dart';
import 'package:ox_grill/features/orders/domain/order.dart';

import 'helpers/fake_api.dart';

/// Parses the responses saved from the live test API (2026-10-28).
void main() {
  test('config', () {
    final config = ClientConfig.fromJson(fixtureData('config.json'));
    expect(config.currency, 'PKR');
    expect(config.timezone, 'Asia/Karachi');
    expect(config.features.onlinePayments, isFalse);
    expect(config.features.deliveryGps, isFalse);
    expect(config.paymentMethodsFor(OrderType.delivery), [PaymentMethod.cashOnDelivery]);
    expect(config.paymentMethodsFor(OrderType.pickup), [PaymentMethod.cash, PaymentMethod.cardAtCounter]);
  });

  test('config hides ONLINE while onlinePayments is off and drops unknown methods', () {
    final json = fixtureData('config.json');
    (json['paymentMethodsByOrderType'] as Map)['DELIVERY'] = ['CASH_ON_DELIVERY', 'ONLINE', 'CRYPTO'];
    final config = ClientConfig.fromJson(json);
    expect(config.paymentMethodsFor(OrderType.delivery), [PaymentMethod.cashOnDelivery]);
  });

  test('branches', () {
    final list = (fixture('branches.json')['data'] as List)
        .map((e) => BranchSummary.fromJson(e as Map<String, dynamic>))
        .toList();
    expect(list, hasLength(5));
    final f7 = list.firstWhere((b) => b.slug == 'islamabad-f-7-markaz');
    expect(f7.services.orderTypes, [OrderType.delivery, OrderType.pickup, OrderType.dineIn]);
    expect(f7.deliveryFeeMoney.format(), 'Rs 150');
    expect(f7.status.label, isNotEmpty);
    for (final b in list) {
      expect(b.phone, startsWith('+92'));
    }
  });

  test('branch detail', () {
    final d = BranchDetail.fromJson(fixtureData('branch_detail.json'));
    expect(d.hours, hasLength(7));
    expect(d.taxRateBpsFor(PaymentMethod.cashOnDelivery), 1600);
    expect(d.taxRateBpsFor(PaymentMethod.cardAtCounter), 500);
  });

  test('menu', () {
    final m = MenuResponse.fromJson(fixtureData('menu.json'));
    expect(m.categories, isNotEmpty);
    expect(m.items.length, greaterThan(100));
    expect(m.items.where((i) => i.hasOptions), isNotEmpty);
    // Every image URL from the API is https (no cleartext / localhost).
    for (final i in m.items) {
      if (i.imageUrl != null) expect(Uri.parse(i.imageUrl!).scheme, 'https');
    }
  });

  test('item detail: required single-choice group', () {
    final item = MenuItemDetail.fromJson(fixtureData('item_swiss_mushroom_burger.json'));
    final group = item.orderedGroups.single;
    expect(group.isRequired, isTrue);
    expect(group.isSingleChoice, isTrue);
    expect(group.ruleLabel, 'Choose 1');
    expect(group.options.where((o) => o.isDefault), hasLength(1));
  });

  test('item detail: optional group', () {
    final item = MenuItemDetail.fromJson(fixtureData('item_chicken_ceaser_salad.json'));
    expect(item.orderedGroups.single.isRequired, isFalse);
    expect(item.orderedGroups.single.ruleLabel, 'Optional · choose up to 1');
  });

  test('quote with an issue maps cart indexes to lines', () {
    final q = Quote.fromJson(fixtureData('quote_delivery_cod.json'));
    expect(q.lines, hasLength(2));
    expect(q.issues.single.index, 2);
    expect(q.issues.single.code, 'OPTION_SELECTION_INVALID');
    expect(q.issues.single.isUnavailable, isFalse);
    expect(q.lineForIndex(0)!.name, 'Beef Chilli Fries');
    expect(q.lineForIndex(1)!.name, 'Swiss Mushroom Burger');
    expect(q.lineForIndex(2), isNull);
    expect(q.issueForIndex(2), isNotNull);
    expect(q.canCheckout, isFalse);
    expect(q.totals.taxRateLabel, '16%');
    expect(q.totals.totalMoney.format(), 'Rs 5,161');
  });

  test('issue index mapping when the issue is in the middle', () {
    final json = fixtureData('quote_delivery_cod.json');
    (json['issues'] as List).first['index'] = 0;
    final q = Quote.fromJson(json);
    expect(q.lineForIndex(0), isNull);
    expect(q.lineForIndex(1)!.name, 'Beef Chilli Fries');
    expect(q.lineForIndex(2)!.name, 'Swiss Mushroom Burger');
  });

  test('order status (mock fixture built from the schema)', () {
    final s = PublicOrderStatus.fromJson(fixtureData('mock_track_pending.json'));
    expect(s.order.status, OrderStatus.pending);
    expect(s.tracking.steps.first.label, 'Not confirmed yet');
    expect(s.tracking.steps.first.state, TrackingStepState.current);
    expect(s.order.totals.total, 244680);
  });

  test('unknown enum values do not break parsing', () {
    final json = fixtureData('mock_track_pending.json');
    (json['order'] as Map)['status'] = 'ON_HOLD';
    ((json['tracking'] as Map)['steps'] as List).first['state'] = 'paused';
    final s = PublicOrderStatus.fromJson(json);
    expect(s.order.status, OrderStatus.unknown);
    expect(s.tracking.steps.first.state, TrackingStepState.unknown);
  });

  group('error envelope', () {
    ApiFailure parse(String name, int status) => ApiFailure.fromResponse(status, fixture(name), Headers());

    test('validation error with details', () {
      final f = parse('error_validation.json', 400);
      expect(f.code, 'VALIDATION_ERROR');
      expect(f.details.single.path, 'params.token');
      expect(f.fieldErrors['params.token'], contains('20 characters'));
      expect(f.requestId, isNotNull);
    });

    test('not found', () {
      final f = parse('error_not_found.json', 404);
      expect(f.isNotFound, isTrue);
      expect(f.userMessage, 'Order not found');
    });

    test('server error hides the raw message', () {
      final f = ApiFailure.fromResponse(500, {
        'success': false,
        'error': {'code': 'INTERNAL_ERROR', 'message': 'TypeError: x is undefined'},
      }, Headers());
      expect(f.userMessage, isNot(contains('TypeError')));
    });

    test('non-JSON error body still maps to a typed failure', () {
      final f = ApiFailure.fromResponse(502, '<html>Bad gateway</html>', Headers());
      expect(f.code, 'INTERNAL_ERROR');
    });
  });
}
