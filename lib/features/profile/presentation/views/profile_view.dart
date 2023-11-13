import 'package:books_app_client/core/widgets/secondary_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:books_app_client/core/constants/assets_constants.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/themes/custom_colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(profileControllerProvider).when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, s) => Center(
              child: Text(e.toString()),
            ),
            data: (data) => SafeArea(
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
                              '${data.userInfo.firstName} ${data.userInfo.lastName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: CustomColors.textColorAlmostBlack
                                          .withOpacity(0.75),
                                      fontWeight: FontWeight.w600,
                                      fontSize: context.setSp(21)),
                            ),
                            SizedBox(height: context.setHeight(3)),
                            Text(
                              data.userInfo.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: context.setSp(11.5)),
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.setWidth(35),
                    ),
                    child: SecondaryButtoon(
                      width: context.setWidth(150),
                      buttonText: 'Edit profile',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: context.setHeight(30)),
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.setWidth(35),
                    ),
                    child: Text(
                      'Your reviews (${data.userReviews.length})',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: context.setSp(20),
                            color: CustomColors.textColorAlmostBlack
                                .withOpacity(0.5),
                          ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: context.setHeight(22),
                        horizontal: context.setWidth(34),
                      ),
                      itemCount: data.userReviews.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: context.setHeight(22));
                      },
                      itemBuilder: (context, index) {
                        var review = data.userReviews[index];
                        return Material(
                          borderRadius: BorderRadius.circular(
                            context.setRadius(20),
                          ),
                          color: CustomColors.reviewCardBackgroundColor,
                          elevation: 16,
                          child: SizedBox(
                            height: context.setHeight(120),
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: context.setWidth(20)),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReadMoreText(
                                          review.reviewContent,
                                          trimLines: 3,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'Read more',
                                          trimExpandedText: 'Read Less',
                                          moreStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                height: 1.4,
                                                color: CustomColors
                                                    .textColorAlmostBlack
                                                    .withOpacity(0.75),
                                              ),
                                          lessStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        SizedBox(
                                          height: context.setHeight(10),
                                        ),
                                        Container(
                                          color: Colors.green,
                                          height: 30,
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: context.setWidth(20)),
                                SizedBox(
                                  height: context.setHeight(100),
                                  width: context.setHeight(62.5),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        context.setRadius(10),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            review.createdFor.coverImageURL,
                                        height: context.setHeight(100),
                                        width: context.setHeight(62.5),
                                        fit: BoxFit.fitHeight,
                                        placeholder: (_, __) =>
                                            const SizedBox(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: context.setWidth(20)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
