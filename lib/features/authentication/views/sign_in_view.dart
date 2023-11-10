import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/extensions/string_extension.dart';
import 'package:books_app_client/core/models/failure.dart';
import 'package:books_app_client/core/navigation/navigation_paths.dart';
import 'package:books_app_client/core/widgets/custom_flutter_toast.dart';
import 'package:books_app_client/core/widgets/custom_textfield.dart';
import 'package:books_app_client/core/widgets/primary_button.dart';
import 'package:books_app_client/features/authentication/controllers/authentication_controller.dart';
import 'package:books_app_client/features/authentication/views/widgets/checkbox_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enums/authentication_status.dart';

class SignInView extends HookConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextEditingController = useTextEditingController();
    final passwordTextEditingController = useTextEditingController();
    final isStayLoggedInChecked = useState(false);
    final areAllTextFieldsValid = useState(false);
    FToast fToast = FToast();

    void validateTextFields() {
      bool isEmailValid = emailTextEditingController.text.isValidEmail;
      bool isPasswordValid = passwordTextEditingController.text.length >= 8;
      areAllTextFieldsValid.value =
          isEmailValid && isPasswordValid ? true : false;
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
                "Sign In",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                key: const Key('email_textField'),
                controller: emailTextEditingController,
                labelText: "Email",
                onChanged: (_) => validateTextFields(),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                key: const Key('password_textField'),
                controller: passwordTextEditingController,
                labelText: "Password",
                obscureText: true,
                onChanged: (_) => validateTextFields(),
              ),
              SizedBox(height: context.setHeight(21)),
              Row(
                children: [
                  CheckboxWithLabel(
                    text: "Stay Logged In",
                    isChecked: isStayLoggedInChecked.value,
                    onChanged: (_) {
                      isStayLoggedInChecked.value =
                          !isStayLoggedInChecked.value;
                    },
                    onTextPressed: () {
                      isStayLoggedInChecked.value =
                          !isStayLoggedInChecked.value;
                    },
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgotten Passowrd?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.setHeight(25)),
              PrimaryButtoon(
                buttonText: "Sign In",
                isEnabled: areAllTextFieldsValid.value,
                isLoading:
                    ref.watch(authenticationControllerProvider) is AsyncLoading,
                onPressed: () {
                  ref.read(authenticationControllerProvider.notifier).signIn(
                        email: emailTextEditingController.text,
                        password: passwordTextEditingController.text,
                        isStayLoggedInChecked: isStayLoggedInChecked.value,
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
