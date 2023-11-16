import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

import '../../../../core/widgets/secondary_button.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.setWidth(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.setHeight(33)),
              Text(
                "Favorites",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: context.setHeight(20)),
              SizedBox(
                height: context.setHeight(175),
                child: Row(
                  children: [
                    Container(
                      height: context.setHeight(175),
                      width: context.setHeight(115.94),
                      color: Colors.blue,
                    ),
                    SizedBox(width: context.setWidth(10.06)),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                          top: context.setHeight(13),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The Heart of Hell',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: context.setSp(20),
                                    color: CustomColors.textColorAlmostBlack
                                        .withOpacity(0.75),
                                  ),
                            ),
                            SizedBox(height: context.setHeight(5)),
                            Text(
                              'Mitch Weiss',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SizedBox(height: context.setHeight(14.63)),
                            RatingBarIndicator(
                              rating: 4,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: CustomColors.mainGreenColor,
                              ),
                              unratedColor: CustomColors.textColorAlmostBlack
                                  .withOpacity(0.25),
                              itemCount: 5,
                              itemSize: context.setHeight(10),
                            ),
                            SizedBox(height: context.setHeight(9.95)),
                            Text(
                              'The untold story of courage and sacrifice in the shadow of Iwo Jima.',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: context.setSp(10),
                                    height: 1.4,
                                  ),
                            ),
                            SizedBox(height: context.setHeight(20)),
                            Container(
                              color: Colors.amber,
                              height: context.setHeight(30),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SecondaryButtoon(
                                    width: context.setWidth(100),
                                    buttonText: 'Read',
                                    onPressed: () {},
                                  ),
                                  SizedBox(width: context.setWidth(10)),
                                  Container(
                                    height: context.setHeight(38),
                                    width: context.setHeight(38),
                                    color: Colors.white,
                                    child: LikeButton(
                                      padding: EdgeInsets.zero,
                                      likeCountPadding: EdgeInsets.zero,
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.favorite,
                                          color: isLiked
                                              ? const Color(0xFFF44336)
                                              : CustomColors
                                                  .textColorAlmostBlack
                                                  .withOpacity(0.25),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> addBookToFavorite() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return true;
  }
}
