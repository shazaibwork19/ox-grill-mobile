import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/app/app.dart';
import 'package:ox_grill/core/widgets/app_image.dart';

import 'fake_api.dart';
import 'test_container.dart';

const f7Id = 'cmuxu7tgo0000qkfvy7vg5wun';
const mockToken = 'mock-tracking-token-000000000001';
const f7Session = '{"branchId":"$f7Id","branchName":"Ox & Grill F-7 Markaz","orderType":"DELIVERY"}';

/// Every read endpoint the customer app uses, answered from live fixtures.
/// `POST /orders` is never routed: screen tests must not place orders.
Responder liveFixtureRoutes() => fixtureRoutes({
  'GET /config': (_) => FakeReply.fixture('config.json'),
  'GET /branches': (_) => FakeReply.fixture('branches.json'),
  'GET /branches/$f7Id': (_) => FakeReply.fixture('branch_detail.json'),
  'GET /menu': (_) => FakeReply.fixture('menu.json'),
  'GET /menu/items/cmuxu7u4j009hqkfvntr7rdfh': (_) => FakeReply.fixture('item_swiss_mushroom_burger.json'),
  'POST /menu/quote': (_) => FakeReply.fixture('quote_delivery_cod.json'),
  'GET /orders/track/$mockToken': (_) => FakeReply.fixture('mock_track_pending.json'),
});

/// A cart with the three lines that produced `quote_delivery_cod.json`.
String quoteCartJson() {
  final burger = fixtureData('item_swiss_mushroom_burger.json');
  final chicken = (burger['optionGroups'] as List).first['options'][0] as Map<String, dynamic>;
  return jsonEncode([
    {
      'lineId': 'l1',
      'menuItemId': 'cmuxu7tpl0025qkfv5x12fvnm',
      'name': 'Beef Chilli Fries',
      'unitPrice': 99000,
      'quantity': 2,
    },
    {
      'lineId': 'l2',
      'menuItemId': burger['id'],
      'name': 'Swiss Mushroom Burger',
      'unitPrice': 139000,
      'quantity': 1,
      'options': [
        {
          'id': chicken['id'],
          'groupId': (burger['optionGroups'] as List).first['id'],
          'groupName': 'Choose Your Preference',
          'name': chicken['name'],
          'priceDelta': chicken['priceDelta'],
        },
      ],
    },
    {
      'lineId': 'l3',
      'menuItemId': burger['id'],
      'name': 'Swiss Mushroom Burger',
      'unitPrice': 139000,
      'quantity': 1,
    },
  ]);
}

/// Pumps the real app at [width]×[height] logical px and [textScale].
Future<void> pumpApp(
  WidgetTester tester, {
  required double width,
  double height = 844,
  double textScale = 1,
  Map<String, Object> prefs = const {},
}) async {
  AppImage.loadNetworkImages = false;
  tester.view.devicePixelRatio = 2;
  tester.view.physicalSize = Size(width * 2, height * 2);
  tester.platformDispatcher.textScaleFactorTestValue = textScale;
  addTearDown(() {
    tester.view.reset();
    tester.platformDispatcher.clearTextScaleFactorTestValue();
  });

  final (api, _) = fakeApi(liveFixtureRoutes());
  final overrides = await testOverrides(api: api, prefs: prefs);
  await tester.pumpWidget(ProviderScope(overrides: overrides, child: const OxGrillApp()));
  await settle(tester);
}

/// Like `pumpAndSettle` but tolerates the endless skeleton pulse.
Future<void> settle(WidgetTester tester, {int frames = 20}) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}
