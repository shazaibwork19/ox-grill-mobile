import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/domain/pricing.dart';
import 'package:ox_grill/core/money/money.dart';

void main() {
  group('Money', () {
    test('formats paisa as whole rupees with grouping', () {
      expect(const Money(244680).format(), 'Rs 2,447');
      expect(const Money(199000).format(), 'Rs 1,990');
      expect(const Money(15000).format(), 'Rs 150');
      expect(const Money(0).format(), 'Rs 0');
      expect(const Money(123456789).format(), 'Rs 1,234,568');
    });

    test('rounds half up', () {
      expect(const Money(244650).roundedRupees, 2447);
      expect(const Money(244649).roundedRupees, 2446);
      expect(const Money(50).roundedRupees, 1);
      expect(const Money(49).roundedRupees, 0);
    });

    test('negative amounts round away from zero and use a minus sign', () {
      expect(const Money(-15050).roundedRupees, -151);
      expect(const Money(-15000).format(), '−Rs 150');
    });

    test('arithmetic stays in integer paisa', () {
      const a = Money(99000);
      expect((a * 2 + const Money(15000)).paisa, 213000);
      expect((a - const Money(1000)).paisa, 98000);
      expect(Money.zero.isZero, isTrue);
    });

    test('spoken form for screen readers', () {
      expect(const Money(244680).spoken, '2,447 rupees');
    });
  });

  group('formatBps', () {
    test('whole and fractional percentages', () {
      expect(formatBps(1600), '16%');
      expect(formatBps(500), '5%');
      expect(formatBps(750), '7.5%');
      expect(formatBps(1625), '16.25%');
      expect(formatBps(1605), '16.05%');
    });
  });
}
