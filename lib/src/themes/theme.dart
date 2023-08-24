import 'package:classmate/src/themes/elevated_button_theme.dart';
import 'package:classmate/src/themes/outlined_button_theme.dart';
import 'package:classmate/src/themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:classmate/src/themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    //appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    //appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
