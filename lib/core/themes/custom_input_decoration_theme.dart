import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomInputDecorationTheme {
  static InputDecorationTheme getTheme(BuildContext context) {
    return InputDecorationTheme(
      hoverColor: Colors.transparent,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: CustomColors.textFieldBackgroundColor,
      alignLabelWithHint: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(context.setRadius(20)),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: CustomColors.mainGreenColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(context.setRadius(20)),
        ),
      ),
    );
  }
}
