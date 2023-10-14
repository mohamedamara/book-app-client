import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/assets_constants.dart';

class LeavesLeftImage extends StatelessWidget {
  const LeavesLeftImage({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: context.setHeight(40)),
            Expanded(
              child: Image.asset(
                AssetsConstants.leavesLeftImage,
              ),
            ),
            SizedBox(height: context.setHeight(20)),
          ],
        ),
      ),
    );
  }
}
