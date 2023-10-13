import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PrimaryButtoon extends StatelessWidget {
  const PrimaryButtoon({
    super.key,
    required this.buttonText,
    this.isEnabled = true,
    required this.onPressed,
  });

  final String buttonText;
  final bool isEnabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton(
        key: Key(isEnabled.toString()),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            Size(double.infinity, context.setHeight(56)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            isEnabled
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
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
              color: isEnabled
                  ? Colors.transparent
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Center(
          child: Text(
            buttonText.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: isEnabled
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ),
    );
  }
}
