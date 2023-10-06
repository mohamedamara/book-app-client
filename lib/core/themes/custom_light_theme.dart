import 'package:books_app_client/core/themes/custom_checkbox_theme.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:books_app_client/core/themes/custom_input_decoration_theme.dart';
import 'package:books_app_client/core/themes/custom_page_transitions_theme.dart';
import 'package:books_app_client/core/themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

class CustomLightTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: CustomColors.mainGreenColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: CustomColors.mainGreenColor,
        ),
        scrolledUnderElevation: 0,
      ),
      scaffoldBackgroundColor: Colors.white,
      pageTransitionsTheme: CustomPageTransitionsTheme.getTheme(),
      textTheme: CustomTextTheme.getTheme(context),
      iconTheme: const IconThemeData(
        color: CustomColors.mainGreenColor,
      ),
      inputDecorationTheme: CustomInputDecorationTheme.getTheme(context),
      checkboxTheme: CustomCheckBoxTheme.getTheme(context),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: CustomColors.mainGreenColor,
        cursorColor: CustomColors.mainGreenColor,
        selectionColor: CustomColors.textFieldSelectionColor,
      ),
    );
  }
}
