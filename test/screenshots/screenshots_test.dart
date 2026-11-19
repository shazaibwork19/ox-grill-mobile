@Tags(['screenshots'])
library;

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../helpers/app_harness.dart';

/// Renders screens with the real fonts into `screenshots/*.png` for review.
///
///   flutter test --tags screenshots --update-goldens
///
/// Network images are replaced by the branded placeholder. These are review
/// aids, not pixel tests: without `--update-goldens` they only check rendering.
Future<void> _loadFonts() async {
  Future<void> family(String name, List<String> assets) async {
    final loader = FontLoader(name);
    for (final a in assets) {
      loader.addFont(rootBundle.load(a));
    }
    await loader.load();
  }

  await family('Manrope', [
    for (final w in [400, 500, 600, 700, 800]) 'assets/fonts/Manrope-$w.ttf',
  ]);
  await family('DM Serif Display', [
    'assets/fonts/DMSerifDisplay-Regular.ttf',
    'assets/fonts/DMSerifDisplay-Italic.ttf',
  ]);
  final flutterRoot = Platform.environment['FLUTTER_ROOT'] ?? r'C:\flutter';
  final icons = File('$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf');
  if (icons.existsSync()) {
    final loader = FontLoader('MaterialIcons')
      ..addFont(Future.value(ByteData.view(icons.readAsBytesSync().buffer)));
    await loader.load();
  }
}

void main() {
  setUpAll(_loadFonts);

  const sizes = {'360': Size(360, 780), '430': Size(430, 932), 'tablet': Size(1024, 768)};

  for (final MapEntry(key: name, value: size) in sizes.entries) {
    Future<void> shot(WidgetTester tester, String screen) async {
      await expectLater(find.byType(MaterialApp), matchesGoldenFile('../../screenshots/${screen}_$name.png'));
    }

    testWidgets('branches $name', (tester) async {
      await pumpApp(tester, width: size.width, height: size.height);
      await shot(tester, '01_branches');
      await tester.tap(find.text('Ox & Grill F-7 Markaz'));
      await settle(tester, frames: 5);
      await shot(tester, '02_order_type');
    });

    testWidgets('menu $name', (tester) async {
      await pumpApp(
        tester,
        width: size.width,
        height: size.height,
        prefs: {'session.v1': f7Session, 'cart.v1.$f7Id': quoteCartJson()},
      );
      await shot(tester, '03_menu');
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -900));
      await settle(tester, frames: 4);
      await shot(tester, '04_menu_scrolled');
    });

    testWidgets('item $name', (tester) async {
      await pumpApp(tester, width: size.width, height: size.height, prefs: {'session.v1': f7Session});
      unawaited(
        GoRouter.of(tester.element(find.byType(Scaffold).first)).push('/item/cmuxu7u4j009hqkfvntr7rdfh'),
      );
      await settle(tester, frames: 8);
      await shot(tester, '05_item');
    });

    testWidgets('cart $name', (tester) async {
      await pumpApp(
        tester,
        width: size.width,
        height: size.height,
        prefs: {'session.v1': f7Session, 'cart.v1.$f7Id': quoteCartJson()},
      );
      await tester.tap(find.bySemanticsLabel(RegExp('^View cart')));
      await settle(tester, frames: 8);
      await shot(tester, '06_cart');
    });

    testWidgets('checkout $name', (tester) async {
      await pumpApp(
        tester,
        width: size.width,
        height: size.height,
        prefs: {'session.v1': f7Session, 'cart.v1.$f7Id': quoteCartJson()},
      );
      unawaited(GoRouter.of(tester.element(find.byType(Scaffold).first)).push('/checkout'));
      await settle(tester, frames: 8);
      await shot(tester, '07_checkout');
    });

    testWidgets('status $name', (tester) async {
      await pumpApp(tester, width: size.width, height: size.height, prefs: {'session.v1': f7Session});
      unawaited(GoRouter.of(tester.element(find.byType(Scaffold).first)).push('/track/$mockToken'));
      await settle(tester, frames: 8);
      await shot(tester, '08_status');
    });

    testWidgets('branch info $name', (tester) async {
      await pumpApp(tester, width: size.width, height: size.height, prefs: {'session.v1': f7Session});
      unawaited(GoRouter.of(tester.element(find.byType(Scaffold).first)).push('/branch/$f7Id'));
      await settle(tester, frames: 8);
      await shot(tester, '09_branch_info');
    });
  }
}
