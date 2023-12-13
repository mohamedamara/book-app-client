import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';

import '../../../../../core/themes/custom_colors.dart';

showInAppReadingSettingsModalBottomSheet({
  required BuildContext context,
  required Function(double value) onClick,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white.withOpacity(0),
    isScrollControlled: true,
    elevation: 0,
    builder: (_) {
      return Container(
        color: Colors.white.withOpacity(0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.setRadius(24)),
              topRight: Radius.circular(context.setRadius(24)),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.setHeight(8)),
              Container(
                height: context.setHeight(8),
                width: context.setWidth(63),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    context.setRadius(4),
                  ),
                  color: CustomColors.textColorAlmostBlack.withOpacity(0.1),
                ),
              ),
              SizedBox(height: context.setHeight(26)),
              Padding(
                padding: EdgeInsets.only(left: context.setWidth(16)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Review",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.phone_android),
                onPressed: () {
                  onClick(5);
                },
              ),
              IconButton(
                icon: Icon(Icons.phone_iphone),
                onPressed: () {
                  onClick(1);
                },
              ),
              SizedBox(height: context.setHeight(200)),
            ],
          ),
        ),
      );
    },
  );
}
