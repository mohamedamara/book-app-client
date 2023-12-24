import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme getTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.copyWith(
      titleLarge: theme.textTheme.titleLarge?.copyWith(
        color: CustomColors.mainGreenColor,
        fontSize: context.setSp(36),
        fontWeight: FontWeight.w500,
      ),
      titleMedium: theme.textTheme.titleMedium?.copyWith(
        color: CustomColors.mainGreenColor,
        fontSize: context.setSp(30),
        fontWeight: FontWeight.w500,
      ),
      titleSmall: theme.textTheme.titleSmall?.copyWith(
        color: CustomColors.mainGreenColor.withOpacity(0.75),
        fontSize: context.setSp(14),
        fontWeight: FontWeight.w300,
      ),
      labelLarge: theme.textTheme.labelLarge?.copyWith(
        color: Colors.white,
        fontSize: context.setSp(15),
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: theme.textTheme.bodyLarge?.copyWith(
        color: CustomColors.textColorAlmostBlack,
        fontSize: context.setSp(24),
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: theme.textTheme.bodyLarge?.copyWith(
        color: CustomColors.textColorAlmostBlack,
        fontSize: context.setSp(16),
        fontWeight: FontWeight.w600,
      ),
      bodySmall: theme.textTheme.bodySmall?.copyWith(
        color: CustomColors.textColorAlmostBlack.withOpacity(0.5),
        fontSize: context.setSp(12),
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
