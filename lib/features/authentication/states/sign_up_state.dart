import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required TextEditingController firstNameTextEditingController,
    required TextEditingController lastNameTextEditingController,
    required TextEditingController emailTextEditingController,
    required TextEditingController passwordTextEditingController,
    @Default(false) bool isMonthlyNewsletterChecked,
    @Default(false) bool areAllTextFieldsValid,
    @Default(false) bool isUserLoggedIn,
  }) = _SignUpState;
}
