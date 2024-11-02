import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class KnowunityFonts {
  const KnowunityFonts._();

  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: KnowunityColors.darkerText,
      height: 0.5,
    ),
    displayMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      color: KnowunityColors.darkerText,
    ),
    displaySmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: KnowunityColors.darkerText,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: KnowunityColors.darkerText,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: KnowunityColors.darkerText,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: KnowunityColors.darkerText,
    ),
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: KnowunityColors.darkerText,
      fontSize: 20,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: KnowunityColors.darkerText,
      fontSize: 16,
    ),
    titleSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: KnowunityColors.darkText,
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: KnowunityColors.darkText,
    ),
    labelMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: KnowunityColors.darkText,
    ),
    labelSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: KnowunityColors.lightText,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: KnowunityColors.darkText,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: KnowunityColors.darkerText,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodySmall: GoogleFonts.poppins(
      color: KnowunityColors.lightText,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
