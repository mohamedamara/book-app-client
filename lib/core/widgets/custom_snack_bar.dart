import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String message,
}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.red.withOpacity(0.72),
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
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
