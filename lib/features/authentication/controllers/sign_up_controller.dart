import 'package:books_app_client/core/extensions/string_extension.dart';
import 'package:books_app_client/features/authentication/states/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpControllerProvider =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>((ref) {
  return SignUpController(
    SignUpState(
      firstNameTextEditingController: TextEditingController(),
      lastNameTextEditingController: TextEditingController(),
      emailTextEditingController: TextEditingController(),
      passwordTextEditingController: TextEditingController(),
    ),
  );
});

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController(SignUpState state) : super(state);

  void onTextFieldChanged() {
    bool isFirstNameValid =
        state.firstNameTextEditingController.text.isNotEmpty;
    bool isLastNameValid = state.lastNameTextEditingController.text.isNotEmpty;
    bool isEmailValid = state.emailTextEditingController.text.isValidEmail;
    bool isPasswordValid = state.passwordTextEditingController.text.length >= 8;
    if (isFirstNameValid &&
        isLastNameValid &&
        isEmailValid &&
        isPasswordValid) {
      state = state.copyWith(areAllTextFieldsValid: true);
    } else {
      state = state.copyWith(areAllTextFieldsValid: false);
    }
  }

  void updateMonthlyNewsletterCheckBoxValue() {
    state = state.copyWith(
      isMonthlyNewsletterChecked: !state.isMonthlyNewsletterChecked,
    );
  }

  @override
  void dispose() {
    state.firstNameTextEditingController.dispose();
    state.lastNameTextEditingController.dispose();
    state.emailTextEditingController.dispose();
    state.passwordTextEditingController.dispose();
    super.dispose();
  }
}
