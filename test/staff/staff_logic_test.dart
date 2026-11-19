import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/domain/enums.dart';
import 'package:ox_grill/features/cart/domain/cart.dart';
import 'package:ox_grill/features/orders/domain/order.dart';
import 'package:ox_grill/staff/core/staff_socket.dart';
import 'package:ox_grill/staff/domain/admin_models.dart';
import 'package:ox_grill/staff/domain/ops_models.dart';
import 'package:ox_grill/staff/domain/report_models.dart';
import 'package:ox_grill/staff/features/orders/order_detail_page.dart';
import 'package:ox_grill/staff/features/orders/pos_page.dart';
import 'package:ox_grill/staff/features/rider/deliveries_page.dart';
import 'package:ox_grill/staff/widgets/staff_ui.dart';

import '../helpers/fake_api.dart';
import '../helpers/staff_fixtures.dart';

DeliveryAssignment _a(String status, String orderStatus) =>
    DeliveryAssignment.fromJson(Map<String, dynamic>.from(assignmentJson('1', status, orderStatus)));

void main() {
  group('rider steps (MOBILE_APP_SPEC §5.2)', () {
    test('ASSIGNED → Accept', () => expect(riderStep(_a('ASSIGNED', 'CONFIRMED')), RiderStep.accept));
    test('ACCEPTED, kitchen not done → waiting', () {
      expect(riderStep(_a('ACCEPTED', 'PREPARING')), RiderStep.waitingForKitchen);
      expect(riderStep(_a('ACCEPTED', 'CONFIRMED')), RiderStep.waitingForKitchen);
    });
    test('ACCEPTED + READY → Picked up', () => expect(riderStep(_a('ACCEPTED', 'READY')), RiderStep.pickUp));
    test(
      'PICKED_UP → Customer received',
      () => expect(riderStep(_a('PICKED_UP', 'OUT_FOR_DELIVERY')), RiderStep.delivered),
    );
    test(
      'DELIVERED → Mark completed',
      () => expect(riderStep(_a('DELIVERED', 'DELIVERED')), RiderStep.complete),
    );
    test('COMPLETED or cancelled → done', () {
      expect(riderStep(_a('DELIVERED', 'COMPLETED')), RiderStep.done);
      expect(riderStep(_a('CANCELLED', 'CANCELLED')), RiderStep.done);
    });
  });

  group('parseRupees / rupeesText', () {
    test('accepts common forms', () {
      expect(parseRupees('1390'), 139000);
      expect(parseRupees('1,390'), 139000);
      expect(parseRupees('Rs 1,390'), 139000);
      expect(parseRupees('rs. 1390.5'), 139050);
      expect(parseRupees('1390.05'), 139005);
      expect(parseRupees('0'), 0);
    });
    test('rejects invalid input', () {
      expect(parseRupees(''), isNull);
      expect(parseRupees('12.345'), isNull);
      expect(parseRupees('-5'), isNull);
      expect(parseRupees('abc'), isNull);
    });
    test('round trip', () {
      for (final p in [0, 99000, 139050, 5]) {
        expect(parseRupees(rupeesText(p)), p);
      }
    });
  });

  test('POS body sends ids, never prices; customer fields only when given', () {
    final lines = [
      const CartLine(
        lineId: 'l',
        menuItemId: 'm1',
        name: 'Fries',
        unitPrice: 99000,
        quantity: 2,
        options: [CartOption(id: 'o1', groupId: 'g', groupName: 'G', name: 'Cheese', priceDelta: 5000)],
      ),
    ];
    final counter = buildPosOrderBody(
      type: OrderType.counterPos,
      method: PaymentMethod.cash,
      lines: lines,
      paidNow: true,
      amountTendered: 250000,
    );
    expect(counter, {
      'orderType': 'COUNTER_POS',
      'paymentMethod': 'CASH',
      'items': [
        {
          'menuItemId': 'm1',
          'quantity': 2,
          'optionIds': ['o1'],
        },
      ],
      'paymentCollected': true,
      'amountTendered': 250000,
    });
    final delivery = buildPosOrderBody(
      type: OrderType.delivery,
      method: PaymentMethod.cashOnDelivery,
      lines: lines,
      name: 'Ayesha',
      phone: '0300 1234567',
      address: 'House 7',
      table: 'ignored',
    );
    expect(delivery['customerPhone'], '03001234567');
    expect(delivery['delivery'], {'addressLine': 'House 7'});
    expect(delivery.containsKey('tableRef'), isFalse);
    expect(delivery.toString(), isNot(contains('99000')));
  });

  test('reject and cancel ask for a reason; forward moves do not', () {
    expect(transitionNeedsReason(OrderStatus.rejected), isTrue);
    expect(transitionNeedsReason(OrderStatus.cancelled), isTrue);
    expect(transitionNeedsReason(OrderStatus.confirmed), isFalse);
    expect(transitionLabel(OrderStatus.confirmed), 'Confirm order');
  });

  test('staff socket events', () {
    expect(StaffEvent.parse('order:created', {'orderNumber': 'OG-1'})!.orderNumber, 'OG-1');
    expect(StaffEvent.parse('kitchen:orderCancelled', null)!.payload, isEmpty);
    expect(StaffEvent.parse('something:else', {}), isNull);
  });

  group('mock staff payloads parse (shape from OpenAPI)', () {
    Future<Object?> get(String path) async {
      final reply = await staffRoutes(role: 'SUPER_ADMIN')(RequestOptions(path: 'https://api.test$path'));
      return (reply.body! as Map)['data'];
    }

    test('order with allowedTransitions', () async {
      final o = Order.fromJson(
        Map<String, dynamic>.from((await get('/api/v1/branches/$branchId/orders/x'))! as Map),
      );
      expect(o.allowedTransitions, [OrderStatus.confirmed, OrderStatus.rejected, OrderStatus.cancelled]);
    });
    test('dashboard, branch admin, shift, report', () async {
      Dashboard.fromJson(Map<String, dynamic>.from((await get('/api/v1/admin/dashboard'))! as Map));
      BranchAdmin.fromJson(
        Map<String, dynamic>.from(((await get('/api/v1/admin/branches'))! as List).first as Map),
      );
      Shift.fromJson(
        Map<String, dynamic>.from((await get('/api/v1/branches/$branchId/shifts/current'))! as Map),
      );
      ReportOverview.fromJson(Map<String, dynamic>.from((await get('/api/v1/reports/overview'))! as Map));
      AdminMenuItem.fromJson(
        Map<String, dynamic>.from(((await get('/api/v1/admin/menu-items'))! as List).first as Map),
      );
    });
  });

  test('fixture helper is available', () => expect(fixtureData('config.json')['currency'], 'PKR'));
}
