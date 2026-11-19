import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'tokens.dart';

abstract final class AppFonts {
  static const sans = 'Manrope';
  static const serif = 'DM Serif Display';
}

abstract final class AppTheme {
  static ThemeData dark() {
    const c = AppColors.brand;

    TextStyle sans(double size, FontWeight weight, double height, Color color) => TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: size,
      fontWeight: weight,
      height: height,
      color: color,
      letterSpacing: 0,
    );
    TextStyle serif(double size) => TextStyle(
      fontFamily: AppFonts.serif,
      fontSize: size,
      fontWeight: FontWeight.w400,
      height: 1.15,
      color: c.cream50,
      letterSpacing: 0,
    );

    final textTheme = TextTheme(
      displayLarge: serif(TypeScale.x4l),
      displayMedium: serif(TypeScale.x3l),
      displaySmall: serif(TypeScale.x2l),
      headlineMedium: serif(TypeScale.x2l),
      headlineSmall: serif(TypeScale.xl),
      titleLarge: sans(TypeScale.xl, FontWeight.w700, TypeScale.labelHeight, c.cream50),
      titleMedium: sans(TypeScale.lg, FontWeight.w700, TypeScale.labelHeight, c.cream50),
      titleSmall: sans(TypeScale.md, FontWeight.w700, TypeScale.labelHeight, c.cream50),
      bodyLarge: sans(TypeScale.md, FontWeight.w400, TypeScale.bodyHeight, c.cream50),
      bodyMedium: sans(TypeScale.sm, FontWeight.w400, TypeScale.bodyHeight, c.cream200),
      bodySmall: sans(TypeScale.xs, FontWeight.w500, TypeScale.bodyHeight, c.cream200),
      labelLarge: sans(TypeScale.md, FontWeight.w700, TypeScale.labelHeight, c.cream50),
      labelMedium: sans(TypeScale.sm, FontWeight.w600, TypeScale.labelHeight, c.cream50),
      labelSmall: sans(TypeScale.xs, FontWeight.w600, TypeScale.labelHeight, c.cream200),
    );

    final scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: c.ember600,
      onPrimary: c.cream50,
      secondary: c.bronze400,
      onSecondary: c.ink950,
      tertiary: c.sage500,
      onTertiary: c.cream50,
      error: c.danger500,
      onError: c.cream50,
      surface: c.ink950,
      onSurface: c.cream50,
      onSurfaceVariant: c.cream200,
      surfaceContainerLowest: c.ink950,
      surfaceContainerLow: c.ink900,
      surfaceContainer: c.ink900,
      surfaceContainerHigh: c.ink800,
      surfaceContainerHighest: c.ink800,
      outline: c.borderStrong,
      outlineVariant: c.border,
      shadow: const Color(0xFF000000),
      scrim: const Color(0xCC000000),
      inverseSurface: c.cream50,
      onInverseSurface: c.ink950,
      primaryContainer: c.ember600,
      onPrimaryContainer: c.cream50,
    );

    const minButton = Size(Space.minTap, Space.minTap);
    final buttonText = textTheme.labelLarge;
    const buttonShape = RoundedRectangleBorder(borderRadius: Radii.controlAll);
    const buttonPadding = EdgeInsets.symmetric(horizontal: Space.x6, vertical: Space.x3);

    final inputBorder = OutlineInputBorder(
      borderRadius: Radii.controlAll,
      borderSide: BorderSide(color: c.border),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.ink950,
      canvasColor: c.ink950,
      fontFamily: AppFonts.sans,
      textTheme: textTheme,
      extensions: const [AppColors.brand],
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: VisualDensity.standard,
      splashFactory: InkSparkle.splashFactory,
      dividerTheme: DividerThemeData(color: c.border, thickness: 1, space: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: c.ink900,
        foregroundColor: c.cream50,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleMedium,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: c.ink900,
        ),
      ),
      cardTheme: CardThemeData(
        color: c.ink800,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.cardAll,
          side: BorderSide(color: c.border),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(minButton),
          padding: const WidgetStatePropertyAll(buttonPadding),
          shape: const WidgetStatePropertyAll(buttonShape),
          textStyle: WidgetStatePropertyAll(buttonText),
          backgroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.disabled) ? c.ink800 : c.ember600,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.disabled) ? c.cream200.withValues(alpha: 0.7) : c.cream50,
          ),
          overlayColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.pressed) ? Colors.black.withValues(alpha: 0.16) : null,
          ),
          side: WidgetStateProperty.resolveWith(
            (s) =>
                s.contains(WidgetState.focused) ? BorderSide(color: c.ember500, width: 2) : BorderSide.none,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(minButton),
          padding: const WidgetStatePropertyAll(buttonPadding),
          shape: const WidgetStatePropertyAll(buttonShape),
          textStyle: WidgetStatePropertyAll(buttonText),
          backgroundColor: WidgetStatePropertyAll(c.creamSurface),
          foregroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.disabled) ? c.cream200.withValues(alpha: 0.6) : c.cream50,
          ),
          side: WidgetStateProperty.resolveWith(
            (s) => BorderSide(color: s.contains(WidgetState.focused) ? c.ember500 : c.borderStrong),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(minButton),
          shape: const WidgetStatePropertyAll(buttonShape),
          textStyle: WidgetStatePropertyAll(textTheme.labelMedium),
          foregroundColor: WidgetStatePropertyAll(c.cream50),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(minButton),
          foregroundColor: WidgetStatePropertyAll(c.cream50),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.ink800,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: textTheme.labelMedium?.copyWith(color: c.cream200),
        floatingLabelStyle: textTheme.labelMedium?.copyWith(color: c.cream50),
        hintStyle: textTheme.bodyLarge?.copyWith(color: c.cream200.withValues(alpha: 0.55)),
        errorStyle: textTheme.bodySmall?.copyWith(color: c.danger500, fontWeight: FontWeight.w600),
        helperStyle: textTheme.bodySmall,
        errorMaxLines: 3,
        helperMaxLines: 3,
        contentPadding: const EdgeInsets.symmetric(horizontal: Space.x4, vertical: Space.x4),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(borderSide: BorderSide(color: c.ember500, width: 2)),
        errorBorder: inputBorder.copyWith(borderSide: BorderSide(color: c.danger500)),
        focusedErrorBorder: inputBorder.copyWith(borderSide: BorderSide(color: c.danger500, width: 2)),
        constraints: const BoxConstraints(minHeight: Space.minTap),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: c.creamSurface,
        selectedColor: c.cream50,
        disabledColor: c.ink800,
        side: BorderSide(color: c.border),
        shape: const StadiumBorder(),
        labelStyle: textTheme.labelMedium,
        secondaryLabelStyle: textTheme.labelMedium?.copyWith(color: c.ink950),
        padding: const EdgeInsets.symmetric(horizontal: Space.x3, vertical: Space.x2),
        showCheckmark: false,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.ink900,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: c.ink900,
        shape: const RoundedRectangleBorder(borderRadius: Radii.sheetTop),
        showDragHandle: true,
        dragHandleColor: c.cream200.withValues(alpha: 0.4),
        clipBehavior: Clip.antiAlias,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.ink900,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: Radii.sheetAll),
        titleTextStyle: textTheme.titleMedium,
        contentTextStyle: textTheme.bodyMedium,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: c.cream50,
        contentTextStyle: textTheme.labelMedium?.copyWith(color: c.ink950),
        actionTextColor: c.ember600,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: Radii.controlAll),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.ember500 : c.cream200,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.ember600 : Colors.transparent,
        ),
        checkColor: WidgetStatePropertyAll(c.cream50),
        side: BorderSide(color: c.cream200, width: 1.5),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: c.ember500, linearTrackColor: c.ink800),
      listTileTheme: ListTileThemeData(
        iconColor: c.cream200,
        textColor: c.cream50,
        minTileHeight: Space.minTap,
        titleTextStyle: textTheme.titleSmall,
        subtitleTextStyle: textTheme.bodyMedium,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {TargetPlatform.android: FadeForwardsPageTransitionsBuilder()},
      ),
    );
  }
}
