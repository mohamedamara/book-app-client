import 'package:books_app_client/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Primary button circular progress tests -', () {
    testWidgets(
      'When is loading is false Then no circular progress should be displated',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PrimaryButtoon(
              buttonText: '',
              isLoading: false,
              onPressed: () {},
            ),
          ),
        );
        final circularProgressFinder = find.byType(CircularProgressIndicator);
        expect(circularProgressFinder, findsNothing);
      },
    );
    testWidgets(
      'When is loading is true Then show circular progress',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PrimaryButtoon(
              buttonText: '',
              isLoading: true,
              onPressed: () {},
            ),
          ),
        );
        final circularProgressFinder = find.byType(CircularProgressIndicator);
        expect(circularProgressFinder, findsOneWidget);
      },
    );
  });

  group('Primary button enabled/disabled clicking tests -', () {
    testWidgets(
      'When is enabled is false Then the button is not clickable',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PrimaryButtoon(
              buttonText: '',
              isEnabled: false,
              onPressed: () {},
            ),
          ),
        );

        expect(
          tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
          isFalse,
        );
      },
    );
    testWidgets(
      'When is enabled is true Then the button is clickable',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: PrimaryButtoon(
              buttonText: '',
              isEnabled: true,
              onPressed: () {},
            ),
          ),
        );

        expect(
          tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
          isTrue,
        );
      },
    );
  });
}
