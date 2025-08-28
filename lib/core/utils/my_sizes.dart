import 'package:flutter/material.dart';

class MySizes {
  static late double screenWidth;
  static late double screenHeight;

  /// Initialize with context
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  /// ---------- HEADLINES ----------
  static double get headlineLarge => screenWidth * 0.08; // ~32px @ 400px width
  static double get headlineMedium => screenWidth * 0.065; // ~26px
  static double get headlineSmall => screenWidth * 0.05; // ~22px

  /// ---------- TITLES ----------
  static double get titleLarge => screenWidth * 0.05; // ~20px
  static double get titleMedium => screenWidth * 0.045; // ~18px
  static double get titleSmall => screenWidth * 0.04; // ~16px

  /// ---------- BODY ----------
  static double get bodyLarge => screenWidth * 0.045; // ~18px
  static double get bodyMedium => screenWidth * 0.04; // ~16px
  static double get bodySmall => screenWidth * 0.035; // ~14px

  /// ---------- LABELS ----------
  static double get labelLarge => screenWidth * 0.04; // ~16px
  static double get labelMedium => screenWidth * 0.035; // ~14px
  static double get labelSmall => screenWidth * 0.03; // ~12px

  /// ---------- ICONS ----------
  static double get iconLarge =>
      screenWidth * 0.12; // Big icons (profile pics, hero icons)
  static double get iconMedium => screenWidth * 0.065; // Default icons
  static double get iconSmall => screenWidth * 0.045; // Tiny icons

  /// ---------- IMAGES ----------
  static double get imageWidthXLarge => screenWidth * 0.9;
  static double get imageWidthLarge => screenWidth * 0.6;
  static double get imageWidthMedium => screenWidth * 0.4;
  static double get imageWidthSmall => screenWidth * 0.2;

  static double get imageHeightXLarge => screenHeight * 0.6;
  static double get imageHeightLarge => screenHeight * 0.4;
  static double get imageHeightMedium => screenHeight * 0.25;
  static double get imageHeightSmall => screenHeight * 0.15;

  /// ---------- SPACING ----------
  static double get spaceXs => screenWidth * 0.02;
  static double get spaceSm => screenWidth * 0.04;
  static double get spaceMd => screenWidth * 0.06;
  static double get spaceLg => screenWidth * 0.08;
  static double get spaceXl => screenWidth * 0.1;

  /// ---------- Small Spacing ----------
  static double get smallSpaceXs => screenWidth * 0.002;
  static double get smallSpaceSm => screenWidth * 0.003;
  static double get smallSpaceMd => screenWidth * 0.004;
  static double get smallSpaceLg => screenWidth * 0.005;
  static double get smallSpaceXl => screenWidth * 0.01;

  /// ---------- PADDING ----------
  static double get paddingXs => screenWidth * 0.015;
  static double get paddingSm => screenWidth * 0.03;
  static double get paddingMd => screenWidth * 0.045;
  static double get paddingLg => screenWidth * 0.07;
  static double get paddingXl => screenWidth * 0.09;

  /// ---------- BORDER RADIUS ----------
  static double get borderRadiusXs => screenHeight * 0.015;
  static double get borderRadiusSm => screenHeight * 0.02;
  static double get borderRadiusMd => screenHeight * 0.035;
  static double get borderRadiusLg => screenHeight * 0.05;

  /// ---------- Border Width ----------
  static double get borderWidthXs => screenHeight * 0.0015;
  static double get borderWidthSm => screenHeight * 0.004;
  static double get borderWidthMd => screenHeight * 0.005;
  static double get borderWidthLg => screenHeight * 0.007;

  /// ---------- COMPONENTS ----------
  static double get buttonHeightXs => screenHeight * 0.04;
  static double get buttonHeightSm => screenHeight * 0.05;
  static double get buttonHeightMd => screenHeight * 0.06;
  static double get buttonHeightLg => screenHeight * 0.07;

  static double get buttonWidthXs => screenWidth * 0.2;
  static double get buttonWidthSm => screenWidth * 0.25;
  static double get buttonWidthMd => screenWidth * 0.3;
  static double get buttonWidthLg => screenWidth * 0.4;

  static double get borderRadius => screenWidth * 0.04;
}
