import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/primary_button.dart';

class FilterBooksBottomActionBar extends StatelessWidget {
  const FilterBooksBottomActionBar({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.setHeight(80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.setRadius(10)),
          topRight: Radius.circular(context.setRadius(10)),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.setWidth(38),
            ),
            child: SizedBox(
              height: context.setHeight(45),
              child: PrimaryButtoon(
                buttonText: "Apply Filter",
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
