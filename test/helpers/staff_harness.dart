import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/providers.dart';
import 'package:ox_grill/core/widgets/app_image.dart';
import 'package:ox_grill/staff/app/staff_app.dart';
import 'package:ox_grill/staff/core/session.dart';
import 'package:ox_grill/staff/core/staff_socket.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_api.dart';
import 'staff_fixtures.dart';
import 'test_container.dart';

/// Signs in as [role] (stored tokens + mocked `/auth/me`) and pumps the staff app.
Future<void> pumpStaff(
  WidgetTester tester,
  String role, {
  double width = 390,
  double height = 844,
  double scale = 1,
}) async {
  AppImage.loadNetworkImages = false;
  tester.view.devicePixelRatio = 2;
  tester.view.physicalSize = Size(width * 2, height * 2);
  tester.platformDispatcher.textScaleFactorTestValue = scale;
  addTearDown(() {
    tester.view.reset();
    tester.platformDispatcher.clearTextScaleFactorTestValue();
  });
  SharedPreferences.setMockInitialValues({if (role == 'SUPER_ADMIN') 'staff.ownerBranch.v1': branchId});
  FlutterSecureStorage.setMockInitialValues({'auth.tokens.v1': jsonEncode(tokensJson())});
  final prefs = await SharedPreferences.getInstance();
  final routes = staffRoutes(role: role);
  final api = fakeApi(routes).$1;
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
  for (var i = 0; i < 15; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}
