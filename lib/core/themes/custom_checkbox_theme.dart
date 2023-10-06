import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTheme {
  static CheckboxThemeData getTheme(BuildContext context) {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return CustomColors.mainGreenColor;
          }
          return null;
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.setRadius(5)),
      ),
    );
  }
}
