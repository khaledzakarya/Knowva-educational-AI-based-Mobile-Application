import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowva/core/utils/my_colors.dart';

class MyTextTheme {
  MyTextTheme._();

  static TextTheme getLightTextTheme(Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';
    final font = isArabic ? GoogleFonts.balooBhai2 : GoogleFonts.roboto;

    return TextTheme(
      headlineLarge: font(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimary,
      ),
      headlineMedium: font(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimary,
      ),
      headlineSmall: font(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimary,
      ),
      titleLarge: font(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimary,
      ),
      titleMedium: font(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimary,
      ),
      titleSmall: font(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimary,
      ),
      bodyLarge: font(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondary,
      ),
      bodyMedium: font(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: MyColors.textSecondary,
      ),
      bodySmall: font(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondary.withValues(alpha: 0.5),
      ),
      labelLarge: font(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: MyColors.textPrimary,
      ),
      labelMedium: font(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: MyColors.textPrimary.withValues(alpha: 0.5),
      ),
      labelSmall: font(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: MyColors.textPrimary.withValues(alpha: 0.5),
      ),
    );
  }

  static TextTheme getDarkTextTheme(Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';
    final font = isArabic ? GoogleFonts.balooBhai2 : GoogleFonts.roboto;

    return TextTheme(
      headlineLarge: font(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: font(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineSmall: font(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      titleLarge: font(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleMedium: font(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      titleSmall: font(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyLarge: font(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
      bodyMedium: font(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ),
      bodySmall: font(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white70.withValues(alpha: 0.5),
      ),
      labelLarge: font(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ),
      labelMedium: font(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white70.withValues(alpha: 0.5),
      ),
      labelSmall: font(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white70.withValues(alpha: 0.5),
      ),
    );
  }
}
