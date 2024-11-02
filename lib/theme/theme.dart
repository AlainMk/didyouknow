import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

/// The principle base theme of bof client and business app
class KnowunityTheme {
  /// Light default theme color scheme
  static ThemeData light() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: KnowunityColors.primary,
        secondary: KnowunityColors.secondary,
        error: KnowunityColors.red,
        surface: KnowunityColors.white,
      ),
      primaryColor: KnowunityColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: KnowunityColors.white,
        elevation: 0,
        foregroundColor: KnowunityColors.darkerText,
        iconTheme: IconThemeData(color: KnowunityColors.darkText),
      ),
      scaffoldBackgroundColor: KnowunityColors.white,
      textTheme: KnowunityFonts.textTheme,
      useMaterial3: false,
    );
  }
}
