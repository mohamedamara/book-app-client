import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../features/book_details/presentation/views/book_details_view.dart';
import '../models/book/book.dart';
import '../navigation/navigation_paths.dart';
import '../themes/custom_colors.dart';

class BookListTile extends StatelessWidget {
  const BookListTile({
    super.key,
    required this.book,
    required this.parentViewName,
  });

  final Book book;
  final String parentViewName;

  @override
  Widget build(BuildContext context) {
    String bookAnimationHeroTag = '${parentViewName}book_list_tile${book.id}';
    return SizedBox(
      height: context.setHeight(180),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => navigateToBookDetailsView(
              context,
              bookAnimationHeroTag,
            ),
            child: Hero(
              tag: bookAnimationHeroTag,
              child: SizedBox(
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
                      width: context.setHeight(130),
                      fit: BoxFit.fitHeight,
                      placeholder: (_, __) => const SizedBox(),
                    ),
                  ),
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
                GestureDetector(
                  onTap: () => navigateToBookDetailsView(
                    context,
                    bookAnimationHeroTag,
                  ),
                  child: AutoSizeText(
                    book.title,
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: context.setSp(18),
                          color: CustomColors.textColorAlmostBlack
                              .withOpacity(0.75),
                        ),
                  ),
                ),
                SizedBox(height: context.setHeight(5)),
                Text(
                  book.author,
                  textAlign: TextAlign.start,
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

  void navigateToBookDetailsView(
    BuildContext context,
    String bookAnimationHeroTag,
  ) {
    Navigator.pushNamed(
      context,
      NavigationPaths.bookDetailsRoute,
      arguments: BookDetailsArguments(
        book: book,
        bookAnimationHeroTag: bookAnimationHeroTag,
      ),
    );
  }
}
