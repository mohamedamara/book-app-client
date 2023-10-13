import 'package:books_app_client/features/onboarding/views/widgets/leaves_left_image.dart';
import 'package:books_app_client/features/onboarding/views/widgets/leaves_right_image.dart';
import 'package:books_app_client/features/onboarding/views/widgets/top_section_button.dart';
import 'package:books_app_client/features/onboarding/views/widgets/top_section_text.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Stack(
        children: [
          TopSectionButton(),
          LeavesLeftImage(),
          LeavesRightImage(),
          TopSectionText(),
        ],
      ),
    );
  }
}
