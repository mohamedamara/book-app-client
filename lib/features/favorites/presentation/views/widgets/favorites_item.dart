import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/themes/custom_colors.dart';

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.setHeight(180),
      child: Row(
        children: [
          Container(
            width: context.setHeight(115.94),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: context.setWidth(10.06)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.setHeight(10)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "The Secret of Heroism: A Memoir of Henry Albert Harpe",
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: context.setSp(18),
                              color: CustomColors.textColorAlmostBlack
                                  .withOpacity(0.75),
                            ),
                      ),
                    ),
                    SizedBox(width: context.setHeight(5)),
                    GestureDetector(
                      onTap: () {},
                      child: FaIcon(
                        FontAwesomeIcons.trashCan,
                        color: CustomColors.textColorAlmostBlack.withOpacity(
                          0.2,
                        ),
                      ),
                    ),
                  ],
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
                  unratedColor:
                      CustomColors.textColorAlmostBlack.withOpacity(0.25),
                  itemCount: 5,
                  itemSize: context.setHeight(10),
                ),
                SizedBox(height: context.setHeight(14.63)),
                UnconstrainedBox(
                  child: Container(
                    height: context.setHeight(25),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.setWidth(10),
                    ),
                    decoration: BoxDecoration(
                      color: CustomColors.mainGreenColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        context.setRadius(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Children',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: CustomColors.mainGreenColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
