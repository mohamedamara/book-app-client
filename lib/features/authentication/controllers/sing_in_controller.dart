import 'package:books_app_client/core/extensions/string_extension.dart';
import 'package:books_app_client/features/authentication/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/sign_in_state.dart';

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
  (ref) {
    final authenticationService = ref.watch(authenticationServiceProvider);
    return SignInController(
      SignInState(
        emailTextEditingController: TextEditingController(),
        passwordTextEditingController: TextEditingController(),
      ),
      authenticationService: authenticationService,
    );
  },
);

class SignInController extends StateNotifier<SignInState> {
  SignInController(
    SignInState state, {
    required this.authenticationService,
  }) : super(state);

  final AuthenticationService authenticationService;

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
    state = state.copyWith(isStayLoggedInChecked: !state.isStayLoggedInChecked);
  }

  Future<void> signIn() async {
    final isSignInSuccess = await authenticationService.signIn(
      email: state.emailTextEditingController.text,
      password: state.passwordTextEditingController.text,
    );
    if (isSignInSuccess) {
      state = state.copyWith(isUserLoggedIn: true);
    }
  }

  @override
  void dispose() {
    state.emailTextEditingController.dispose();
    state.passwordTextEditingController.dispose();
    super.dispose();
  }
}
