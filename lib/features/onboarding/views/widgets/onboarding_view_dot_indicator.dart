import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OnboardingViewDotIndicator extends StatelessWidget {
  const OnboardingViewDotIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.setHeight(8)),
      height: context.setHeight(14),
      width: context.setHeight(14),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColor.withOpacity(0.25),
      ),
    );
  }
}
