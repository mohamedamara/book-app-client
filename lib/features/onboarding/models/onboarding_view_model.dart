import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/assets_constants.dart';

part 'onboarding_view_model.freezed.dart';

@freezed
class OnboardingViewModel with _$OnboardingViewModel {
  const factory OnboardingViewModel({
    required String title,
    required String subTitle,
    required String imageURL,
  }) = _OnboardingViewModel;
}

const List<OnboardingViewModel> onboardingData = [
  OnboardingViewModel(
    title: "Discounted \nSecondhand Books",
    subTitle: "Used and near new secondhand books at great prices.",
    imageURL: AssetsConstants.bibliophileImage,
  ),
  OnboardingViewModel(
    title: "20 Book Grocers \nNationally",
    subTitle: "We've successfully opened 20 stores across Australia.",
    imageURL: AssetsConstants.businessShopImage,
  ),
  OnboardingViewModel(
    title: "Sell or Recycle Your \nOld Books With Us",
    subTitle:
        "If you're looking to downsize, sell or recycle old books, the Book Grocer can help.",
    imageURL: AssetsConstants.collectingImage,
  ),
];
