import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/widgets/custom_textfield.dart';
import 'package:books_app_client/core/widgets/primary_button.dart';
import 'package:books_app_client/features/authentication/controllers/sign_up_controller.dart';
import 'package:books_app_client/features/authentication/views/widgets/checkbox_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                controller: ref
                    .watch(signUpControllerProvider)
                    .firstNameTextEditingController,
                labelText: "First Name",
                onChanged: (_) => ref
                    .read(signUpControllerProvider.notifier)
                    .onTextFieldChanged(),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: ref
                    .watch(signUpControllerProvider)
                    .lastNameTextEditingController,
                labelText: "Last Name",
                onChanged: (_) => ref
                    .read(signUpControllerProvider.notifier)
                    .onTextFieldChanged(),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: ref
                    .watch(signUpControllerProvider)
                    .emailTextEditingController,
                labelText: "Email",
                onChanged: (_) => ref
                    .read(signUpControllerProvider.notifier)
                    .onTextFieldChanged(),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: ref
                    .watch(signUpControllerProvider)
                    .passwordTextEditingController,
                labelText: "Password",
                obscureText: true,
                onChanged: (_) => ref
                    .read(signUpControllerProvider.notifier)
                    .onTextFieldChanged(),
              ),
              SizedBox(height: context.setHeight(21)),
              CheckboxWithLabel(
                text: "Please sign me up for the monthly newsletter.",
                isChecked: ref
                    .watch(signUpControllerProvider)
                    .isMonthlyNewsletterChecked,
                onChanged: (_) => ref
                    .read(signUpControllerProvider.notifier)
                    .updateMonthlyNewsletterCheckBoxValue(),
                onTextPressed: () => ref
                    .read(signUpControllerProvider.notifier)
                    .updateMonthlyNewsletterCheckBoxValue(),
              ),
              SizedBox(height: context.setHeight(25)),
              PrimaryButtoon(
                buttonText: "Sign Up",
                isEnabled:
                    ref.watch(signUpControllerProvider).areAllTextFieldsValid,
                onPressed: () {},
              ),
              SizedBox(height: context.setHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
