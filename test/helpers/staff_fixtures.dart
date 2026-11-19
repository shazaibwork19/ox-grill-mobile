// MOCK data for staff screens, hand-written from the OpenAPI schemas. No
// staff endpoint was called against the live server to produce it.
import 'package:dio/dio.dart';

import 'fake_api.dart';

const branchId = 'cmuxu7tgo0000qkfvy7vg5wun';
const _now = '2026-10-28T15:00:00.000Z';

Map<String, Object?> ok(Object? data, {Map<String, Object?>? meta}) => {
  'success': true,
  'data': data,
  'meta': ?meta,
};

Map<String, Object?> userJson(String role) {
  if (role == 'SUPER_ADMIN') {
    return {
      'id': 'u-owner',
      'name': 'Rizwan Owner',
      'email': 'owner@oxgrill.test',
      'phone': null,
      'globalRole': 'SUPER_ADMIN',
      'hasPassword': true,
      'phoneVerified': false,
      'staffProfile': null,
      'createdAt': _now,
    };
  }
  if (role == 'CUSTOMER') {
    return {
      'id': 'u-cust',
      'name': 'A Customer',
      'phone': '+923001234567',
      'globalRole': 'CUSTOMER',
      'hasPassword': true,
      'phoneVerified': true,
      'staffProfile': null,
      'createdAt': _now,
    };
  }
  return {
    'id': 'u-$role',
    'name': 'Sana ${role.toLowerCase()}',
    'email': '${role.toLowerCase()}@oxgrill.test',
    'phone': '+923001112222',
    'globalRole': 'STAFF',
    'hasPassword': true,
    'phoneVerified': false,
    'staffProfile': {
      'id': 'sp-$role',
      'branchId': branchId,
      'branchName': 'Ox & Grill F-7 Markaz',
      'staffRole': role,
      'status': 'ACTIVE',
      'onDuty': true,
    },
    'createdAt': _now,
  };
}

Map<String, Object?> tokensJson([String n = '1']) => {
  'accessToken': 'access-$n',
  'accessTokenExpiresAt': '2026-10-28T15:15:00.000Z',
  'refreshToken': 'refresh-$n',
  'refreshTokenExpiresAt': '2026-11-28T15:00:00.000Z',
  'tokenType': 'Bearer',
};

Map<String, Object?> _summary(String id, String status, {String type = 'DELIVERY', int total = 244680}) => {
  'id': id,
  'orderNumber': 'OG-$id',
  'branchId': branchId,
  'branchName': 'Ox & Grill F-7 Markaz',
  'type': type,
  'status': status,
  'source': 'MOBILE',
  'paymentMethod': type == 'DELIVERY' ? 'CASH_ON_DELIVERY' : 'CASH',
  'paymentStatus': 'PENDING',
  'customerName': 'Ayesha Khan',
  'customerPhone': '+923001234567',
  'itemCount': 2,
  'total': total,
  'currency': 'PKR',
  'tableRef': type == 'DINE_IN' ? '12' : null,
  'placedAt': _now,
  'updatedAt': _now,
};

Map<String, Object?> orderJson() {
  final o = Map<String, Object?>.from(fixtureData('mock_track_pending.json')['order'] as Map);
  o['allowedTransitions'] = ['CONFIRMED', 'REJECTED', 'CANCELLED'];
  return o;
}

final _dashboard = {
  'scope': {'branchId': branchId, 'timezone': 'Asia/Karachi', 'date': '2026-10-28'},
  'today': {
    'revenue': 4567800,
    'orders': 23,
    'averageOrderValue': 198600,
    'activeOrders': 4,
    'pendingOrders': 2,
    'cancelledOrders': 1,
  },
  'topItems': [
    {'name': 'Beef Chilli Fries', 'quantity': 14, 'revenue': 1386000},
    {'name': 'Swiss Mushroom Burger', 'quantity': 9, 'revenue': 2106000},
  ],
  'salesByBranch': [
    {'branchId': branchId, 'branchName': 'Ox & Grill F-7 Markaz', 'revenue': 4567800, 'orders': 23},
    {'branchId': 'b2', 'branchName': 'Ox & Grill Gulberg', 'revenue': 3210000, 'orders': 17},
  ],
  'paymentBreakdown': [
    {'method': 'CASH_ON_DELIVERY', 'orders': 15, 'revenue': 3000000},
    {'method': 'CARD_AT_COUNTER', 'orders': 8, 'revenue': 1567800},
  ],
  'recentOrders': [_summary('1001', 'PENDING'), _summary('1002', 'PREPARING', type: 'DINE_IN')],
  'recentActivity': [
    {'id': 'a1', 'action': 'ORDER_CONFIRMED', 'entityType': 'Order', 'actorName': 'Sana', 'createdAt': _now},
  ],
};

final _ticket = {
  'id': '1002',
  'orderNumber': 'OG-1002',
  'branchId': branchId,
  'type': 'DINE_IN',
  'status': 'CONFIRMED',
  'tableRef': '12',
  'pickupName': null,
  'customerName': 'Ayesha',
  'notes': 'Birthday — bring the cake last',
  'items': [
    {
      'name': 'Ribeye Steak',
      'quantity': 2,
      'notes': 'Medium rare',
      'options': ['Mash', 'Pepper sauce'],
    },
    {'name': 'Beef Chilli Fries', 'quantity': 1, 'notes': null, 'options': <String>[]},
  ],
  'placedAt': _now,
  'confirmedAt': _now,
  'preparingAt': null,
  'readyAt': null,
};

Map<String, Object?> _assignment(String id, String status, String orderStatus) => {
  'id': id,
  'orderId': 'o$id',
  'orderNumber': 'OG-$id',
  'branchId': branchId,
  'branchName': 'Ox & Grill F-7 Markaz',
  'branchAddress': 'Markaz Road, F-7',
  'status': status,
  'customerName': 'Ayesha Khan',
  'customerPhone': '+923001234567',
  'delivery': {
    'addressLine': 'House 7, Street 12, F-7/2',
    'area': 'F-7',
    'city': 'Islamabad',
    'latitude': 33.72,
    'longitude': 73.05,
    'instructions': 'Blue gate',
  },
  'items': fixtureData('mock_track_pending.json')['order'] is Map
      ? ((fixtureData('mock_track_pending.json')['order'] as Map)['items'])
      : <Object?>[],
  'total': 244680,
  'paymentMethod': 'CASH_ON_DELIVERY',
  'amountToCollect': 244680,
  'orderStatus': orderStatus,
  'assignedAt': _now,
  'acceptedAt': null,
  'pickedUpAt': null,
  'deliveredAt': null,
  'lastLocation': null,
};

Map<String, Object?> assignmentJson(String id, String status, String orderStatus) =>
    _assignment(id, status, orderStatus);

final _branchAdmin = () {
  final b = Map<String, Object?>.from(fixtureData('branch_detail.json'));
  b.addAll({
    'isActive': true,
    'acceptsOrders': true,
    'enforceOpeningHours': true,
    'deliveryRadiusKm': 8.0,
    'avgTableTurnoverMinutes': 60,
    'reservationDurationMinutes': 90,
    'staffCount': 12,
    'createdAt': _now,
    'updatedAt': _now,
  });
  return b;
}();

Map<String, Object?> _staff(String id, String role, {String status = 'ACTIVE'}) => {
  'id': id,
  'userId': 'u$id',
  'name': 'Staff $id',
  'email': 'staff$id@oxgrill.test',
  'phone': '+923001110000',
  'staffRole': role,
  'branchId': branchId,
  'branchName': 'Ox & Grill F-7 Markaz',
  'status': status,
  'onDuty': role == 'DELIVERY_AGENT',
  'lastLoginAt': _now,
  'createdAt': _now,
};

final _shift = {
  'id': 'sh1',
  'branchId': branchId,
  'staffId': 'sp-CASHIER',
  'staffName': 'Sana cashier',
  'status': 'OPEN',
  'openedAt': _now,
  'closedAt': null,
  'openingFloat': 500000,
  'expectedCash': 1250000,
  'countedCash': null,
  'variance': null,
  'notes': null,
  'summary': {
    'orderCount': 9,
    'salesTotal': 1890000,
    'cashTotal': 750000,
    'cardTotal': 640000,
    'codTotal': 500000,
    'onlineTotal': 0,
    'cancelledCount': 1,
    'byType': {'DELIVERY': 3, 'PICKUP': 2, 'DINE_IN': 3, 'COUNTER_POS': 1},
  },
};

const _range = {'from': '2026-10-22', 'to': '2026-10-28'};

/// Answers every GET the staff screens make; mutations return 200 with a plausible body.
Responder staffRoutes({required String role}) {
  final meta = {'page': 1, 'pageSize': 30, 'total': 3, 'totalPages': 1};
  return (RequestOptions o) async {
    final p = o.uri.path.replaceFirst('/api/v1', '');
    final m = o.method;
    final b = '/branches/$branchId';
    FakeReply r(Object? data, {Map<String, Object?>? meta}) => FakeReply(200, ok(data, meta: meta));
    if (p == '/config') return FakeReply.fixture('config.json');
    if (p == '/auth/me') return r(userJson(role));
    if (p == '/auth/login') return r({'user': userJson(role), 'tokens': tokensJson(), 'isNewUser': false});
    if (p == '/auth/refresh') {
      return r({'user': userJson(role), 'tokens': tokensJson('2'), 'isNewUser': false});
    }
    if (p == '/auth/logout') return r({'message': 'ok'});
    if (p == '/menu') return FakeReply.fixture('menu.json');
    if (p == '/admin/branches') return r([_branchAdmin]);
    if (p == '/admin/dashboard' || p == '$b/dashboard') return r(_dashboard);
    if ((p == '/admin/orders' || p == '$b/orders') && m == 'GET') {
      return r([
        _summary('1001', 'PENDING'),
        _summary('1002', 'PREPARING', type: 'DINE_IN'),
        _summary('1003', 'READY', type: 'PICKUP'),
      ], meta: meta);
    }
    if (p.startsWith('$b/orders/') && p.endsWith('/receipt')) {
      final order = orderJson();
      return r({
        'orderNumber': order['orderNumber'],
        'branch': {
          'name': 'Ox & Grill F-7 Markaz',
          'addressLine': 'Markaz Road, F-7',
          'phone': '+923258875554',
        },
        'type': order['type'],
        'placedAt': _now,
        'cashierName': 'Sana',
        'customerName': 'Ayesha Khan',
        'tableRef': null,
        'lines': order['items'],
        'totals': order['totals'],
        'paymentMethod': order['paymentMethod'],
        'paymentStatus': 'PAID',
        'amountTendered': 250000,
        'changeDue': 5320,
      });
    }
    if (p.startsWith('$b/orders/')) return r(orderJson());
    if (p == '$b/riders') {
      return r([
        {'id': 'r1', 'name': 'Bilal Rider', 'phone': '+923004445555', 'onDuty': true, 'activeAssignments': 1},
      ]);
    }
    if (p == '$b/kitchen/queue') {
      return r([
        _ticket,
        {
          ..._ticket,
          'id': '1003',
          'orderNumber': 'OG-1003',
          'status': 'PREPARING',
          'tableRef': null,
          'type': 'PICKUP',
          'pickupName': 'Ali',
          'notes': null,
          'preparingAt': _now,
        },
      ]);
    }
    if (p == '/delivery/assignments/me') {
      return r([
        _assignment('2001', 'ASSIGNED', 'CONFIRMED'),
        _assignment('2002', 'ACCEPTED', 'PREPARING'),
        _assignment('2003', 'PICKED_UP', 'OUT_FOR_DELIVERY'),
      ]);
    }
    if (p == '$b/menu-availability') {
      return r([
        {
          'menuItemId': 'm1',
          'branchId': branchId,
          'name': 'Beef Chilli Fries',
          'categoryName': 'Starters',
          'imageUrl': null,
          'basePrice': 99000,
          'priceOverride': null,
          'effectivePrice': 99000,
          'isAvailable': true,
          'isActiveGlobally': true,
          'stockQuantity': null,
          'updatedAt': _now,
        },
        {
          'menuItemId': 'm2',
          'branchId': branchId,
          'name': 'Swiss Mushroom Burger',
          'categoryName': 'Burgers & Sandwiches',
          'imageUrl': null,
          'basePrice': 139000,
          'priceOverride': 149000,
          'effectivePrice': 149000,
          'isAvailable': false,
          'isActiveGlobally': true,
          'stockQuantity': 4,
          'updatedAt': _now,
        },
      ]);
    }
    if (p == '$b/settings') return r(_branchAdmin);
    if (p == '$b/staff' || p == '/admin/staff') {
      return r([
        _staff('1', 'BRANCH_MANAGER'),
        _staff('2', 'CASHIER'),
        _staff('3', 'DELIVERY_AGENT', status: 'SUSPENDED'),
      ], meta: meta);
    }
    if (p == '$b/shifts/current') return r(_shift);
    if (p == '$b/shifts') {
      return r([
        {
          ..._shift,
          'id': 'sh0',
          'status': 'CLOSED',
          'closedAt': _now,
          'countedCash': 1240000,
          'variance': -10000,
        },
      ], meta: meta);
    }
    if (p == '$b/reservations') {
      return r([
        {
          'id': 'res1',
          'branchId': branchId,
          'branchName': 'F-7',
          'customerId': null,
          'name': 'Hamza',
          'phone': '+923007778888',
          'partySize': 4,
          'reservedFor': '2026-10-28T15:00:00.000Z',
          'durationMinutes': 90,
          'status': 'CONFIRMED',
          'notes': 'Window seat',
          'cancelReason': null,
          'createdAt': _now,
          'updatedAt': _now,
        },
      ], meta: meta);
    }
    if (p == '$b/waitlist') {
      return r([
        {
          'id': 'w1',
          'branchId': branchId,
          'branchName': 'F-7',
          'name': 'Zara',
          'phone': '+923009990000',
          'partySize': 3,
          'status': 'WAITING',
          'position': 1,
          'estimatedWaitMinutes': 15,
          'joinedAt': _now,
          'notifiedAt': null,
          'expiresAt': null,
          'notes': null,
        },
      ]);
    }
    if (p == '/reports/overview') {
      return r({
        'range': _range,
        'current': {
          'revenue': 30123400,
          'orders': 151,
          'averageOrderValue': 199500,
          'cancelledOrders': 4,
          'rejectedOrders': 2,
        },
        'previous': {
          'revenue': 28000000,
          'orders': 140,
          'averageOrderValue': 200000,
          'cancelledOrders': 5,
          'rejectedOrders': 1,
        },
        'change': {'revenuePct': 7.6, 'ordersPct': 7.9, 'averageOrderValuePct': -0.25},
      });
    }
    if (p == '/reports/sales-by-day') {
      return r({
        'range': _range,
        'days': [
          for (var d = 22; d <= 28; d++)
            {'date': '2026-10-$d', 'revenue': 4000000 + d * 10000, 'orders': 20 + d % 5},
        ],
      });
    }
    if (p == '/reports/top-items') {
      return r({
        'range': _range,
        'items': [
          {'menuItemId': 'm1', 'name': 'Beef Chilli Fries', 'quantity': 80, 'revenue': 7920000},
        ],
      });
    }
    if (p == '/reports/payment-methods') {
      return r({
        'range': _range,
        'methods': [
          {'method': 'CASH_ON_DELIVERY', 'orders': 90, 'revenue': 18000000},
          {'method': 'CASH', 'orders': 61, 'revenue': 12123400},
        ],
      });
    }
    if (p == '/reports/order-statuses') {
      return r({
        'range': _range,
        'statuses': [
          {'status': 'COMPLETED', 'orders': 145},
          {'status': 'CANCELLED', 'orders': 4},
        ],
        'types': [
          {'type': 'DELIVERY', 'orders': 90},
          {'type': 'DINE_IN', 'orders': 61},
        ],
      });
    }
    if (p == '/reports/hourly') {
      return r({
        'range': _range,
        'hours': [
          for (var h = 12; h < 24; h++) {'hour': h, 'orders': h - 10, 'revenue': (h - 10) * 200000},
        ],
      });
    }
    if (p == '/reports/branch-comparison') {
      return r({
        'range': _range,
        'branches': [
          {
            'branchId': branchId,
            'branchName': 'Ox & Grill F-7 Markaz',
            'revenue': 30123400,
            'orders': 151,
            'averageOrderValue': 199500,
            'previousRevenue': 28000000,
            'revenueChangePct': 7.6,
            'cancelledOrders': 4,
          },
        ],
      });
    }
    if (p == '/forecasts') {
      return r([
        {
          'branchId': branchId,
          'branchName': 'Ox & Grill F-7 Markaz',
          'status': 'READY',
          'message': null,
          'method': 'seasonal-average',
          'generatedAt': _now,
          'historyWeeks': 6,
          'days': [
            {
              'date': '2026-10-29',
              'dayOfWeek': 4,
              'expectedOrders': 24.6,
              'expectedRevenue': 4900000,
              'historicalAverageOrders': 23.0,
              'peakHours': [20, 21],
              'hours': <Object?>[],
            },
          ],
        },
      ]);
    }
    if (p == '/admin/categories') {
      return r((fixtureData('menu.json')['categories'] as List).take(5).toList());
    }
    if (p == '/admin/menu-items') {
      final item = fixtureData('item_swiss_mushroom_burger.json');
      return r([
        {...item, 'isActive': true, 'sortOrder': 0, 'branchCount': 5, 'updatedAt': _now},
      ]);
    }
    if (p.startsWith('/admin/menu-items/')) {
      final item = fixtureData('item_swiss_mushroom_burger.json');
      return r({...item, 'isActive': true, 'sortOrder': 0, 'branchCount': 5, 'updatedAt': _now});
    }
    if (p == '/admin/admins') {
      return r([
        {
          'id': 'a1',
          'name': 'Rizwan Owner',
          'email': 'owner@oxgrill.test',
          'phone': null,
          'status': 'ACTIVE',
          'lastLoginAt': _now,
          'createdAt': _now,
          'isYou': true,
        },
        {
          'id': 'a2',
          'name': 'Second Owner',
          'email': 'owner2@oxgrill.test',
          'phone': null,
          'status': 'DISABLED',
          'lastLoginAt': null,
          'createdAt': _now,
          'isYou': false,
        },
      ]);
    }
    if (p == '/admin/customers') {
      return r([
        {
          'id': 'c1',
          'name': 'Ayesha Khan',
          'phone': '+923001234567',
          'email': null,
          'status': 'ACTIVE',
          'orderCount': 12,
          'totalSpent': 2400000,
          'lastOrderAt': _now,
          'createdAt': _now,
        },
      ], meta: meta);
    }
    if (p == '/admin/settings') {
      return r([
        {
          'key': 'reservations',
          'value': true,
          'description': 'Table reservations',
          'source': 'database',
          'updatedAt': _now,
        },
        {
          'key': 'deliveryGps',
          'value': false,
          'description': 'Live rider GPS',
          'source': 'environment',
          'updatedAt': null,
        },
        {
          'key': 'orderAutoCancelMinutes',
          'value': 30,
          'description': null,
          'source': 'environment',
          'updatedAt': null,
        },
      ]);
    }
    if (p == '/admin/audit-logs') {
      return r([
        {
          'id': 'l1',
          'actorId': 'u1',
          'actorName': 'Rizwan',
          'actorRole': 'SUPER_ADMIN',
          'action': 'MENU_ITEM_UPDATED',
          'entityType': 'MenuItem',
          'entityId': 'm1',
          'branchId': null,
          'before': {'basePrice': 99000},
          'after': {'basePrice': 109000},
          'ip': null,
          'createdAt': _now,
        },
      ], meta: meta);
    }
    if (p == '/staff/me/duty') return r(_staff('9', 'DELIVERY_AGENT'));
    return const FakeReply(404, {
      'success': false,
      'error': {'code': 'NOT_FOUND', 'message': 'No fake route'},
    });
  };
}
