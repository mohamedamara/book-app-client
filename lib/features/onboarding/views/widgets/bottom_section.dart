import 'package:books_app_client/features/onboarding/views/widgets/bottom_section_image.dart';
import 'package:books_app_client/features/onboarding/views/widgets/button_section_button.dart';
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
