import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/navigation/navigation_paths.dart';
import '../../../../../core/widgets/primary_button.dart';

class TopSectionButton extends StatelessWidget {
  const TopSectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.setWidth(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButtoon(
              key: const Key('authentication_options_signin'),
              buttonText: "Sign In",
              onPressed: () => Navigator.pushNamed(
                context,
                NavigationPaths.signIpRoute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
