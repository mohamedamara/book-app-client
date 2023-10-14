import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/onboarding_view_model.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    required PageController pageController,
    @Default(0) int currentPageIndex,
    @Default(onboardingData) List<OnboardingViewModel> onboardingViewsData,
  }) = _OnboardingState;
}
