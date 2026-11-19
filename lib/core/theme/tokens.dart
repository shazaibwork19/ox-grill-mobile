import 'package:flutter/widgets.dart';

/// 4px spacing grid.
abstract final class Space {
  static const double x1 = 4;
  static const double x2 = 8;
  static const double x3 = 12;
  static const double x4 = 16;
  static const double x6 = 24;
  static const double x8 = 32;
  static const double x12 = 48;

  /// Side gutter on phones.
  static const double gutter = 16;

  /// Minimum height of buttons and inputs, and minimum tap target.
  static const double minTap = 48;
}

abstract final class Radii {
  static const double control = 12;
  static const double card = 18;
  static const double sheet = 24;
  static const double pill = 999;

  static const BorderRadius controlAll = BorderRadius.all(Radius.circular(control));
  static const BorderRadius cardAll = BorderRadius.all(Radius.circular(card));
  static const BorderRadius sheetTop = BorderRadius.vertical(top: Radius.circular(sheet));
  static const BorderRadius sheetAll = BorderRadius.all(Radius.circular(sheet));
}

/// Durations. Use [Motion.of] so they drop to zero when the OS asks for reduced motion.
abstract final class Motion {
  static const Duration direct = Duration(milliseconds: 150);
  static const Duration sheet = Duration(milliseconds: 250);

  static bool reduced(BuildContext context) => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

  static Duration of(BuildContext context, Duration d) => reduced(context) ? Duration.zero : d;
}

/// Type scale: 12, 14, 16, 18, 22, 28, 36, 48.
abstract final class TypeScale {
  static const double xs = 12;
  static const double sm = 14;
  static const double md = 16;
  static const double lg = 18;
  static const double xl = 22;
  static const double x2l = 28;
  static const double x3l = 36;
  static const double x4l = 48;

  static const double bodyHeight = 1.55;
  static const double labelHeight = 1.25;
}

/// Width breakpoint where the layout switches to two columns and a side cart.
abstract final class Breakpoints {
  static const double tablet = 720;

  static bool isTablet(BuildContext context) => MediaQuery.sizeOf(context).width >= tablet;
}
