import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ox_grill/core/theme/app_colors.dart';

double _channel(double c) => c <= 0.03928 ? c / 12.92 : math.pow((c + 0.055) / 1.055, 2.4).toDouble();

double _luminance(Color c) => 0.2126 * _channel(c.r) + 0.7152 * _channel(c.g) + 0.0722 * _channel(c.b);

double contrast(Color a, Color b) {
  final la = _luminance(a), lb = _luminance(b);
  return (math.max(la, lb) + 0.05) / (math.min(la, lb) + 0.05);
}

/// Composites a translucent colour over an opaque background.
Color over(Color fg, Color bg) => Color.from(
  alpha: 1,
  red: fg.r * fg.a + bg.r * (1 - fg.a),
  green: fg.g * fg.a + bg.g * (1 - fg.a),
  blue: fg.b * fg.a + bg.b * (1 - fg.a),
);

void main() {
  const c = AppColors.brand;

  // Text/background pairs the UI actually uses. AA = 4.5 for normal text.
  final pairs = <String, (Color, Color)>{
    'primary text on scaffold': (c.cream50, c.ink950),
    'primary text on shell': (c.cream50, c.ink900),
    'primary text on card': (c.cream50, c.ink800),
    'secondary text on scaffold': (c.cream200, c.ink950),
    'secondary text on card': (c.cream200, c.ink800),
    'button label on ember': (c.cream50, c.ember600),
    'bronze highlight text on scaffold': (c.bronze400, c.ink950),
    'bronze highlight text on card': (c.bronze400, c.ink800),
    'error text on scaffold': (c.danger500, c.ink950),
    'amber "in progress" text on scaffold': (c.amber500, c.ink950),
    'offline banner text': (c.ink950, c.amber500),
    'snackbar text': (c.ink950, c.cream50),
    'selected chip text': (c.ink950, c.cream50),
    'badge text on sage tint': (c.cream50, over(c.sage500.withValues(alpha: 0.16), c.ink950)),
    'badge text on danger tint': (c.cream50, over(c.danger500.withValues(alpha: 0.16), c.ink800)),
    'badge text on amber tint': (c.cream50, over(c.amber500.withValues(alpha: 0.16), c.ink800)),
    'cart bar caption on ember': (c.cream50, c.ember600),
  };

  for (final MapEntry(key: name, value: (fg, bg)) in pairs.entries) {
    test('WCAG AA: $name', () {
      expect(
        contrast(fg, bg),
        greaterThanOrEqualTo(4.5),
        reason: '$name is ${contrast(fg, bg).toStringAsFixed(2)}:1',
      );
    });
  }
}
