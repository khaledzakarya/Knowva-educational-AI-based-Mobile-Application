import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  // App basic Colors
  static const Color primaryColor = Color(0xFFFFAA19);
  static const Color secondaryColor = Color(0xFF3BA8D1);

  static const Color darkOrange = Color(0xFFF69D3F);

  //Gradient Colors
  static const Gradient orangeGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [Color(0xffF68B3F), Color(0xffF6C63F)],
  );

  static const Gradient blueGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [Color(0xff1A73BD), Color.fromRGBO(90, 219, 228, 1)],
  );

  static LinearGradient customGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [0.0, 0.5, 0.8],
      colors: [color.shade800, color.shade500, color.shade300],
    );
  }

  static LinearGradient customGradient2(Color color) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.5, 0.9],
      colors: [color, white],
    );
  }

  static SweepGradient customSweepGradient(MaterialColor color) {
    return SweepGradient(
      startAngle: 0.0,
      endAngle: 3.14 * 2, // Full circle
      tileMode: TileMode.clamp,
      colors: [
        color.shade900,
        color.shade700,
        color.shade500,
        color.shade300,
        color.shade100, // Fades out smoothly
      ],
      stops: const [0.2, 0.5, 0.7, 0.9, 1.0], // Controls smoothness
    );
  }

  static const Color textPrimary = Color(0xFF4B4C4D);
  static Color textSecondary = Color(0xFF4B4C4D).withValues(alpha: 0.8);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFFFFDFB);
  static const Color dark = Color(0xFF4B4C4D);
  static const Color darker = Color(0xFF535455);

  //Background container Colors
  static const Color lightContainer = Color(0xFFFFFFFF);
  static const Color darkContainer = Color(0xff3F4041);

  //Background container Colors
  static const Color lightNav = Color(0xFF263238);
  static const Color darkNav = Color(0xff232424);

  // Button Colors
  static const Color primaryButton = MyColors.primaryColor;
  static const Color secondaryButton = Color(0xff6c757d);
  static const Color disabledButton = Color.fromARGB(255, 40, 32, 32);

  //Question  Colors
  static const Color correct = Color(0xFF10B880);
  static const Color correctContainer = Color(0xffDCFDE8);

  static const Color wrong = Color(0xFFFF0000);
  static  Color wrongContainer = Color(0xFFFF0000).withValues(alpha: 0.15);

  //Error Colors
  static const Color error = Color(0xFFDC3545);
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF17A2B8);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
