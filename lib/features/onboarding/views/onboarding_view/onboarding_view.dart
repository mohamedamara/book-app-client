import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/features/onboarding/controllers/onboarding_controller.dart';
import 'package:books_app_client/features/onboarding/views/authentication_options_view/authentication_options_view.dart';
import 'package:books_app_client/features/onboarding/views/onboarding_view/widgets/onboarding_single_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/onboarding_view_dots.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var onboardingState = ref.watch(onboardingControllerProvider);
    var onboardingController = ref.read(onboardingControllerProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: onboardingState.pageController,
              onPageChanged: onboardingController.updatePageIndex,
              children: [
                for (int i = 0;
                    i < onboardingState.onboardingViewsData.length;
                    i++)
                  OnboardingSingleView(
                    onboardingData: onboardingState.onboardingViewsData[i],
                    subTitleSpacing: getSpecificOnboardingViewSize(
                      context: context,
                      viewIndex: i,
                    ).subtitleSpacing,
                    imageHeight: getSpecificOnboardingViewSize(
                      context: context,
                      viewIndex: i,
                    ).imageHeight,
                  ),
                const AuthenticationOptionsView(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.setHeight(122)),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: OnboardingViewDots(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ({double subtitleSpacing, double imageHeight}) getSpecificOnboardingViewSize({
    required BuildContext context,
    required int viewIndex,
  }) =>
      switch (viewIndex) {
        0 => (
            subtitleSpacing: context.setHeight(110),
            imageHeight: context.setHeight(225),
          ),
        1 => (
            subtitleSpacing: context.setHeight(75),
            imageHeight: context.setHeight(244),
          ),
        2 => (
            subtitleSpacing: context.setHeight(56),
            imageHeight: context.setHeight(278),
          ),
        _ => (
            subtitleSpacing: 0,
            imageHeight: 0,
          ),
      };
}
