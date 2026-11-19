import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/theme/app_theme.dart';
import 'package:ox_grill/features/cart/application/cart_controller.dart';
import 'package:ox_grill/features/menu/domain/menu.dart';
import 'package:ox_grill/features/menu/domain/option_selection.dart';
import 'package:ox_grill/features/menu/presentation/item_detail_screen.dart';

import '../../helpers/fake_api.dart';
import '../../helpers/test_container.dart';

const _session =
    '{"branchId":"cmuxu7tgo0000qkfvy7vg5wun","branchName":"Ox & Grill F-7 Markaz","orderType":"DELIVERY"}';

/// A required single-choice group with no default, a required 2–3 group and
/// an optional group, to exercise every rule.
MenuItemDetail _steak() => MenuItemDetail.fromJson({
  'id': 'steak',
  'slug': 'steak',
  'name': 'Ribeye Steak',
  'description': 'Prime ribeye',
  'imageUrl': null,
  'categoryId': 'c1',
  'categoryName': 'Steaks',
  'basePrice': 350000,
  'price': 350000,
  'isAvailable': true,
  'hasOptions': true,
  'optionGroups': [
    {
      'id': 'sauces',
      'name': 'Sauces',
      'minSelect': 0,
      'maxSelect': 2,
      'options': [
        {'id': 's1', 'name': 'Pepper', 'priceDelta': 15000},
        {'id': 's2', 'name': 'Mushroom', 'priceDelta': 15000},
        {'id': 's3', 'name': 'Garlic', 'priceDelta': 10000},
      ],
    },
    {
      'id': 'doneness',
      'name': 'Doneness',
      'minSelect': 1,
      'maxSelect': 1,
      'options': [
        {'id': 'd1', 'name': 'Medium rare'},
        {'id': 'd2', 'name': 'Well done'},
      ],
    },
    {
      'id': 'sides',
      'name': 'Sides',
      'minSelect': 2,
      'maxSelect': 3,
      'options': [
        {'id': 'x1', 'name': 'Mash', 'priceDelta': 20000},
        {'id': 'x2', 'name': 'Fries'},
        {'id': 'x3', 'name': 'Salad'},
        {'id': 'x4', 'name': 'Veg'},
      ],
    },
  ],
});

void main() {
  group('OptionSelection', () {
    test('required groups are ordered before optional ones', () {
      expect(_steak().orderedGroups.map((g) => g.id), ['doneness', 'sides', 'sauces']);
    });

    test('rule labels', () {
      final g = {for (final g in _steak().orderedGroups) g.id: g.ruleLabel};
      expect(g, {'doneness': 'Choose 1', 'sides': 'Choose 2–3', 'sauces': 'Optional · choose up to 2'});
    });

    test('blocks until every required group is met, naming the first one', () {
      final item = _steak();
      final groups = {for (final g in item.orderedGroups) g.id: g};
      var s = OptionSelection.initial(item);
      expect(s.isComplete, isFalse);
      expect(s.blockingReason, 'Choose 1 from “Doneness”');

      s = s.toggle(groups['doneness']!, groups['doneness']!.options.first);
      expect(s.blockingReason, 'Choose 2–3 from “Sides”');

      s = s.toggle(groups['sides']!, groups['sides']!.options[0]);
      expect(s.blockingReason, 'Choose 1 more from “Sides”');

      s = s.toggle(groups['sides']!, groups['sides']!.options[1]);
      expect(s.isComplete, isTrue);
      expect(s.blockingReason, isNull);
    });

    test('maxSelect is enforced; single choice switches', () {
      final item = _steak();
      final groups = {for (final g in item.orderedGroups) g.id: g};
      final sauces = groups['sauces']!;
      var s = OptionSelection.initial(item);
      s = s
          .toggle(sauces, sauces.options[0])
          .toggle(sauces, sauces.options[1])
          .toggle(sauces, sauces.options[2]);
      expect(s.chosenIn(sauces), ['s1', 's2']);
      expect(s.canAddMore(sauces), isFalse);

      final doneness = groups['doneness']!;
      s = s.toggle(doneness, doneness.options[0]).toggle(doneness, doneness.options[1]);
      expect(s.chosenIn(doneness), ['d2']);
      s = s.toggle(doneness, doneness.options[1]);
      expect(s.chosenIn(doneness), ['d2'], reason: 'a required single choice cannot be cleared');
    });

    test('estimate adds option deltas', () {
      final item = _steak();
      final sauces = item.orderedGroups.firstWhere((g) => g.id == 'sauces');
      final s = OptionSelection.initial(item).toggle(sauces, sauces.options.first);
      expect(s.unitEstimate.paisa, 365000);
    });

    test('live fixture: Swiss Mushroom Burger preselects its default', () {
      final item = MenuItemDetail.fromJson(fixtureData('item_swiss_mushroom_burger.json'));
      final s = OptionSelection.initial(item);
      expect(s.isComplete, isTrue);
      expect(s.cartOptions.single.name, 'Swiss Mushroom Burger (Chicken)');
    });
  });

  group('ItemCustomizer widget', () {
    Future<ProviderContainer> pump(WidgetTester tester, MenuItemDetail item) async {
      final (api, _) = fakeApi(fixtureRoutes({}));
      final overrides = await testOverrides(api: api, prefs: {'session.v1': _session});
      final container = ProviderContainer(overrides: overrides);
      addTearDown(container.dispose);
      tester.view.physicalSize = const Size(390 * 3, 844 * 3);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            theme: AppTheme.dark(),
            home: ItemCustomizer(item: item),
          ),
        ),
      );
      return container;
    }

    FilledButton submit(WidgetTester tester) =>
        tester.widget<FilledButton>(find.byKey(const Key('customizer-submit')));

    testWidgets('required groups disable Add and show the reason', (tester) async {
      await pump(tester, _steak());
      expect(submit(tester).onPressed, isNull);
      expect(find.text('Choose 1 from “Doneness”'), findsOneWidget);
      expect(find.text('Add · Rs 3,500'), findsOneWidget);
      expect(find.text('Required'), findsNWidgets(2));
    });

    testWidgets('meeting the rules enables Add and the price follows choices and quantity', (tester) async {
      final container = await pump(tester, _steak());
      Future<void> tap(Finder f) async {
        await tester.ensureVisible(f);
        await tester.pump();
        await tester.tap(f);
        await tester.pump();
      }

      await tap(find.text('Medium rare'));
      expect(find.text('Choose 2–3 from “Sides”'), findsOneWidget);

      await tap(find.text('Mash'));
      await tap(find.text('Fries'));
      expect(submit(tester).onPressed, isNotNull);
      expect(find.text('Add · Rs 3,700'), findsOneWidget);

      await tap(find.byTooltip('Increase quantity of Ribeye Steak'));
      expect(find.text('Add · Rs 7,400'), findsOneWidget);

      // Navigator has nothing to pop in this harness; adding is what matters.
      submit(tester).onPressed!();
      await tester.pump();
      final cart = container.read(cartProvider);
      expect(cart.single.quantity, 2);
      expect(cart.single.optionIds.toSet(), {'d1', 'x1', 'x2'});
    });

    testWidgets('sold-out item cannot be added', (tester) async {
      final json = fixtureData('item_beef_chilli_fries.json')..['isAvailable'] = false;
      await pump(tester, MenuItemDetail.fromJson(json));
      expect(submit(tester).onPressed, isNull);
      expect(find.text('Sold out at this branch'), findsOneWidget);
    });
  });
}
