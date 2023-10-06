import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class PrimaryButtoon extends StatelessWidget {
  const PrimaryButtoon({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onPressed,
  });

  final String buttonText;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, context.setHeight(56)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              context.setRadius(20),
            ),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            width: context.setHeight(1),
            color: borderColor,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
