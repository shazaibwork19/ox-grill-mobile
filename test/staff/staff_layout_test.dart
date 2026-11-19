import 'dart:async';

import 'package:dio/dio.dart' show RequestOptions;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/providers.dart';
import 'package:ox_grill/core/widgets/app_image.dart';
import 'package:ox_grill/staff/app/staff_app.dart';
import 'package:ox_grill/staff/app/staff_shell.dart';
import 'package:ox_grill/staff/core/permissions.dart';
import 'package:ox_grill/staff/core/session.dart';
import 'package:ox_grill/staff/core/staff_socket.dart';
import 'package:ox_grill/staff/domain/admin_models.dart';
import 'package:ox_grill/staff/features/admin/admin_hub_page.dart';
import 'package:ox_grill/staff/features/admin/branches_admin.dart';
import 'package:ox_grill/staff/features/admin/menu_admin.dart';
import 'package:ox_grill/staff/features/orders/order_detail_page.dart';
import 'package:ox_grill/staff/features/orders/pos_page.dart';
import 'package:ox_grill/staff/features/people/staff_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/fake_api.dart';
import '../helpers/staff_fixtures.dart';
import '../helpers/staff_harness.dart';
import '../helpers/test_container.dart';

Future<void> _settle(WidgetTester tester, [int frames = 8]) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

/// Pushes [page] on top of the shell, lets it load, then pops it.
Future<void> _visit(WidgetTester tester, Widget page) async {
  final nav = tester.state<NavigatorState>(find.byType(Navigator).last);
  unawaited(nav.push(MaterialPageRoute<void>(builder: (_) => page)));
  await _settle(tester);
  expect(tester.takeException(), isNull, reason: 'while showing ${page.runtimeType}');
  nav.pop();
  await _settle(tester, 4);
}

void main() {
  const roles = ['SUPER_ADMIN', 'BRANCH_MANAGER', 'CASHIER', 'KITCHEN_STAFF', 'DELIVERY_AGENT'];
  const sizes = [320.0, 360.0, 430.0, 1024.0];
  const scales = [1.0, 1.3];

  for (final role in roles) {
    for (final w in sizes) {
      for (final s in scales) {
        testWidgets('$role ${w.toInt()}px @${s}x: every screen renders', (tester) async {
          await pumpStaff(tester, role, width: w, height: w > 800 ? 768 : 844, scale: s);
          expect(find.byType(StaffShell), findsOneWidget, reason: 'restored session lands on the shell');
          final container = ProviderScope.containerOf(tester.element(find.byType(StaffShell)));
          final session = container.read(sessionProvider).value!;
          final dests = destinationsFor(session, reservations: true, waitlist: true);
          for (final d in dests) {
            await _visit(tester, Builder(builder: d.builder));
          }
          if (session.can(Capability.orders)) {
            await _visit(tester, const OrderDetailPage(branchId: branchId, orderId: 'mock-order-1'));
            await _visit(tester, const ReceiptPage(branchId: branchId, orderId: 'mock-order-1'));
          }
          if (session.can(Capability.pos)) await _visit(tester, const PosPage(branchId: branchId));
          if (session.can(Capability.branchStaff)) {
            await _visit(tester, StaffForm(admin: role == 'SUPER_ADMIN', branchId: branchId));
          }
          if (role == 'SUPER_ADMIN') {
            await _visit(tester, const AdminHubPage());
            final b = BranchAdmin.fromJson(
              Map<String, dynamic>.from(
                ((await staffRoutes(role: role)(
                          RequestOptions(path: 'https://api.test/api/v1/admin/branches'),
                        )).body!
                        as Map)['data'][0]
                    as Map,
              ),
            );
            await _visit(tester, BranchEditor(branch: b));
            await _visit(tester, HoursEditor(branch: b));
            await _visit(tester, const BranchesAdminPage());
            await _visit(tester, const CategoriesPage());
            await _visit(tester, const MenuItemsPage());
            await _visit(tester, const MenuItemEditor(categories: [], itemId: 'cmuxu7u4j009hqkfvntr7rdfh'));
            await _visit(tester, const MenuItemEditor(categories: []));
          }
        });
      }
    }
  }

  testWidgets('signed-out start shows the sign-in screen and signs in', (tester) async {
    AppImage.loadNetworkImages = false;
    SharedPreferences.setMockInitialValues({});
    FlutterSecureStorage.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final api = fakeApi(staffRoutes(role: 'KITCHEN_STAFF')).$1;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(testConfig),
          sharedPreferencesProvider.overrideWithValue(prefs),
          apiClientProvider.overrideWithValue(api),
          staffPublicApiProvider.overrideWithValue(api),
          staffApiProvider.overrideWithValue(api),
          staffSocketProvider.overrideWithValue(null),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
        ],
        child: const StaffApp(),
      ),
    );
    await _settle(tester);
    expect(find.text('Sign in'), findsWidgets);
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await _settle(tester, 2);
    expect(find.text('Enter your work email'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'kitchen.f7@oxgrill.test');
    await tester.enterText(find.byType(TextFormField).at(1), 'correct horse');
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await _settle(tester, 12);
    expect(find.text('Kitchen'), findsWidgets);
    expect(find.text('OG-1002'), findsOneWidget);
    expect(find.text('Start preparing'), findsWidgets);
  });
}
