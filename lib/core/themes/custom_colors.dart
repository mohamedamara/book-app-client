import 'package:flutter/material.dart';

class CustomColors {
  static const Color mainGreenColor = Color(0xFF5ABD8C);
  static const Color textColorAlmostBlack = Color(0xFF212121);
  static Color textFieldBackgroundColor =
      const Color(0xFFEFEFEF).withOpacity(0.4);
  static const Color textFieldSelectionColor = Color(0XFF00FF81);
  static const Color reviewCardBackgroundColor = Color(0XFFF9F9F9);
  static const Color drawerBackgroundColor = Color(0XFFF3F3F3);
  static const LinearGradient secondaryButtonGradientColors = LinearGradient(
    colors: [
      Color(0xFF5ABD8C),
      Color(0xFF00FF81),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
