import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/themes/custom_colors.dart';
import '../../enums/rating.dart';

class RatingFilter extends StatelessWidget {
  const RatingFilter({
    super.key,
    required this.ratingValue,
    required this.onRatingRadioChanged,
  });

  final Rating ratingValue;
  final Function(Rating newRatingValue) onRatingRadioChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Average Customer Review',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: CustomColors.textColorAlmostBlack.withOpacity(0.25),
              ),
        ),
        RadioListTile<Rating>(
          title: RatingBarIndicator(
            rating: 5,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: CustomColors.mainGreenColor,
            ),
            unratedColor: CustomColors.textColorAlmostBlack.withOpacity(0.2),
            itemCount: 5,
            itemSize: context.setHeight(14),
          ),
          value: Rating.fiveStars,
          groupValue: ratingValue,
          onChanged: (Rating? value) {
            if (value != null) {
              onRatingRadioChanged(value);
            }
          },
        ),
        RadioListTile<Rating>(
          title: RatingBarIndicator(
            rating: 4,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: CustomColors.mainGreenColor,
            ),
            unratedColor: CustomColors.textColorAlmostBlack.withOpacity(0.2),
            itemCount: 5,
            itemSize: context.setHeight(14),
          ),
          value: Rating.fourStars,
          groupValue: ratingValue,
          onChanged: (Rating? value) {
            if (value != null) {
              onRatingRadioChanged(value);
            }
          },
        ),
        RadioListTile<Rating>(
          title: RatingBarIndicator(
            rating: 3,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: CustomColors.mainGreenColor,
            ),
            unratedColor: CustomColors.textColorAlmostBlack.withOpacity(0.2),
            itemCount: 5,
            itemSize: context.setHeight(14),
          ),
          value: Rating.threeStars,
          groupValue: ratingValue,
          onChanged: (Rating? value) {
            if (value != null) {
              onRatingRadioChanged(value);
            }
          },
        ),
        RadioListTile<Rating>(
          title: RatingBarIndicator(
            rating: 2,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: CustomColors.mainGreenColor,
            ),
            unratedColor: CustomColors.textColorAlmostBlack.withOpacity(0.2),
            itemCount: 5,
            itemSize: context.setHeight(14),
          ),
          value: Rating.twoStars,
          groupValue: ratingValue,
          onChanged: (Rating? value) {
            if (value != null) {
              onRatingRadioChanged(value);
            }
          },
        ),
        RadioListTile<Rating>(
          title: RatingBarIndicator(
            rating: 1,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: CustomColors.mainGreenColor,
            ),
            unratedColor: CustomColors.textColorAlmostBlack.withOpacity(0.2),
            itemCount: 5,
            itemSize: context.setHeight(14),
          ),
          value: Rating.oneStar,
          groupValue: ratingValue,
          onChanged: (Rating? value) {
            if (value != null) {
              onRatingRadioChanged(value);
            }
          },
        ),
      ],
    );
  }
}
