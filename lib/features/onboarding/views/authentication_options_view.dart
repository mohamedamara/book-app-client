import 'package:books_app_client/core/constants/assets_constants.dart';
import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:books_app_client/core/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/navigation/navigation_paths.dart';

class AuthenticationOptionsView extends StatelessWidget {
  const AuthenticationOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: context.setHeight(112)),
                  Text(
                    "Books For \nEvery Taste.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                      .animate()
                      .fadeIn(
                        duration: const Duration(milliseconds: 800),
                      )
                      .slideY(
                        begin: -1,
                        end: 0,
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 800),
                      ),
                  SizedBox(height: context.setHeight(98)),
                  PrimaryButtoon(
                    buttonText: "Sign In",
                    textColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    borderColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        NavigationPaths.signIpRoute,
                      );
                    },
                  ),
                  SizedBox(height: context.setHeight(20)),
                  PrimaryButtoon(
                    buttonText: "Sign Up",
                    textColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    borderColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        NavigationPaths.signUpRoute,
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: context.setHeight(40),
              child: Image.asset(
                AssetsConstants.leavesLeftImage,
                height: context.setHeight(290),
              ),
            ),
            Positioned(
              right: 0,
              top: context.setHeight(50),
              child: IgnorePointer(
                child: Image.asset(
                  AssetsConstants.leavesRightImage,
                  height: context.setHeight(270),
                ),
              ),
            ),
            Positioned(
              bottom: context.setHeight(8),
              left: 0,
              child: IgnorePointer(
                child: Image.asset(
                  AssetsConstants.girlReadingBookImage,
                  height: context.setHeight(390),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
