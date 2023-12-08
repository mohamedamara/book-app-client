import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BookDetailsFloatingHeaderContainerItem extends StatelessWidget {
  const BookDetailsFloatingHeaderContainerItem({
    super.key,
    required this.label,
    required this.value,
    this.prefix,
  });

  final String label;
  final String value;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null) ...[
              prefix!,
              SizedBox(
                width: context.setWidth(2),
              )
            ],
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: context.setSp(17),
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        SizedBox(height: context.setHeight(5)),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: context.setSp(10),
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
