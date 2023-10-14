import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/assets_constants.dart';

class LeavesRightImage extends StatelessWidget {
  const LeavesRightImage({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: context.setHeight(50)),
            Expanded(
              child: Image.asset(
                AssetsConstants.leavesRightImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
