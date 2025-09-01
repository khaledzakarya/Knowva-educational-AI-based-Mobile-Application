import 'package:flutter/material.dart';

class MySizes {
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleFactor;

  /// Initialize with context
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    // Aspect ratio: width / height
    double aspectRatio = screenWidth / screenHeight;

    // If the screen is "almost square" , reduce sizes slightly
    scaleFactor = aspectRatio < 1.2 ? 0.8 : 1.0; // 0.8 = reduce 20%
  }

  /// ---------- HEADLINES ----------
  static double get headlineLarge => screenWidth * 0.08 * scaleFactor;
  static double get headlineMedium => screenWidth * 0.065 * scaleFactor;
  static double get headlineSmall => screenWidth * 0.05 * scaleFactor;

  /// ---------- TITLES ----------
  static double get titleLarge => screenWidth * 0.05 * scaleFactor;
  static double get titleMedium => screenWidth * 0.045 * scaleFactor;
  static double get titleSmall => screenWidth * 0.04 * scaleFactor;

  /// ---------- BODY ----------
  static double get bodyLarge => screenWidth * 0.045 * scaleFactor;
  static double get bodyMedium => screenWidth * 0.04 * scaleFactor;
  static double get bodySmall => screenWidth * 0.035 * scaleFactor;

  /// ---------- LABELS ----------
  static double get labelLarge => screenWidth * 0.04 * scaleFactor;
  static double get labelMedium => screenWidth * 0.035 * scaleFactor;
  static double get labelSmall => screenWidth * 0.03 * scaleFactor;

  /// ---------- ICONS ----------
  static double get iconLarge => screenWidth * 0.12 * scaleFactor;
  static double get iconMedium => screenWidth * 0.065 * scaleFactor;
  static double get iconSmall => screenWidth * 0.045 * scaleFactor;

  /// ---------- IMAGES ----------
  static double get imageWidthXXLarge => screenWidth * 0.9 * scaleFactor;
  static double get imageWidthXLarge => screenHeight * 0.8 * scaleFactor;
  static double get imageWidthLarge => screenWidth * 0.6 * scaleFactor;
  static double get imageWidthMedium => screenWidth * 0.4 * scaleFactor;
  static double get imageWidthSmall => screenWidth * 0.2 * scaleFactor;

  static double get imageHeightXXLarge => screenHeight * 0.6 * scaleFactor;
  static double get imageHeightXLarge => screenHeight * 0.5 * scaleFactor;
  static double get imageHeightLarge => screenHeight * 0.4 * scaleFactor;
  static double get imageHeightMedium => screenHeight * 0.25 * scaleFactor;
  static double get imageHeightSmall => screenHeight * 0.15 * scaleFactor;

  /// ---------- SPACING ----------
  static double get spaceXs => screenWidth * 0.02 * scaleFactor;
  static double get spaceSm => screenWidth * 0.04 * scaleFactor;
  static double get spaceMd => screenWidth * 0.06 * scaleFactor;
  static double get spaceLg => screenWidth * 0.08 * scaleFactor;
  static double get spaceXl => screenWidth * 0.15 * scaleFactor;

  /// ---------- SMALL SPACING ----------
  static double get smallSpaceXs => screenWidth * 0.002 * scaleFactor;
  static double get smallSpaceSm => screenWidth * 0.003 * scaleFactor;
  static double get smallSpaceMd => screenWidth * 0.004 * scaleFactor;
  static double get smallSpaceLg => screenWidth * 0.005 * scaleFactor;
  static double get smallSpaceXl => screenWidth * 0.01 * scaleFactor;

  /// ---------- PADDING ----------
  static double get paddingXs => screenWidth * 0.015 * scaleFactor;
  static double get paddingSm => screenWidth * 0.03 * scaleFactor;
  static double get paddingMd => screenWidth * 0.045 * scaleFactor;
  static double get paddingLg => screenWidth * 0.07 * scaleFactor;
  static double get paddingXl => screenWidth * 0.09 * scaleFactor;

  /// ---------- BORDER RADIUS ----------
  static double get borderRadiusXs => screenHeight * 0.015 * scaleFactor;
  static double get borderRadiusSm => screenHeight * 0.02 * scaleFactor;
  static double get borderRadiusMd => screenHeight * 0.035 * scaleFactor;
  static double get borderRadius => screenWidth * 0.04 * scaleFactor;
  static double get borderRadiusLg => screenHeight * 0.05 * scaleFactor;

  /// ---------- BORDER WIDTH ----------
  static double get borderWidthXs => screenHeight * 0.0015 * scaleFactor;
  static double get borderWidthSm => screenHeight * 0.004 * scaleFactor;
  static double get borderWidthMd => screenHeight * 0.005 * scaleFactor;
  static double get borderWidthLg => screenHeight * 0.007 * scaleFactor;

  /// ---------- COMPONENTS ----------
  static double get buttonHeightXs => screenHeight * 0.04 * scaleFactor;
  static double get buttonHeightSm => screenHeight * 0.05 * scaleFactor;
  static double get buttonHeightMd => screenHeight * 0.06 * scaleFactor;
  static double get buttonHeightLg => screenHeight * 0.07 * scaleFactor;

  static double get buttonWidthXs => screenWidth * 0.2 * scaleFactor;
  static double get buttonWidthSm => screenWidth * 0.25 * scaleFactor;
  static double get buttonWidthMd => screenWidth * 0.3 * scaleFactor;
  static double get buttonWidthLg => screenWidth * 0.4 * scaleFactor;

  /// ---------- APPBAR HEIGHT ----------
  static double get appBarHeight => screenHeight * 0.09 * scaleFactor;
}

