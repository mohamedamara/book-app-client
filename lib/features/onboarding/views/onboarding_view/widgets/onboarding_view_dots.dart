import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/onboarding_controller.dart';
import 'onboarding_view_single_dot.dart';

class OnboardingViewDots extends ConsumerWidget {
  const OnboardingViewDots({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var onboardingState = ref.watch(onboardingControllerProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < onboardingState.onboardingViewsData.length + 1; i++)
          i == onboardingState.currentPageIndex
              ? const OnboardingViewSingleDot(isActive: true)
              : const OnboardingViewSingleDot(isActive: false)
      ],
    );
  }
}
