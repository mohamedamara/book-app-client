import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingSingleView extends StatelessWidget {
  const OnboardingSingleView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.subTitleSpacing,
    required this.imageURL,
    required this.imageHeight,
  });

  final String title;
  final String subTitle;
  final double subTitleSpacing;
  final String imageURL;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
      child: Column(
        children: [
          SizedBox(height: context.setHeight(78)),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          )
              .animate()
              .fadeIn(
                duration: const Duration(milliseconds: 800),
              )
              .slideY(
                begin: -1,
                end: 0,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 800),
              ),
          SizedBox(height: context.setHeight(16)),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          )
              .animate()
              .fadeIn(
                duration: const Duration(milliseconds: 800),
              )
              .slideY(
                begin: -3,
                end: 0,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 800),
              ),
          SizedBox(height: subTitleSpacing),
          Image.asset(
            imageURL,
            height: imageHeight,
          ),
        ],
      ),
    );
  }
}
