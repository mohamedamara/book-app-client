import 'package:books_app_client/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/sign_in_state.dart';

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>((ref) {
  return SignInController(
    SignInState(
      emailTextEditingController: TextEditingController(),
      passwordTextEditingController: TextEditingController(),
    ),
  );
});

class SignInController extends StateNotifier<SignInState> {
  SignInController(SignInState state) : super(state);

  void onTextFieldChanged() {
    bool isEmailValid = state.emailTextEditingController.text.isValidEmail;
    bool isPasswordValid = state.passwordTextEditingController.text.length >= 8;
    if (isEmailValid && isPasswordValid) {
      state = state.copyWith(areAllTextFieldsValid: true);
    } else {
      state = state.copyWith(areAllTextFieldsValid: false);
    }
  }

  void updateStayLoggedInCheckedCheckBoxValue() {
    state = state.copyWith(
      isStayLoggedInChecked: !state.isStayLoggedInChecked,
    );
  }

  @override
  void dispose() {
    state.emailTextEditingController.dispose();
    state.passwordTextEditingController.dispose();
    super.dispose();
  }
}
