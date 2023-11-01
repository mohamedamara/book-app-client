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

    testWidgets(
      "When checkbox is taped Then it's value should be true",
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: SignInView(),
            ),
          ),
        );

        final checkboxFinder = find.byType(Checkbox);

        await tester.tap(checkboxFinder);

        await tester.pumpAndSettle();

        final checkboxValue = tester
            .widget<Checkbox>(
              find.byType(Checkbox),
            )
            .value;

        expect(
          checkboxValue,
          isTrue,
        );
      },
    );

    testWidgets(
      "When checkbox's label is taped Then checkbox value should be true",
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: SignInView(),
            ),
          ),
        );

        final checkboxLabelFinder = find.text('Stay Logged In');

        await tester.tap(checkboxLabelFinder);

        await tester.pumpAndSettle();

        final checkboxValue = tester
            .widget<Checkbox>(
              find.byType(Checkbox),
            )
            .value;

        expect(
          checkboxValue,
          isTrue,
        );
      },
    );
  });
}
