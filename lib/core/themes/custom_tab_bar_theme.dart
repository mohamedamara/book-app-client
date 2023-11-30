import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTabBarTheme {
  static TabBarTheme getTheme(BuildContext context) {
    return TabBarTheme(
      indicator: const BoxDecoration(),
      tabAlignment: TabAlignment.center,
      labelStyle: TextStyle(
        fontSize: context.setSp(14),
        fontWeight: FontWeight.w800,
        decoration: TextDecoration.underline,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: context.setSp(14),
        fontWeight: FontWeight.w400,
      ),
      labelColor: CustomColors.mainGreenColor,
      unselectedLabelColor: CustomColors.textColorAlmostBlack.withOpacity(0.5),
      labelPadding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
