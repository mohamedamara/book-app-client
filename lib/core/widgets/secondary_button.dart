import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class SecondaryButtoon extends StatelessWidget {
  const SecondaryButtoon({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.width = double.infinity,
  });

  final String buttonText;
  final VoidCallback? onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.setHeight(38),
      width: width,
      decoration: BoxDecoration(
        gradient: CustomColors.secondaryButtonGradientColors,
        borderRadius: BorderRadius.circular(
          context.setRadius(10),
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
          shadowColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                context.setRadius(10),
              ),
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
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
