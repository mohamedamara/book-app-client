// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String get reviewContent => throw _privateConstructorUsedError;
  num get reviewRating => throw _privateConstructorUsedError;
  User? get createdBy => throw _privateConstructorUsedError;
  Book? get createdFor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String reviewContent,
      num reviewRating,
      User? createdBy,
      Book? createdFor});

  $UserCopyWith<$Res>? get createdBy;
  $BookCopyWith<$Res>? get createdFor;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewContent = null,
    Object? reviewRating = null,
    Object? createdBy = freezed,
    Object? createdFor = freezed,
  }) {
    return _then(_value.copyWith(
      reviewContent: null == reviewContent
          ? _value.reviewContent
          : reviewContent // ignore: cast_nullable_to_non_nullable
              as String,
      reviewRating: null == reviewRating
          ? _value.reviewRating
          : reviewRating // ignore: cast_nullable_to_non_nullable
              as num,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      createdFor: freezed == createdFor
          ? _value.createdFor
          : createdFor // ignore: cast_nullable_to_non_nullable
              as Book?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BookCopyWith<$Res>? get createdFor {
    if (_value.createdFor == null) {
      return null;
    }

    return $BookCopyWith<$Res>(_value.createdFor!, (value) {
      return _then(_value.copyWith(createdFor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reviewContent,
      num reviewRating,
      User? createdBy,
      Book? createdFor});

  @override
  $UserCopyWith<$Res>? get createdBy;
  @override
  $BookCopyWith<$Res>? get createdFor;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewContent = null,
    Object? reviewRating = null,
    Object? createdBy = freezed,
    Object? createdFor = freezed,
  }) {
    return _then(_$ReviewImpl(
      reviewContent: null == reviewContent
          ? _value.reviewContent
          : reviewContent // ignore: cast_nullable_to_non_nullable
              as String,
      reviewRating: null == reviewRating
          ? _value.reviewRating
          : reviewRating // ignore: cast_nullable_to_non_nullable
              as num,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User?,
      createdFor: freezed == createdFor
          ? _value.createdFor
          : createdFor // ignore: cast_nullable_to_non_nullable
              as Book?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl(
      {required this.reviewContent,
      required this.reviewRating,
      this.createdBy,
      this.createdFor});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final String reviewContent;
  @override
  final num reviewRating;
  @override
  final User? createdBy;
  @override
  final Book? createdFor;

  @override
  String toString() {
    return 'Review(reviewContent: $reviewContent, reviewRating: $reviewRating, createdBy: $createdBy, createdFor: $createdFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.reviewContent, reviewContent) ||
                other.reviewContent == reviewContent) &&
            (identical(other.reviewRating, reviewRating) ||
                other.reviewRating == reviewRating) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdFor, createdFor) ||
                other.createdFor == createdFor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, reviewContent, reviewRating, createdBy, createdFor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {required final String reviewContent,
      required final num reviewRating,
      final User? createdBy,
      final Book? createdFor}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String get reviewContent;
  @override
  num get reviewRating;
  @override
  User? get createdBy;
  @override
  Book? get createdFor;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
