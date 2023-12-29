import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'onboarding_data.dart';
import '../authentication_options_view/authentication_options_view.dart';
import 'widgets/onboarding_single_view.dart';
import 'widgets/onboarding_view_dots.dart';

class OnboardingView extends HookWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPageIndex = useState(0);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              onPageChanged: (int pageIndex) {
                currentPageIndex.value = pageIndex;
              },
              itemCount: onboardingViewsData.length + 1,
              itemBuilder: (context, index) {
                if (index == 3) {
                  return const AuthenticationOptionsView();
                }
                return OnboardingSingleView(
                  onboardingData: onboardingViewsData[index],
                  subTitleSpacing: getSpecificOnboardingViewSize(
                    context: context,
                    viewIndex: index,
                  ).subtitleSpacing,
                  imageHeight: getSpecificOnboardingViewSize(
                    context: context,
                    viewIndex: index,
                  ).imageHeight,
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.setHeight(122)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: OnboardingViewDots(
                  currentPageIndex: currentPageIndex.value,
                ),
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
            subtitleSpacing: context.setHeight(130),
            imageHeight: context.setHeight(225),
          ),
        1 => (
            subtitleSpacing: context.setHeight(95),
            imageHeight: context.setHeight(244),
          ),
        2 => (
            subtitleSpacing: context.setHeight(76),
            imageHeight: context.setHeight(278),
          ),
        _ => (
            subtitleSpacing: 0,
            imageHeight: 0,
          ),
      };
}
