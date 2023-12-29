import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/features/onboarding/views/onboarding_view/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingSingleView extends StatelessWidget {
  const OnboardingSingleView({
    super.key,
    required this.onboardingData,
    required this.subTitleSpacing,
    required this.imageHeight,
  });

  final OnboardingData onboardingData;
  final double subTitleSpacing;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
      child: Column(
        children: [
          SizedBox(height: context.setHeight(78)),
          Text(
            onboardingData.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          )
              .animate()
              .fadeIn(
                duration: 800.milliseconds,
              )
              .slideY(
                begin: -1,
                end: 0,
                curve: Curves.easeInOut,
                duration: 800.milliseconds,
              ),
          SizedBox(height: context.setHeight(6)),
          Text(
            onboardingData.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          )
              .animate()
              .fadeIn(
                duration: 800.milliseconds,
              )
              .slideY(
                begin: -3,
                end: 0,
                curve: Curves.easeInOut,
                duration: 800.milliseconds,
              ),
          SizedBox(height: subTitleSpacing),
          Image.asset(
            onboardingData.imageURL,
            height: imageHeight,
          ),
        ],
      ),
    );
  }
}
