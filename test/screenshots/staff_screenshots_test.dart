@Tags(['screenshots'])
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/staff/features/kitchen/kitchen_page.dart';
import 'package:ox_grill/staff/features/orders/order_detail_page.dart';
import 'package:ox_grill/staff/features/orders/orders_page.dart';
import 'package:ox_grill/staff/features/reports/reports_page.dart';
import 'package:ox_grill/staff/features/rider/deliveries_page.dart';

import '../helpers/staff_fixtures.dart';
import '../helpers/staff_harness.dart';

/// Staff screens rendered with real fonts into `screenshots/staff_*.png` (mock data).
///   flutter test --tags screenshots --run-skipped --update-goldens test/screenshots
Future<void> _fonts() async {
  Future<void> family(String name, List<String> assets) async {
    final l = FontLoader(name);
    for (final a in assets) {
      l.addFont(rootBundle.load(a));
    }
    await l.load();
  }

  await family('Manrope', [
    for (final w in [400, 500, 600, 700, 800]) 'assets/fonts/Manrope-$w.ttf',
  ]);
  await family('DM Serif Display', [
    'assets/fonts/DMSerifDisplay-Regular.ttf',
    'assets/fonts/DMSerifDisplay-Italic.ttf',
  ]);
  final root = Platform.environment['FLUTTER_ROOT'] ?? r'C:\flutter';
  final icons = File('$root/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf');
  if (icons.existsSync()) {
    await (FontLoader(
      'MaterialIcons',
    )..addFont(Future.value(ByteData.view(icons.readAsBytesSync().buffer)))).load();
  }
}

Future<void> _settle(WidgetTester t, [int n = 10]) async {
  for (var i = 0; i < n; i++) {
    await t.pump(const Duration(milliseconds: 100));
  }
}

Future<void> _push(WidgetTester tester, Widget page) async {
  final nav = tester.state<NavigatorState>(find.byType(Navigator).last);
  unawaited(nav.push(MaterialPageRoute<void>(builder: (_) => page)));
  await _settle(tester);
}

void main() {
  setUpAll(_fonts);
  Future<void> shot(String name) =>
      expectLater(find.byType(MaterialApp), matchesGoldenFile('../../screenshots/staff_$name.png'));

  testWidgets('owner dashboard', (t) async {
    await pumpStaff(t, 'SUPER_ADMIN', width: 390);
    await shot('owner_dashboard_390');
  });
  testWidgets('manager orders + detail', (t) async {
    await pumpStaff(t, 'BRANCH_MANAGER', width: 360);
    await _push(t, const OrdersPage());
    await shot('manager_orders_360');
    await _push(t, const OrderDetailPage(branchId: branchId, orderId: 'mock-order-1'));
    await shot('manager_order_detail_360');
  });
  testWidgets('kitchen board tablet', (t) async {
    await pumpStaff(t, 'KITCHEN_STAFF', width: 1024, height: 768);
    await _push(t, const KitchenPage());
    await shot('kitchen_tablet');
  });
  testWidgets('rider', (t) async {
    await pumpStaff(t, 'DELIVERY_AGENT', width: 360);
    await _push(t, const DeliveriesPage());
    await shot('rider_360');
  });
  testWidgets('reports', (t) async {
    await pumpStaff(t, 'SUPER_ADMIN', width: 430, height: 932);
    await _push(t, const ReportsPage());
    await shot('owner_reports_430');
  });
}
