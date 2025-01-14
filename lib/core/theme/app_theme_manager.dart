import 'dart:convert';

import 'package:evently_app_c13_sat_7pm/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.white,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: "Inter",
      ),
    ),
  );
}
