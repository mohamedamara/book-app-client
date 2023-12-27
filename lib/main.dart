import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/navigation/navigation_router.dart';
import 'core/themes/custom_light_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: widget!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Books app',
      themeMode: ThemeMode.light,
      theme: CustomLightTheme.getTheme(context),
      initialRoute: initialRoute,
      onGenerateRoute: NavigationRouter.generateRoute,
    );
  }
}
