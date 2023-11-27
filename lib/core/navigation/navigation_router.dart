import 'package:books_app_client/features/search/presentation/views/widget/search_filter_view.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/views/sign_in_view.dart';
import '../../features/authentication/views/sign_up_view.dart';
import '../../features/onboarding/views/onboarding_view/onboarding_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/startup/presentation/views/startup_view.dart';
import '../../features/top_navigation/presentation/views/top_navigation_view.dart';
import 'navigation_paths.dart';

const String initialRoute = NavigationPaths.startupRoute;

class NavigationRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigationPaths.startupRoute:
        return MaterialPageRoute(
          builder: (_) => const StartUpView(),
          settings: RouteSettings(name: routeSettings.name),
        );
      case NavigationPaths.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
          settings: RouteSettings(name: routeSettings.name),
        );
      case NavigationPaths.signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
          settings: RouteSettings(name: routeSettings.name),
        );
      case NavigationPaths.signIpRoute:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
          settings: RouteSettings(name: routeSettings.name),
        );
      case NavigationPaths.topNavigationRoute:
        return MaterialPageRoute(
          builder: (_) => const TopNavigationView(),
          settings: RouteSettings(name: routeSettings.name),
        );
      case NavigationPaths.profileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
          settings: RouteSettings(name: routeSettings.name),
        );
      case NavigationPaths.filterBooksRoute:
        return MaterialPageRoute(
          builder: (_) => const FilterBooksView(),
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
