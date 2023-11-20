import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

enum SnackBarMessageType { success, failure }

showSnackBar({
  required BuildContext context,
  required String message,
  required SnackBarMessageType messageType,
}) {
  final snackBar = SnackBar(
    backgroundColor: messageType == SnackBarMessageType.success
        ? CustomColors.snackBarSuccessBackgroundColor
        : CustomColors.snackBarFailureBackgroundColor,
    duration: const Duration(milliseconds: 1500),
    content: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.info_outline,
            size: context.setHeight(24),
            color: Colors.white,
          ),
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.setSp(14),
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
