import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../../core/navigation/navigation_paths.dart';
import '../../../../core/widgets/primary_button.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.setWidth(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButtoon(
                    buttonText: "Sign In",
                    onPressed: () => Navigator.pushNamed(
                      context,
                      NavigationPaths.signIpRoute,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IgnorePointer(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: context.setHeight(40)),
                  Expanded(
                    child: Image.asset(
                      AssetsConstants.leavesLeftImage,
                    ),
                  ),
                  SizedBox(height: context.setHeight(20)),
                ],
              ),
            ),
          ),
          IgnorePointer(
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: context.setHeight(50)),
                  Expanded(
                    child: Image.asset(
                      AssetsConstants.leavesRightImage,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IgnorePointer(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: context.setHeight(112)),
                  Expanded(
                    child: Text(
                      "Books For \nEvery Taste.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                        .animate()
                        .fadeIn(
                          duration: 800.milliseconds,
                        )
                        .slideY(
                          begin: -0.3,
                          end: 0,
                          curve: Curves.easeInOut,
                          duration: 800.milliseconds,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
