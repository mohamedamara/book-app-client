import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/extensions/string_extension.dart';
import 'package:books_app_client/core/widgets/custom_textfield.dart';
import 'package:books_app_client/core/widgets/primary_button.dart';
import 'package:books_app_client/features/authentication/views/widgets/checkbox_with_label.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController _firstNameTextEditingController;
  late TextEditingController _lastNameTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  bool _isMonthlyNewsletterChecked = false;

  @override
  void initState() {
    super.initState();
    _firstNameTextEditingController = TextEditingController();
    _lastNameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _firstNameTextEditingController,
                labelText: "First Name",
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: _lastNameTextEditingController,
                labelText: "Last Name",
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: _emailTextEditingController,
                labelText: "Email",
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: context.setHeight(20)),
              CustomTextField(
                controller: _passwordTextEditingController,
                labelText: "Password",
                obscureText: true,
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: context.setHeight(21)),
              CheckboxWithLabel(
                text: "Please sign me up for the monthly newsletter.",
                isChecked: _isMonthlyNewsletterChecked,
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      _isMonthlyNewsletterChecked = value;
                    });
                  }
                },
                onTextPressed: () {
                  setState(() {
                    _isMonthlyNewsletterChecked = !_isMonthlyNewsletterChecked;
                  });
                },
              ),
              SizedBox(height: context.setHeight(25)),
              PrimaryButtoon(
                buttonText: "Sign Up",
                isEnabled: areAllTextFieldsValid(),
                onPressed: () {},
              ),
              SizedBox(height: context.setHeight(30)),
            ],
          ),
        ),
      ),
    );
  }

  bool areAllTextFieldsValid() {
    bool isFirstNameValid = _firstNameTextEditingController.text.isNotEmpty;
    bool isLastNameValid = _lastNameTextEditingController.text.isNotEmpty;
    bool isEmailValid = _emailTextEditingController.text.isValidEmail;
    bool isPasswordValid = _passwordTextEditingController.text.length >= 8;
    return isFirstNameValid &&
        isLastNameValid &&
        isEmailValid &&
        isPasswordValid;
  }
}
