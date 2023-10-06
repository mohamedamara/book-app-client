import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme getTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.primaryTextTheme.copyWith(
      titleLarge: theme.primaryTextTheme.titleLarge?.copyWith(
        color: CustomColors.mainGreenColor,
        fontSize: context.setSp(36),
        fontWeight: FontWeight.w500,
      ),
      titleMedium: theme.primaryTextTheme.titleMedium?.copyWith(
        color: CustomColors.mainGreenColor,
        fontSize: context.setSp(30),
        fontWeight: FontWeight.w500,
      ),
      titleSmall: theme.primaryTextTheme.titleSmall?.copyWith(
        color: CustomColors.mainGreenColor.withOpacity(0.75),
        fontSize: context.setSp(14),
        fontWeight: FontWeight.w300,
      ),
      labelLarge: theme.primaryTextTheme.labelLarge?.copyWith(
        color: Colors.white,
        fontSize: context.setSp(15),
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: theme.primaryTextTheme.bodyLarge?.copyWith(
        color: CustomColors.textColorAlmostBlack,
        fontSize: context.setSp(24),
        fontWeight: FontWeight.bold,
      ),
      bodySmall: theme.primaryTextTheme.bodySmall?.copyWith(
        color: CustomColors.textColorAlmostBlack.withOpacity(0.5),
        fontSize: context.setSp(12),
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
