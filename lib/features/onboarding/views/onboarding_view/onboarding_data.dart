import 'package:flutter/material.dart';

import '../../../../core/constants/assets_constants.dart';

@immutable
class OnboardingData {
  const OnboardingData({
    required this.title,
    required this.subTitle,
    required this.imageURL,
  });
  final String title;
  final String subTitle;
  final String imageURL;
}

const List<OnboardingData> onboardingViewsData = [
  OnboardingData(
    title: "Public Domain Books",
    subTitle: "No exclusive intellectual property rights apply.",
    imageURL: AssetsConstants.bibliophileImage,
  ),
  OnboardingData(
    title: "Completely Free App",
    subTitle: "Enjoy all tastes of books for free.",
    imageURL: AssetsConstants.businessShopImage,
  ),
  OnboardingData(
    title: "Favorite Books",
    subTitle: "Save your favorite books for easier access.",
    imageURL: AssetsConstants.collectingImage,
  ),
];
