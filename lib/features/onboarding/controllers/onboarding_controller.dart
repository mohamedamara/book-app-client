import 'package:books_app_client/features/onboarding/states/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingControllerProvider =
    StateNotifierProvider.autoDispose<OnboardingController, OnboardingState>(
        (ref) {
  return OnboardingController(
    OnboardingState(
      pageController: PageController(),
    ),
  );
});

class OnboardingController extends StateNotifier<OnboardingState> {
  OnboardingController(OnboardingState state) : super(state);

  void updatePageIndex(int index) {
    state = state.copyWith(currentPageIndex: index);
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
