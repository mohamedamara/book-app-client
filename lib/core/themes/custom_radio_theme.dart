import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomRadioTheme {
  static RadioThemeData getTheme(BuildContext context) {
    return RadioThemeData(
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
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
