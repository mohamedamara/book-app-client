import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:books_app_client/features/onboarding/views/widgets/bottom_half_screen.dart';
import 'package:books_app_client/features/onboarding/views/widgets/top_half_screen.dart';
import 'package:flutter/material.dart';

class AuthenticationOptionsView extends StatelessWidget {
  const AuthenticationOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopHalfScreen(),
            SizedBox(height: context.setHeight(20)),
            const BottomHalfScreen(),
          ],
        ),
      ),
    );
  }
}
