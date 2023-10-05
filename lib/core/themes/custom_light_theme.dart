import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:books_app_client/core/themes/custom_page_transitions_theme.dart';
import 'package:flutter/material.dart';

class CustomLightTheme {
  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: CustomColors.mainGreenColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: Colors.white,
      pageTransitionsTheme: CustomPageTransitionsTheme.getTheme(),
    );
  }
}
