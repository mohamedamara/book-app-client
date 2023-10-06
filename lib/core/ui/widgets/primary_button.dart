import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class PrimaryButtoon extends StatelessWidget {
  const PrimaryButtoon({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            Size(double.infinity, context.setHeight(56)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).primaryColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.setRadius(20)),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
