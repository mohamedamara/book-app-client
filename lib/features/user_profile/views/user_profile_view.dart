import 'package:books_app_client/core/constants/assets_constants.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.setHeight(22)),
            Row(
              children: [
                SizedBox(width: context.setWidth(35)),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Will Newman',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: CustomColors.textColorAlmostBlack
                                  .withOpacity(0.75),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        'Constantly travelling and keeping up to date with business related books.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: context.setSp(10)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.setWidth(44)),
                Image.asset(
                  AssetsConstants.profileImage,
                  height: context.setHeight(84),
                ),
                SizedBox(width: context.setWidth(44)),
              ],
            ),
            SizedBox(height: context.setHeight(40)),
            Padding(
              padding: EdgeInsets.only(left: context.setWidth(35)),
              child: Text(
                'Your reviews (7)',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: context.setSp(20),
                      color: CustomColors.textColorAlmostBlack.withOpacity(0.5),
                    ),
              ),
            ),
            SizedBox(height: context.setHeight(22)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.setWidth(34),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(
                  context.setRadius(20),
                ),
                color: CustomColors.reviewCardBackgroundColor,
                elevation: 16,
                child: SizedBox(
                  height: context.setHeight(120),
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: context.setHeight(22)),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.setWidth(34),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(
                  context.setRadius(20),
                ),
                color: CustomColors.reviewCardBackgroundColor,
                elevation: 16,
                child: SizedBox(
                  height: context.setHeight(120),
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
