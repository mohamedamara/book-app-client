import 'package:flutter/material.dart';

import '../onboarding_data.dart';
import 'onboarding_view_single_dot.dart';

class OnboardingViewDots extends StatelessWidget {
  const OnboardingViewDots({super.key, required this.currentPageIndex});

  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < onboardingViewsData.length + 1; i++)
          i == currentPageIndex
              ? const OnboardingViewSingleDot(isActive: true)
              : const OnboardingViewSingleDot(isActive: false)
      ],
    );
  }
}
