import 'package:flutter/material.dart';
import 'dart:math';

extension SizeConfigExtension on BuildContext {
  static const Size _designSize = Size(375, 812);

  double get _screenWidth => MediaQuery.of(this).size.width;
  double get _screenHeight => MediaQuery.of(this).size.height;

  double get _scaleWidth => _screenWidth / _designSize.width;
  double get _scaleHeight => _screenHeight / _designSize.height;
  double get _scaleText => min(_scaleWidth, _scaleHeight);

  double setWidth(double width) => width * _scaleWidth;
  double setWidthFraction(double fraction) => fraction * _screenWidth;
  double setHeight(double height) => height * _scaleHeight;
  double setHeightFraction(double fraction) => fraction * _screenHeight;
  double setSp(double fontSize) => fontSize * _scaleText;
  double setRadius(double radius) => radius * _scaleText;
}
