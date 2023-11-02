import 'package:books_app_client/features/authentication/repositories/authentication_repository.dart';
import 'package:books_app_client/features/home/views/home_view.dart';
import 'package:books_app_client/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';

import 'stubs/stub_authentication_repository.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  String email = "test@whatever.com";
  String password = "12345678";

  group('Authentication feature Integration tests -', () {
    testWidgets(
      'test signin flow and see the home view screen in the end',
      (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authenticationRepositoryProvider.overrideWithValue(
                StubAuthenticationRepository(),
              ),
            ],
            child: const App(),
          ),
        );

        // the onboarding flow
        await tester.drag(find.byType(PageView), const Offset(-300, 0.0));
        await tester.pumpAndSettle();
        await tester.drag(find.byType(PageView), const Offset(-300, 0.0));
        await tester.pumpAndSettle();
        await tester.drag(find.byType(PageView), const Offset(-300, 0.0));
        await tester.pumpAndSettle();
        final authenticationOptionButtonFinder = find.byKey(
          const Key('authentication_options_signin'),
        );
        await tester.tap(authenticationOptionButtonFinder);
        await tester.pumpAndSettle();

        // enter signin credentials
        final emailTextFieldFinder = find.byKey(
          const Key('email_textField'),
        );
        final passwordTextFieldFinder = find.byKey(
          const Key('password_textField'),
        );
        await tester.enterText(emailTextFieldFinder, email);
        await tester.enterText(passwordTextFieldFinder, password);
        await tester.pumpAndSettle();

        // tap the signin button
        final signInButtonFinder = find.byType(ElevatedButton);
        await tester.tap(signInButtonFinder);
        await tester.pumpAndSettle();

        expect(find.byType(HomeView), findsOneWidget);
      },
    );
  });
}
