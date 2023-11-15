import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/themes/custom_colors.dart';
import '../../../domain/review/review.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReadMoreText(
                      review.reviewContent,
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: 'Read Less',
                      moreStyle: Theme.of(context).textTheme.bodySmall,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            height: 1.4,
                            color: CustomColors.textColorAlmostBlack
                                .withOpacity(0.75),
                          ),
                      lessStyle: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: context.setHeight(10),
                    ),
                    RatingBarIndicator(
                      rating: review.reviewRating.toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: CustomColors.mainGreenColor,
                      ),
                      unratedColor:
                          CustomColors.textColorAlmostBlack.withOpacity(0.5),
                      itemCount: 5,
                      itemSize: context.setHeight(14),
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
                    imageUrl: review.createdFor.coverImageURL,
                    height: context.setHeight(100),
                    width: context.setHeight(62.5),
                    fit: BoxFit.fitHeight,
                    placeholder: (_, __) => const SizedBox(),
                  ),
                ),
              ),
            ),
            SizedBox(width: context.setWidth(20)),
          ],
        ),
      ),
    );
  }
}
