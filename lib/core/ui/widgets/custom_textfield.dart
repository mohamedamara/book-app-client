import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText,
    this.textCapitalization,
    this.keyboardType,
    this.unlimitedLength = false,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool? obscureText;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool unlimitedLength;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.setHeight(56),
      width: double.infinity,
      child: TextField(
        controller: controller,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        keyboardType: keyboardType,
        maxLength: unlimitedLength
            ? null
            : keyboardType == TextInputType.emailAddress
                ? 50
                : 30,
        obscureText: obscureText ?? false,
        obscuringCharacter: "●",
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Theme.of(context).primaryColor,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.black),
        decoration: InputDecoration(
          counterText: '',
          label: Text(
            labelText,
          ),
          labelStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.black.withOpacity(0.5)),
          hintText: labelText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.black.withOpacity(0.5)),
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTap: onTap,
      ),
    );
  }
}
