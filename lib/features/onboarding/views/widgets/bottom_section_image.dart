import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets_constants.dart';

class BottomSectionImage extends StatelessWidget {
  const BottomSectionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: context.setHeight(8)),
        Expanded(
          child: IgnorePointer(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                AssetsConstants.girlReadingBookImage,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        SizedBox(height: context.setHeight(8)),
      ],
    );
  }
}
