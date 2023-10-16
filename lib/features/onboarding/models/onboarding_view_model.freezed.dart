// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingViewModel {
  String get title => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingViewModelCopyWith<OnboardingViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingViewModelCopyWith<$Res> {
  factory $OnboardingViewModelCopyWith(
          OnboardingViewModel value, $Res Function(OnboardingViewModel) then) =
      _$OnboardingViewModelCopyWithImpl<$Res, OnboardingViewModel>;
  @useResult
  $Res call({String title, String subTitle, String imageURL});
}

/// @nodoc
class _$OnboardingViewModelCopyWithImpl<$Res, $Val extends OnboardingViewModel>
    implements $OnboardingViewModelCopyWith<$Res> {
  _$OnboardingViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subTitle = null,
    Object? imageURL = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingViewModelImplCopyWith<$Res>
    implements $OnboardingViewModelCopyWith<$Res> {
  factory _$$OnboardingViewModelImplCopyWith(_$OnboardingViewModelImpl value,
          $Res Function(_$OnboardingViewModelImpl) then) =
      __$$OnboardingViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String subTitle, String imageURL});
}

/// @nodoc
class __$$OnboardingViewModelImplCopyWithImpl<$Res>
    extends _$OnboardingViewModelCopyWithImpl<$Res, _$OnboardingViewModelImpl>
    implements _$$OnboardingViewModelImplCopyWith<$Res> {
  __$$OnboardingViewModelImplCopyWithImpl(_$OnboardingViewModelImpl _value,
      $Res Function(_$OnboardingViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subTitle = null,
    Object? imageURL = null,
  }) {
    return _then(_$OnboardingViewModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnboardingViewModelImpl implements _OnboardingViewModel {
  const _$OnboardingViewModelImpl(
      {required this.title, required this.subTitle, required this.imageURL});

  @override
  final String title;
  @override
  final String subTitle;
  @override
  final String imageURL;

  @override
  String toString() {
    return 'OnboardingViewModel(title: $title, subTitle: $subTitle, imageURL: $imageURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingViewModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle, imageURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingViewModelImplCopyWith<_$OnboardingViewModelImpl> get copyWith =>
      __$$OnboardingViewModelImplCopyWithImpl<_$OnboardingViewModelImpl>(
          this, _$identity);
}

abstract class _OnboardingViewModel implements OnboardingViewModel {
  const factory _OnboardingViewModel(
      {required final String title,
      required final String subTitle,
      required final String imageURL}) = _$OnboardingViewModelImpl;

  @override
  String get title;
  @override
  String get subTitle;
  @override
  String get imageURL;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingViewModelImplCopyWith<_$OnboardingViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
