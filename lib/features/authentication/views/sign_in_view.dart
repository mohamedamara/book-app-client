import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/extensions/string_extension.dart';
import 'package:books_app_client/core/widgets/custom_textfield.dart';
import 'package:books_app_client/core/widgets/primary_button.dart';
import 'package:books_app_client/features/authentication/views/widgets/checkbox_with_label.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  bool _isStayLoggedInChecked = false;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
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
                "Sign In",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
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
              Row(
                children: [
                  CheckboxWithLabel(
                    text: "Stay Logged In",
                    isChecked: _isStayLoggedInChecked,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          _isStayLoggedInChecked = value;
                        });
                      }
                    },
                    onTextPressed: () {
                      setState(() {
                        _isStayLoggedInChecked = !_isStayLoggedInChecked;
                      });
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
    bool isEmailValid = _emailTextEditingController.text.isValidEmail;
    bool isPasswordValid = _passwordTextEditingController.text.length >= 8;
    return isEmailValid && isPasswordValid;
  }
}
