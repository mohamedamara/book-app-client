import 'package:books_app_client/core/themes/custom_light_theme.dart';
import 'package:books_app_client/features/onboarding/views/onboarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books app',
      theme: CustomLightTheme.getTheme(context),
      home: const OnboardingView(),
    );
  }
}
