import 'package:books_app_client/core/widgets/custom_textfield.dart';
import 'package:books_app_client/features/authentication/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  String email = "test@whatever.com";
  String password = "12345678";

  group('Signin view tests -', () {
    testWidgets(
      'Matches golden file',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: SignInView(),
            ),
          ),
        );

        expectLater(
          find.byType(SignInView),
          matchesGoldenFile('goldens/sign_in_view.png'),
        );
      },
    );
    testWidgets(
      'When signin view is opened Then show 2 textfield to enter email and password',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: SignInView(),
            ),
          ),
        );

        final emailTextFieldFinder = find.byType(CustomTextField);

        expect(emailTextFieldFinder, findsNWidgets(2));
      },
    );

    testWidgets(
      'When email is valid and password length is 8 or more Then the signin button should be enabled',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: SignInView(),
            ),
          ),
        );

        final emailTextFieldFinder = find.byKey(
          const Key('email_textField'),
        );
        final passwordTextFieldFinder = find.byKey(
          const Key('password_textField'),
        );

        await tester.enterText(emailTextFieldFinder, email);
        await tester.enterText(passwordTextFieldFinder, password);

        await tester.pumpAndSettle();

        final primaryButtonFinder = tester.widget<ElevatedButton>(
          find.byType(ElevatedButton),
        );

        expect(
          primaryButtonFinder.enabled,
          isTrue,
        );
      },
    );
  });
}
