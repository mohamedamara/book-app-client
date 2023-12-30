import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'book_details_floating_header_container_item.dart';

class BookDetailsFloatingHeaderContainer extends StatelessWidget {
  const BookDetailsFloatingHeaderContainer({
    super.key,
    required this.rating,
    required this.numberOfPages,
    required this.language,
  });

  final num rating;
  final int numberOfPages;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -(context.setHeight(30)),
      left: 0,
      right: 0,
      child: Container(
        height: context.setHeight(60),
        margin: EdgeInsets.symmetric(
          horizontal: context.setWidth(20),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            context.setRadius(14),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: BookDetailsFloatingHeaderContainerItem(
                prefix: Icon(
                  Icons.star,
                  size: context.setHeight(16),
                ),
                label: 'Rating',
                value: rating.toString(),
              ),
            ),
            VerticalDivider(
              indent: context.setHeight(12),
              endIndent: context.setHeight(12),
              width: 1,
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            Expanded(
              child: BookDetailsFloatingHeaderContainerItem(
                label: 'Pages',
                value: numberOfPages.toString(),
              ),
            ),
            VerticalDivider(
              indent: context.setHeight(12),
              endIndent: context.setHeight(12),
              width: 1,
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            Expanded(
              child: BookDetailsFloatingHeaderContainerItem(
                label: 'language',
                value: language,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
