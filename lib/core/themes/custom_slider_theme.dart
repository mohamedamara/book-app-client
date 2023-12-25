import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomSliderTheme {
  static SliderThemeData getTheme(BuildContext context) {
    return SliderThemeData(
      activeTrackColor: CustomColors
          .inAppReadingSettingsModalBottomSheetSliderActiveTrackColor,
      inactiveTrackColor: CustomColors
          .inAppReadingSettingsModalBottomSheetSliderinactiveTrackColor,
      trackHeight: context.setHeight(2),
      thumbColor: Colors.white,
      thumbShape: const RoundSliderThumbShape(elevation: 6),
      trackShape: const RectangularSliderTrackShape(),
    );
  }
}
