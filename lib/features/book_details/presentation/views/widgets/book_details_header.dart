import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../book_details_view.dart';

class BookDetailsHeader extends StatelessWidget {
  const BookDetailsHeader({
    super.key,
    required this.bookDetailsArguments,
  });

  final BookDetailsArguments bookDetailsArguments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: bookDetailsArguments.bookAnimationHeroTag,
          child: SizedBox(
            height: context.setHeight(200),
            width: context.setHeight(130),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  context.setRadius(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: bookDetailsArguments.book.coverImageURL,
                  height: context.setHeight(200),
                  width: context.setHeight(130),
                  fit: BoxFit.fitHeight,
                  placeholder: (_, __) => const SizedBox(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: context.setHeight(20)),
        Text(
          bookDetailsArguments.book.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: context.setSp(15),
              ),
        ),
        SizedBox(height: context.setHeight(5)),
        Text(
          bookDetailsArguments.book.author,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: context.setSp(11),
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
