import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required TextEditingController emailTextEditingController,
    required TextEditingController passwordTextEditingController,
    @Default(false) bool isStayLoggedInChecked,
    @Default(false) bool areAllTextFieldsValid,
    @Default(false) bool isUserLoggedIn,
  }) = _SignInState;
}
