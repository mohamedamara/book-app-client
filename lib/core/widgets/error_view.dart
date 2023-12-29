import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'primary_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.errorText,
    required this.buttonAction,
  });

  final String errorText;
  final VoidCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: context.setHeight(20)),
            PrimaryButtoon(
              buttonText: 'Try again',
              onPressed: buttonAction,
            ),
          ],
        ),
      ),
    );
  }
}
