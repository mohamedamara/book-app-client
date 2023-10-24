import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
  BuildContext context,
  FToast fToast,
  String message, {
  ToastGravity? gravity = ToastGravity.BOTTOM,
  Duration toastDuration = const Duration(milliseconds: 1500),
}) {
  fToast.init(context);
  fToast.removeCustomToast();
  Widget toast = Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      horizontal: context.setWidth(30),
      vertical: context.setHeight(15),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(context.setRadius(16)),
      color: Colors.red.withOpacity(0.72),
    ),
    child: Stack(
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
  fToast.showToast(
    child: toast,
    gravity: gravity,
    toastDuration: toastDuration,
  );
}
