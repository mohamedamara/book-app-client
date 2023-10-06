import 'package:flutter/material.dart';

import '../../features/onboarding/views/onboarding_view.dart';
import 'navigation_paths.dart';

const String initialRoute = NavigationPaths.onboardingRoute;

class NavigationRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigationPaths.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
          settings: RouteSettings(name: routeSettings.name),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
