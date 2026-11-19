import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/features/cart/domain/cart.dart';

CartLine line(
  String id, {
  String item = 'steak',
  int qty = 1,
  int price = 250000,
  List<CartOption> options = const [],
  String? notes,
}) => CartLine(
  lineId: id,
  menuItemId: item,
  name: item,
  unitPrice: price,
  quantity: qty,
  options: options,
  notes: notes,
);

const mash = CartOption(id: 'mash', groupId: 'side', groupName: 'Side', name: 'Mash', priceDelta: 20000);
const fries = CartOption(id: 'fries', groupId: 'side', groupName: 'Side', name: 'Fries', priceDelta: 0);
const pepper = CartOption(
  id: 'pepper',
  groupId: 'sauce',
  groupName: 'Sauce',
  name: 'Pepper',
  priceDelta: 15000,
);

void main() {
  group('addLine', () {
    test('adds a new line', () {
      final cart = <CartLine>[].addLine(line('a'));
      expect(cart, hasLength(1));
      expect(cart.itemCount, 1);
    });

    test('merges identical lines by adding quantities', () {
      final cart = <CartLine>[].addLine(line('a', qty: 2)).addLine(line('b', qty: 3));
      expect(cart, hasLength(1));
      expect(cart.single.quantity, 5);
      expect(cart.single.lineId, 'a', reason: 'keeps the existing line id');
    });

    test('option order does not matter for merging', () {
      final cart = <CartLine>[]
          .addLine(line('a', options: [mash, pepper]))
          .addLine(line('b', options: [pepper, mash]));
      expect(cart, hasLength(1));
      expect(cart.single.quantity, 2);
    });

    test('different customizations stay separate', () {
      final cart = <CartLine>[]
          .addLine(line('a', options: [mash]))
          .addLine(line('b', options: [fries]))
          .addLine(line('c'))
          .addLine(line('d', notes: 'medium rare'));
      expect(cart, hasLength(4));
    });

    test('notes are trimmed when comparing', () {
      final cart = <CartLine>[]
          .addLine(line('a', notes: 'no onions'))
          .addLine(line('b', notes: '  no onions '));
      expect(cart, hasLength(1));
    });

    test('quantity is capped at 50', () {
      final cart = <CartLine>[].addLine(line('a', qty: 40)).addLine(line('b', qty: 20));
      expect(cart.single.quantity, CartLine.maxQuantity);
    });
  });

  group('replaceLine', () {
    test('updates a line in place', () {
      final cart = [
        line('a'),
        line('b', item: 'burger'),
      ].replaceLine('a', line('x', options: [mash], qty: 2));
      expect(cart.first.lineId, 'a');
      expect(cart.first.optionIds, ['mash']);
      expect(cart.first.quantity, 2);
      expect(cart[1].menuItemId, 'burger');
    });

    test('merges into an identical line after editing', () {
      final cart = [
        line('a', options: [mash]),
        line('b', options: [fries]),
      ].replaceLine('b', line('b', options: [mash]));
      expect(cart, hasLength(1));
      expect(cart.single.quantity, 2);
    });
  });

  group('quantities and removal', () {
    test('setQuantity to 0 removes the line', () {
      final cart = [line('a'), line('b', item: 'burger')].setQuantity('a', 0);
      expect(cart.map((l) => l.lineId), ['b']);
    });

    test('removeLine', () {
      expect([line('a')].removeLine('a'), isEmpty);
    });
  });

  group('estimates', () {
    test('estimated subtotal includes option deltas times quantity', () {
      final cart = [
        line('a', qty: 2, price: 250000, options: [mash, pepper]),
        line('b', item: 'burger', price: 99000),
      ];
      // (2500 + 200 + 150) × 2 + 990 = 6690 rupees
      expect(cart.estimatedSubtotal.paisa, 669000);
      expect(cart.itemCount, 3);
    });
  });

  test('toCartItemInput sends ids and quantity only, never prices', () {
    final input = line('a', qty: 2, options: [mash], notes: ' extra hot ').toCartItemInput();
    expect(input, {
      'menuItemId': 'steak',
      'quantity': 2,
      'optionIds': ['mash'],
      'notes': 'extra hot',
    });
  });

  test('cart line survives JSON round trip (persistence)', () {
    final original = line('a', qty: 3, options: [mash, pepper], notes: 'n');
    expect(CartLine.fromJson(original.toJson()), original);
  });
}
