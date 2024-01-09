import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/navigation/navigation_paths.dart';
import '../../../authentication/presentation/enums/authentication_status.dart';
import '../controllers/startup_controller.dart';

class StartUpView extends ConsumerWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(startupControllerProvider, (_, current) {
      if (current is AsyncData) {
        if (current.value == AuthenticationStatus.authenticated) {
          Navigator.pushReplacementNamed(
            context,
            NavigationPaths.topNavigationRoute,
          );
        } else if (current.value == AuthenticationStatus.unauthenticated) {
          Navigator.pushReplacementNamed(
            context,
            NavigationPaths.onboardingRoute,
          );
        }
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
