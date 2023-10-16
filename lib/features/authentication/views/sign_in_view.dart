import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/widgets/custom_textfield.dart';
import 'package:books_app_client/core/widgets/primary_button.dart';
import 'package:books_app_client/features/authentication/controllers/sing_in_controller.dart';
import 'package:books_app_client/features/authentication/views/widgets/checkbox_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

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
                "Sign In",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: ref
                    .watch(signInControllerProvider)
                    .emailTextEditingController,
                labelText: "Email",
                onChanged: (_) => ref
                    .read(signInControllerProvider.notifier)
                    .onTextFieldChanged(),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: ref
                    .watch(signInControllerProvider)
                    .passwordTextEditingController,
                labelText: "Password",
                obscureText: true,
                onChanged: (_) => ref
                    .read(signInControllerProvider.notifier)
                    .onTextFieldChanged(),
              ),
              SizedBox(height: context.setHeight(21)),
              Row(
                children: [
                  CheckboxWithLabel(
                    text: "Stay Logged In",
                    isChecked: ref
                        .watch(signInControllerProvider)
                        .isStayLoggedInChecked,
                    onChanged: (_) => ref
                        .read(signInControllerProvider.notifier)
                        .updateStayLoggedInCheckedCheckBoxValue(),
                    onTextPressed: () => ref
                        .read(signInControllerProvider.notifier)
                        .updateStayLoggedInCheckedCheckBoxValue(),
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
                isEnabled:
                    ref.watch(signInControllerProvider).areAllTextFieldsValid,
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
