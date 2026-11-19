import 'package:flutter/material.dart';

/// Brand palette. Defined once; widgets read it via `context.colors`.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.ink950,
    required this.ink900,
    required this.ink800,
    required this.cream50,
    required this.cream200,
    required this.ember600,
    required this.ember500,
    required this.bronze400,
    required this.sage500,
    required this.amber500,
    required this.danger500,
  });

  static const brand = AppColors(
    ink950: Color(0xFF0A0908),
    ink900: Color(0xFF12100F),
    ink800: Color(0xFF1C1917),
    cream50: Color(0xFFFFF9EE),
    cream200: Color(0xFFE8DDCB),
    ember600: Color(0xFFC8232C),
    ember500: Color(0xFFE13A42),
    bronze400: Color(0xFFC79A55),
    sage500: Color(0xFF3E8E63),
    amber500: Color(0xFFD69222),
    danger500: Color(0xFFDC4C4C),
  );

  /// Scaffold background.
  final Color ink950;

  /// App bars, elevated shell, sheets.
  final Color ink900;

  /// Cards, inputs.
  final Color ink800;

  /// Primary text.
  final Color cream50;

  /// Secondary text.
  final Color cream200;

  /// Primary action, brand red. Use as a fill with cream text, not as small text on ink.
  final Color ember600;

  /// Pressed / focus accent.
  final Color ember500;

  /// Premium highlights, savings, badges.
  final Color bronze400;

  /// Success, available, completed.
  final Color sage500;

  /// Warning, preparing.
  final Color amber500;

  /// Error, cancelled.
  final Color danger500;

  /// Warm white hairline (12%).
  Color get border => cream50.withValues(alpha: 0.12);

  /// Stronger warm white border (16%) for secondary buttons.
  Color get borderStrong => cream50.withValues(alpha: 0.16);

  /// Translucent cream surface for secondary buttons and chips.
  Color get creamSurface => cream50.withValues(alpha: 0.06);

  /// Black-tinted shadow.
  Color get shadow => const Color(0xFF000000).withValues(alpha: 0.45);

  @override
  AppColors copyWith({
    Color? ink950,
    Color? ink900,
    Color? ink800,
    Color? cream50,
    Color? cream200,
    Color? ember600,
    Color? ember500,
    Color? bronze400,
    Color? sage500,
    Color? amber500,
    Color? danger500,
  }) => AppColors(
    ink950: ink950 ?? this.ink950,
    ink900: ink900 ?? this.ink900,
    ink800: ink800 ?? this.ink800,
    cream50: cream50 ?? this.cream50,
    cream200: cream200 ?? this.cream200,
    ember600: ember600 ?? this.ember600,
    ember500: ember500 ?? this.ember500,
    bronze400: bronze400 ?? this.bronze400,
    sage500: sage500 ?? this.sage500,
    amber500: amber500 ?? this.amber500,
    danger500: danger500 ?? this.danger500,
  );

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      ink950: Color.lerp(ink950, other.ink950, t)!,
      ink900: Color.lerp(ink900, other.ink900, t)!,
      ink800: Color.lerp(ink800, other.ink800, t)!,
      cream50: Color.lerp(cream50, other.cream50, t)!,
      cream200: Color.lerp(cream200, other.cream200, t)!,
      ember600: Color.lerp(ember600, other.ember600, t)!,
      ember500: Color.lerp(ember500, other.ember500, t)!,
      bronze400: Color.lerp(bronze400, other.bronze400, t)!,
      sage500: Color.lerp(sage500, other.sage500, t)!,
      amber500: Color.lerp(amber500, other.amber500, t)!,
      danger500: Color.lerp(danger500, other.danger500, t)!,
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>() ?? AppColors.brand;
}
