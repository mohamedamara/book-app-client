// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingState {
  PageController get pageController => throw _privateConstructorUsedError;
  int get currentPageIndex => throw _privateConstructorUsedError;
  List<OnboardingViewModel> get onboardingViewsData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {PageController pageController,
      int currentPageIndex,
      List<OnboardingViewModel> onboardingViewsData});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageController = null,
    Object? currentPageIndex = null,
    Object? onboardingViewsData = null,
  }) {
    return _then(_value.copyWith(
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      currentPageIndex: null == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      onboardingViewsData: null == onboardingViewsData
          ? _value.onboardingViewsData
          : onboardingViewsData // ignore: cast_nullable_to_non_nullable
              as List<OnboardingViewModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageController pageController,
      int currentPageIndex,
      List<OnboardingViewModel> onboardingViewsData});
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageController = null,
    Object? currentPageIndex = null,
    Object? onboardingViewsData = null,
  }) {
    return _then(_$OnboardingStateImpl(
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
      currentPageIndex: null == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      onboardingViewsData: null == onboardingViewsData
          ? _value._onboardingViewsData
          : onboardingViewsData // ignore: cast_nullable_to_non_nullable
              as List<OnboardingViewModel>,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl implements _OnboardingState {
  const _$OnboardingStateImpl(
      {required this.pageController,
      this.currentPageIndex = 0,
      final List<OnboardingViewModel> onboardingViewsData = onboardingData})
      : _onboardingViewsData = onboardingViewsData;

  @override
  final PageController pageController;
  @override
  @JsonKey()
  final int currentPageIndex;
  final List<OnboardingViewModel> _onboardingViewsData;
  @override
  @JsonKey()
  List<OnboardingViewModel> get onboardingViewsData {
    if (_onboardingViewsData is EqualUnmodifiableListView)
      return _onboardingViewsData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onboardingViewsData);
  }

  @override
  String toString() {
    return 'OnboardingState(pageController: $pageController, currentPageIndex: $currentPageIndex, onboardingViewsData: $onboardingViewsData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController) &&
            (identical(other.currentPageIndex, currentPageIndex) ||
                other.currentPageIndex == currentPageIndex) &&
            const DeepCollectionEquality()
                .equals(other._onboardingViewsData, _onboardingViewsData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageController, currentPageIndex,
      const DeepCollectionEquality().hash(_onboardingViewsData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
          {required final PageController pageController,
          final int currentPageIndex,
          final List<OnboardingViewModel> onboardingViewsData}) =
      _$OnboardingStateImpl;

  @override
  PageController get pageController;
  @override
  int get currentPageIndex;
  @override
  List<OnboardingViewModel> get onboardingViewsData;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
