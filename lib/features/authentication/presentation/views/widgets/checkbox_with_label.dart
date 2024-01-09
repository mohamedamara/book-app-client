import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CheckboxWithLabel extends StatelessWidget {
  const CheckboxWithLabel({
    super.key,
    required this.text,
    required this.isChecked,
    required this.onChanged,
    required this.onTextPressed,
  });

  final bool isChecked;
  final String text;
  final VoidCallback onTextPressed;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        GestureDetector(
          onTap: onTextPressed,
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: EdgeInsets.only(left: context.setWidth(30)),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        SizedBox(
          width: context.setHeight(24),
          height: context.setHeight(24),
          child: Transform.scale(
            scale: 1.2,
            child: Checkbox(
              side: MaterialStateBorderSide.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return BorderSide(
                    width: context.setHeight(1),
                    color: Theme.of(context).colorScheme.primary,
                  );
                }
                return BorderSide(
                  width: context.setHeight(1),
                  color: Colors.black.withOpacity(0.2),
                );
              }),
              value: isChecked,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
