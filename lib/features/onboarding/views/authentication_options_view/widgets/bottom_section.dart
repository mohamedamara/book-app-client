import 'package:books_app_client/features/onboarding/views/authentication_options_view/widgets/bottom_section_image.dart';
import 'package:books_app_client/features/onboarding/views/authentication_options_view/widgets/button_section_button.dart';
import 'package:flutter/material.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Stack(
        children: [
          BottomSectionButton(),
          BottomSectionImage(),
        ],
      ),
    );
  }
}
