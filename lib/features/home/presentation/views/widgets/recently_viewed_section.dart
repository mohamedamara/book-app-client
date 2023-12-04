import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/book/book.dart';
import '../../../../../core/navigation/navigation_paths.dart';
import '../../../../../core/themes/custom_colors.dart';
import '../../../../book_details/presentation/views/book_details_view.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({
    super.key,
    required this.recentlyViewedBooks,
  });

  final List<Book> recentlyViewedBooks;

  @override
  Widget build(BuildContext context) {
    String heroTagPrefix = 'recenty_viewed';
    if (recentlyViewedBooks.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.setWidth(20),
        ),
        child: Text(
          'No recently viewed books yet.',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: CustomColors.textColorAlmostBlack.withOpacity(0.25),
                fontWeight: FontWeight.normal,
                height: 1.6,
              ),
        ),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(
        left: context.setWidth(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var book in recentlyViewedBooks) ...[
            Padding(
              padding: EdgeInsets.only(
                right: context.setWidth(25),
              ),
              child: SizedBox(
                width: context.setHeight(130),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        NavigationPaths.bookDetailsRoute,
                        arguments: BookDetailsArguments(
                          book: book,
                          bookAnimationHeroTag: '$heroTagPrefix${book.id}',
                        ),
                      ),
                      child: Hero(
                        tag: '$heroTagPrefix${book.id}',
                        child: SizedBox(
                          height: context.setHeight(200),
                          width: context.setHeight(130),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                context.setRadius(10),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: book.coverImageURL,
                                height: context.setHeight(200),
                                width: context.setHeight(130),
                                fit: BoxFit.fitHeight,
                                placeholder: (_, __) => const SizedBox(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.setHeight(29)),
                    Text(
                      book.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: context.setSp(15),
                          ),
                    ),
                    SizedBox(height: context.setHeight(5)),
                    Text(
                      book.author,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: context.setSp(11),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
