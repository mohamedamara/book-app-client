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
    title: "Discounted \nSecondhand Books",
    subTitle: "Used and near new secondhand books at great prices.",
    imageURL: AssetsConstants.bibliophileImage,
  ),
  OnboardingData(
    title: "20 Book Grocers \nNationally",
    subTitle: "We've successfully opened 20 stores across Australia.",
    imageURL: AssetsConstants.businessShopImage,
  ),
  OnboardingData(
    title: "Sell or Recycle Your \nOld Books With Us",
    subTitle:
        "If you're looking to downsize, sell or recycle old books, the Book Grocer can help.",
    imageURL: AssetsConstants.collectingImage,
  ),
];
