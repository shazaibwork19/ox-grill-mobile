import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'helpers/app_harness.dart';

/// Renders each screen at every supported width, at 1.0× and 1.3× text, from
/// the saved live API fixtures. A RenderFlex overflow or any other layout
/// error fails the test.
void main() {
  const widths = [320.0, 360.0, 375.0, 390.0, 412.0, 430.0, 768.0, 1024.0];
  const scales = [1.0, 1.3];

  for (final width in widths) {
    for (final scale in scales) {
      final label = '${width.toInt()}px @${scale}x';

      testWidgets('branch selection $label', (tester) async {
        await pumpApp(tester, width: width, textScale: scale);
        expect(find.text('Choose your branch'), findsOneWidget);
        expect(find.text('Ox & Grill F-7 Markaz'), findsOneWidget);
        await tester.tap(find.text('Ox & Grill F-7 Markaz'));
        await settle(tester, frames: 5);
        expect(find.text('How would you like your order?'), findsOneWidget);
        expect(find.text('Delivery'), findsWidgets);
      });

      testWidgets('menu $label', (tester) async {
        await pumpApp(tester, width: width, textScale: scale, prefs: {'session.v1': f7Session});
        expect(find.text('Starters'), findsWidgets);
        expect(find.text('Beef Chilli Fries'), findsWidgets);

        // Tap a far-away category chip: the list scrolls to its section.
        final chip = find.bySemanticsLabel('Jump to Desserts');
        await tester.ensureVisible(chip);
        await tester.tap(chip);
        await settle(tester, frames: 6);
        expect(find.widgetWithText(Semantics, 'Desserts'), findsWidgets);

        // Search narrows the list.
        await tester.enterText(find.byType(TextField).first, 'beef');
        await settle(tester, frames: 3);
        expect(find.textContaining('found'), findsOneWidget);
      });

      testWidgets('cart sheet $label', (tester) async {
        await pumpApp(
          tester,
          width: width,
          textScale: scale,
          prefs: {'session.v1': f7Session, 'cart.v1.$f7Id': quoteCartJson()},
        );
        await tester.tap(find.bySemanticsLabel(RegExp('^View cart')));
        await settle(tester, frames: 8);
        expect(find.text('Your cart'), findsOneWidget);
        // The quote's issue for line 3 is shown and blocks checkout.
        await tester.scrollUntilVisible(
          find.textContaining('Choose exactly 1'),
          200,
          scrollable: find.byType(Scrollable).last,
        );
        expect(find.textContaining('Choose exactly 1'), findsOneWidget);
        expect(find.text('Fix the highlighted item to continue.'), findsOneWidget);
        expect(find.textContaining('Rs 5,161'), findsWidgets);
      });

      testWidgets('checkout form $label', (tester) async {
        await pumpApp(
          tester,
          width: width,
          textScale: scale,
          prefs: {'session.v1': f7Session, 'cart.v1.$f7Id': quoteCartJson()},
        );
        unawaited(GoRouter.of(tester.element(find.byType(Scaffold).first)).push('/checkout'));
        await settle(tester, frames: 8);
        expect(find.text('Your details'), findsOneWidget);
        expect(find.text('Mobile number'), findsOneWidget);
        await tester.scrollUntilVisible(
          find.text('Order summary'),
          300,
          scrollable: find.byType(Scrollable).first,
        );
        expect(find.text('Cash on delivery'), findsOneWidget);
      });

      testWidgets('order status $label', (tester) async {
        await pumpApp(tester, width: width, textScale: scale, prefs: {'session.v1': f7Session});
        unawaited(GoRouter.of(tester.element(find.byType(Scaffold).first)).push('/track/$mockToken'));
        await settle(tester, frames: 8);
        expect(find.text('OG-MOCK-1001'), findsOneWidget);
        expect(find.textContaining('Not confirmed yet.'), findsOneWidget);
        expect(find.textContaining('0300 1234567'), findsOneWidget);
        expect(find.text('Call branch'), findsOneWidget);
      });

      testWidgets('item customizer $label', (tester) async {
        await pumpApp(tester, width: width, textScale: scale, prefs: {'session.v1': f7Session});
        unawaited(
          GoRouter.of(tester.element(find.byType(Scaffold).first)).push('/item/cmuxu7u4j009hqkfvntr7rdfh'),
        );
        await settle(tester, frames: 8);
        expect(find.text('Swiss Mushroom Burger'), findsOneWidget);
        expect(find.text('Choose Your Preference'), findsOneWidget);
        expect(find.textContaining('Add · Rs'), findsOneWidget);
      });

      testWidgets('branch info $label', (tester) async {
        await pumpApp(tester, width: width, textScale: scale, prefs: {'session.v1': f7Session});
        unawaited(GoRouter.of(tester.element(find.byType(Scaffold).first)).push('/branch/$f7Id'));
        await settle(tester, frames: 8);
        expect(find.text('Opening hours'), findsOneWidget);
        expect(find.textContaining('0325 8875554'), findsOneWidget);
      });
    }
  }
}
