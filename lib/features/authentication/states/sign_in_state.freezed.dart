// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInState {
  TextEditingController get emailTextEditingController =>
      throw _privateConstructorUsedError;
  TextEditingController get passwordTextEditingController =>
      throw _privateConstructorUsedError;
  bool get isStayLoggedInChecked => throw _privateConstructorUsedError;
  bool get areAllTextFieldsValid => throw _privateConstructorUsedError;
  bool get isUserLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call(
      {TextEditingController emailTextEditingController,
      TextEditingController passwordTextEditingController,
      bool isStayLoggedInChecked,
      bool areAllTextFieldsValid,
      bool isUserLoggedIn});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailTextEditingController = null,
    Object? passwordTextEditingController = null,
    Object? isStayLoggedInChecked = null,
    Object? areAllTextFieldsValid = null,
    Object? isUserLoggedIn = null,
  }) {
    return _then(_value.copyWith(
      emailTextEditingController: null == emailTextEditingController
          ? _value.emailTextEditingController
          : emailTextEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordTextEditingController: null == passwordTextEditingController
          ? _value.passwordTextEditingController
          : passwordTextEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isStayLoggedInChecked: null == isStayLoggedInChecked
          ? _value.isStayLoggedInChecked
          : isStayLoggedInChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      areAllTextFieldsValid: null == areAllTextFieldsValid
          ? _value.areAllTextFieldsValid
          : areAllTextFieldsValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserLoggedIn: null == isUserLoggedIn
          ? _value.isUserLoggedIn
          : isUserLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
          _$SignInStateImpl value, $Res Function(_$SignInStateImpl) then) =
      __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController emailTextEditingController,
      TextEditingController passwordTextEditingController,
      bool isStayLoggedInChecked,
      bool areAllTextFieldsValid,
      bool isUserLoggedIn});
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
      _$SignInStateImpl _value, $Res Function(_$SignInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailTextEditingController = null,
    Object? passwordTextEditingController = null,
    Object? isStayLoggedInChecked = null,
    Object? areAllTextFieldsValid = null,
    Object? isUserLoggedIn = null,
  }) {
    return _then(_$SignInStateImpl(
      emailTextEditingController: null == emailTextEditingController
          ? _value.emailTextEditingController
          : emailTextEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordTextEditingController: null == passwordTextEditingController
          ? _value.passwordTextEditingController
          : passwordTextEditingController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isStayLoggedInChecked: null == isStayLoggedInChecked
          ? _value.isStayLoggedInChecked
          : isStayLoggedInChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      areAllTextFieldsValid: null == areAllTextFieldsValid
          ? _value.areAllTextFieldsValid
          : areAllTextFieldsValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserLoggedIn: null == isUserLoggedIn
          ? _value.isUserLoggedIn
          : isUserLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignInStateImpl implements _SignInState {
  const _$SignInStateImpl(
      {required this.emailTextEditingController,
      required this.passwordTextEditingController,
      this.isStayLoggedInChecked = false,
      this.areAllTextFieldsValid = false,
      this.isUserLoggedIn = false});

  @override
  final TextEditingController emailTextEditingController;
  @override
  final TextEditingController passwordTextEditingController;
  @override
  @JsonKey()
  final bool isStayLoggedInChecked;
  @override
  @JsonKey()
  final bool areAllTextFieldsValid;
  @override
  @JsonKey()
  final bool isUserLoggedIn;

  @override
  String toString() {
    return 'SignInState(emailTextEditingController: $emailTextEditingController, passwordTextEditingController: $passwordTextEditingController, isStayLoggedInChecked: $isStayLoggedInChecked, areAllTextFieldsValid: $areAllTextFieldsValid, isUserLoggedIn: $isUserLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.emailTextEditingController,
                    emailTextEditingController) ||
                other.emailTextEditingController ==
                    emailTextEditingController) &&
            (identical(other.passwordTextEditingController,
                    passwordTextEditingController) ||
                other.passwordTextEditingController ==
                    passwordTextEditingController) &&
            (identical(other.isStayLoggedInChecked, isStayLoggedInChecked) ||
                other.isStayLoggedInChecked == isStayLoggedInChecked) &&
            (identical(other.areAllTextFieldsValid, areAllTextFieldsValid) ||
                other.areAllTextFieldsValid == areAllTextFieldsValid) &&
            (identical(other.isUserLoggedIn, isUserLoggedIn) ||
                other.isUserLoggedIn == isUserLoggedIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailTextEditingController,
      passwordTextEditingController,
      isStayLoggedInChecked,
      areAllTextFieldsValid,
      isUserLoggedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  const factory _SignInState(
      {required final TextEditingController emailTextEditingController,
      required final TextEditingController passwordTextEditingController,
      final bool isStayLoggedInChecked,
      final bool areAllTextFieldsValid,
      final bool isUserLoggedIn}) = _$SignInStateImpl;

  @override
  TextEditingController get emailTextEditingController;
  @override
  TextEditingController get passwordTextEditingController;
  @override
  bool get isStayLoggedInChecked;
  @override
  bool get areAllTextFieldsValid;
  @override
  bool get isUserLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
