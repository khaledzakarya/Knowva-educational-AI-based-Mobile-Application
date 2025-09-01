import 'package:flutter/material.dart';
import 'package:knowva/core/theme/custom_themes/appbar_theme.dart';
import 'package:knowva/core/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:knowva/core/theme/custom_themes/checkbox_theme.dart';
import 'package:knowva/core/theme/custom_themes/chip_theme.dart';
import 'package:knowva/core/theme/custom_themes/elevation_button_theme.dart';
import 'package:knowva/core/theme/custom_themes/outlined_buttom_theme.dart';
import 'package:knowva/core/theme/custom_themes/text_field_theme.dart';
import 'package:knowva/core/utils/my_colors.dart';

class MyAppTheme {
  MyAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: MyColors.primaryColor,
    chipTheme: MyChipTheme.lightChipTheme,
    scaffoldBackgroundColor: MyColors.light,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: MyTextFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: MyElevationButtonTheme.lightelevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: MyColors.primaryColor,
    chipTheme: MyChipTheme.darkChipTheme,
    scaffoldBackgroundColor: MyColors.dark,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: MyTextFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: MyElevationButtonTheme.darkElevatedButtonTheme,
  );
}
