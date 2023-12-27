// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  User get userInfo => throw _privateConstructorUsedError;
  List<Review> get userReviews => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) then) =
      _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call({User userInfo, List<Review> userReviews});

  $UserCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
    Object? userReviews = null,
  }) {
    return _then(_value.copyWith(
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      userReviews: null == userReviews
          ? _value.userReviews
          : userReviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get userInfo {
    return $UserCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileDataImplCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$ProfileDataImplCopyWith(
          _$ProfileDataImpl value, $Res Function(_$ProfileDataImpl) then) =
      __$$ProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User userInfo, List<Review> userReviews});

  @override
  $UserCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$ProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$ProfileDataImpl>
    implements _$$ProfileDataImplCopyWith<$Res> {
  __$$ProfileDataImplCopyWithImpl(
      _$ProfileDataImpl _value, $Res Function(_$ProfileDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
    Object? userReviews = null,
  }) {
    return _then(_$ProfileDataImpl(
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      userReviews: null == userReviews
          ? _value._userReviews
          : userReviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDataImpl implements _ProfileData {
  const _$ProfileDataImpl(
      {required this.userInfo, required final List<Review> userReviews})
      : _userReviews = userReviews;

  factory _$ProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDataImplFromJson(json);

  @override
  final User userInfo;
  final List<Review> _userReviews;
  @override
  List<Review> get userReviews {
    if (_userReviews is EqualUnmodifiableListView) return _userReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userReviews);
  }

  @override
  String toString() {
    return 'ProfileData(userInfo: $userInfo, userReviews: $userReviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            const DeepCollectionEquality()
                .equals(other._userReviews, _userReviews));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userInfo, const DeepCollectionEquality().hash(_userReviews));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      __$$ProfileDataImplCopyWithImpl<_$ProfileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileData implements ProfileData {
  const factory _ProfileData(
      {required final User userInfo,
      required final List<Review> userReviews}) = _$ProfileDataImpl;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$ProfileDataImpl.fromJson;

  @override
  User get userInfo;
  @override
  List<Review> get userReviews;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
