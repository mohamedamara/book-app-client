import 'package:books_app_client/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TextEditingController textEditingController;

  setUp(() {
    textEditingController = TextEditingController();
  });

  tearDown(() {
    textEditingController.dispose();
  });

  group('Custom textField tests -', () {
    testWidgets(
      'When obscureText is true Then the text should be obscured (useful for password textFields)',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomTextField(
                controller: textEditingController,
                labelText: '',
                obscureText: true,
              ),
            ),
          ),
        );

        expect(
          tester.widget<TextField>(find.byType(TextField)).obscureText,
          isTrue,
        );
      },
    );
  });
}
