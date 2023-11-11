import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/book.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({
    super.key,
    required this.recentlyViewedBooks,
  });

  final List<Book> recentlyViewedBooks;

  @override
  Widget build(BuildContext context) {
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
                      onTap: () {},
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
                              fit: BoxFit.fitHeight,
                              placeholder: (_, __) => const SizedBox(),
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
