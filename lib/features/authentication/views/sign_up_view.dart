import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/extensions/string_extension.dart';
import 'package:books_app_client/core/widgets/custom_textfield.dart';
import 'package:books_app_client/core/widgets/primary_button.dart';
import 'package:books_app_client/features/authentication/controllers/authentication_controller.dart';
import 'package:books_app_client/features/authentication/views/widgets/checkbox_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/models/failure.dart';
import '../../../core/navigation/navigation_paths.dart';
import '../../../core/widgets/custom_flutter_toast.dart';
import '../enums/authentication_status.dart';

class SignUpView extends HookConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameTextEditingController = useTextEditingController();
    final lastNameTextEditingController = useTextEditingController();
    final emailTextEditingController = useTextEditingController();
    final passwordTextEditingController = useTextEditingController();
    final isMonthlyNewsletterChecked = useState(false);
    final areAllTextFieldsValid = useState(false);
    FToast fToast = FToast();

    void validateTextFields() {
      bool isFirstNameValid = firstNameTextEditingController.text.isNotEmpty;
      bool isLastNameValid = lastNameTextEditingController.text.isNotEmpty;
      bool isEmailValid = emailTextEditingController.text.isValidEmail;
      bool isPasswordValid = passwordTextEditingController.text.length >= 8;
      areAllTextFieldsValid.value =
          isFirstNameValid && isLastNameValid && isEmailValid && isPasswordValid
              ? true
              : false;
    }

    ref.listen(authenticationControllerProvider, (_, current) {
      if (current is AsyncError && current.error is Failure) {
        showToast(
          context,
          fToast,
          current.error.toString(),
        );
      } else if (current is AsyncData &&
          current.value == AuthenticationStatus.authenticated) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          NavigationPaths.topNavigationRoute,
          (Route<dynamic> route) => false,
        );
      }
    });

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.setHeight(30)),
              Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: firstNameTextEditingController,
                labelText: "First Name",
                onChanged: (_) => validateTextFields(),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: lastNameTextEditingController,
                labelText: "Last Name",
                onChanged: (_) => validateTextFields(),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: emailTextEditingController,
                labelText: "Email",
                onChanged: (_) => validateTextFields(),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: passwordTextEditingController,
                labelText: "Password",
                obscureText: true,
                onChanged: (_) => validateTextFields(),
              ),
              SizedBox(height: context.setHeight(21)),
              CheckboxWithLabel(
                text: "Please sign me up for the monthly newsletter.",
                isChecked: isMonthlyNewsletterChecked.value,
                onChanged: (_) {
                  isMonthlyNewsletterChecked.value =
                      !isMonthlyNewsletterChecked.value;
                },
                onTextPressed: () {
                  isMonthlyNewsletterChecked.value =
                      !isMonthlyNewsletterChecked.value;
                },
              ),
              SizedBox(height: context.setHeight(25)),
              PrimaryButtoon(
                buttonText: "Sign Up",
                isEnabled: areAllTextFieldsValid.value,
                isLoading:
                    ref.watch(authenticationControllerProvider) is AsyncLoading,
                onPressed: () {
                  ref.read(authenticationControllerProvider.notifier).signUp(
                        firstName: firstNameTextEditingController.text,
                        lastName: lastNameTextEditingController.text,
                        email: emailTextEditingController.text,
                        password: passwordTextEditingController.text,
                      );
                },
              ),
              SizedBox(height: context.setHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
