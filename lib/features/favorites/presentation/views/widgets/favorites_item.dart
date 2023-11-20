import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/models/book/book.dart';
import '../../../../../core/themes/custom_colors.dart';

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.setHeight(180),
      child: Row(
        children: [
          SizedBox(
            height: double.infinity,
            width: context.setHeight(115.94),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  context.setRadius(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: book.coverImageURL,
                  height: double.infinity,
                  width: context.setHeight(115.94),
                  fit: BoxFit.fitHeight,
                  placeholder: (_, __) => const SizedBox(),
                ),
              ),
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
                AutoSizeText(
                  book.title,
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: context.setSp(18),
                        color:
                            CustomColors.textColorAlmostBlack.withOpacity(0.75),
                      ),
                ),
                SizedBox(height: context.setHeight(5)),
                Text(
                  book.author,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: context.setHeight(14.63)),
                RatingBarIndicator(
                  rating: book.rating.toDouble(),
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
                        book.genre,
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
