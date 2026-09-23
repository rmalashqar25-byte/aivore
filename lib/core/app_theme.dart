import 'package:flutter/material.dart';

abstract final class AppColors {
  static const ink = Color(0xFF0C0710);
  static const panel = Color(0xFF17101D);
  static const panelHigh = Color(0xFF24172D);
  static const line = Color(0xFF402B49);
  static const snow = Color(0xFFFFF8F0);
  static const muted = Color(0xFFCBB8CB);

  // “Magic ember” palette: warm light surrounded by deep plum.
  static const ember = Color(0xFFFF761A);
  static const glow = Color(0xFFFFC857);
  static const magic = Color(0xFFAA62F3);
  static const rose = Color(0xFFFF4D8D);

  static const violet = ember;
  static const cyan = glow;
  static const blue = magic;
  static const coral = rose;
  static const gold = Color(0xFFFFDF82);
}

ThemeData buildAppTheme() {
  final scheme =
      ColorScheme.fromSeed(
        seedColor: AppColors.ember,
        brightness: Brightness.dark,
        surface: AppColors.panel,
      ).copyWith(
        primary: AppColors.ember,
        secondary: AppColors.glow,
        tertiary: AppColors.magic,
        surface: AppColors.panel,
        onSurface: AppColors.snow,
        outline: AppColors.line,
      );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.ink,
    fontFamily: 'sans-serif',
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: AppColors.snow,
        fontWeight: FontWeight.w800,
        height: 1.05,
        letterSpacing: -1.2,
      ),
      headlineSmall: TextStyle(
        color: AppColors.snow,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.4,
      ),
      titleLarge: TextStyle(color: AppColors.snow, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
        color: AppColors.snow,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(color: AppColors.snow, height: 1.5),
      bodyMedium: TextStyle(color: AppColors.muted, height: 1.45),
      labelLarge: TextStyle(fontWeight: FontWeight.w700),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.panelHigh,
      hintStyle: const TextStyle(color: AppColors.muted),
      prefixIconColor: AppColors.muted,
      suffixIconColor: AppColors.muted,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.line),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.line),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.cyan, width: 1.4),
      ),
    ),
    chipTheme: ChipThemeData(
      side: const BorderSide(color: AppColors.line),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      backgroundColor: AppColors.panel,
      selectedColor: AppColors.violet.withValues(alpha: 0.22),
      labelStyle: const TextStyle(color: AppColors.snow),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: AppColors.panel,
      indicatorColor: Color(0x338B5CF6),
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
      ),
      height: 70,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.snow,
      contentTextStyle: const TextStyle(color: AppColors.ink),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
