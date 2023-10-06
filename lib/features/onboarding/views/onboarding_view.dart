import 'package:books_app_client/core/constants/assets_constants.dart';
import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:books_app_client/features/onboarding/views/authentication_options_view.dart';
import 'package:books_app_client/features/onboarding/views/onboarding_single_view.dart';
import 'package:flutter/material.dart';

import 'widgets/onboarding_view_dot_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                OnboardingSingleView(
                  title: "Discounted \nSecondhand Books",
                  subTitle:
                      "Used and near new secondhand books at great prices.",
                  subTitleSpacing: context.setHeight(110),
                  imageURL: AssetsConstants.bibliophileImage,
                  imageHeight: context.setHeight(225),
                ),
                OnboardingSingleView(
                  title: "20 Book Grocers \nNationally",
                  subTitle:
                      "We've successfully opened 20 stores across Australia.",
                  subTitleSpacing: context.setHeight(75),
                  imageURL: AssetsConstants.businessShopImage,
                  imageHeight: context.setHeight(244),
                ),
                OnboardingSingleView(
                  title: "Sell or Recycle Your \nOld Books With Us",
                  subTitle:
                      "If you're looking to downsize, sell or recycle old books, the Book Grocer can help.",
                  subTitleSpacing: context.setHeight(56),
                  imageURL: AssetsConstants.collectingImage,
                  imageHeight: context.setHeight(278),
                ),
                const AuthenticationOptionsView(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.setHeight(122)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: buildOnboardingViewDotIndicators(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingViewDotIndicators() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < 4; i++)
          i == _currentPage
              ? const OnboardingViewDotIndicator(isActive: true)
              : const OnboardingViewDotIndicator(isActive: false)
      ],
    );
  }
}
