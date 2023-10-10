import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../../core/navigation/navigation_paths.dart';
import '../../../../core/ui/widgets/primary_button.dart';

class BottomHalfScreen extends StatelessWidget {
  const BottomHalfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
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
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: context.setHeight(8)),
              Expanded(
                child: IgnorePointer(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      AssetsConstants.girlReadingBookImage,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.setHeight(8)),
            ],
          ),
        ],
      ),
    );
  }
}
