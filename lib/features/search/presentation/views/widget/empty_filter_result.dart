import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/themes/custom_colors.dart';

class EmptyfilterResult extends StatelessWidget {
  const EmptyfilterResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: context.setHeight(150)),
          Icon(
            Icons.menu_book_rounded,
            size: context.setHeight(200),
            color: CustomColors.textColorAlmostBlack.withOpacity(0.25),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.setWidth(30),
            ),
            child: Text(
              'No book found for this filter',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: CustomColors.textColorAlmostBlack.withOpacity(0.25),
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
