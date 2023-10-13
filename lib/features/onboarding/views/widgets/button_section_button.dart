import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation_paths.dart';
import '../../../../core/widgets/primary_button.dart';

class BottomSectionButton extends StatelessWidget {
  const BottomSectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.setWidth(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryButtoon(
            buttonText: "Sign Up",
            onPressed: () => Navigator.pushNamed(
              context,
              NavigationPaths.signUpRoute,
            ),
          ),
        ],
      ),
    );
  }
}
