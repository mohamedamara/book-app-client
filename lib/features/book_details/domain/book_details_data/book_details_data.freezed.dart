// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_details_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookDetailsData _$BookDetailsDataFromJson(Map<String, dynamic> json) {
  return _BookDetailsData.fromJson(json);
}

/// @nodoc
mixin _$BookDetailsData {
  List<Review> get bookReviews => throw _privateConstructorUsedError;
  Review? get userReviewForThisBook => throw _privateConstructorUsedError;
  bool get isBookInUserFavorites => throw _privateConstructorUsedError;
  bool get isBookInUserRecents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookDetailsDataCopyWith<BookDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailsDataCopyWith<$Res> {
  factory $BookDetailsDataCopyWith(
          BookDetailsData value, $Res Function(BookDetailsData) then) =
      _$BookDetailsDataCopyWithImpl<$Res, BookDetailsData>;
  @useResult
  $Res call(
      {List<Review> bookReviews,
      Review? userReviewForThisBook,
      bool isBookInUserFavorites,
      bool isBookInUserRecents});

  $ReviewCopyWith<$Res>? get userReviewForThisBook;
}

/// @nodoc
class _$BookDetailsDataCopyWithImpl<$Res, $Val extends BookDetailsData>
    implements $BookDetailsDataCopyWith<$Res> {
  _$BookDetailsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookReviews = null,
    Object? userReviewForThisBook = freezed,
    Object? isBookInUserFavorites = null,
    Object? isBookInUserRecents = null,
  }) {
    return _then(_value.copyWith(
      bookReviews: null == bookReviews
          ? _value.bookReviews
          : bookReviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      userReviewForThisBook: freezed == userReviewForThisBook
          ? _value.userReviewForThisBook
          : userReviewForThisBook // ignore: cast_nullable_to_non_nullable
              as Review?,
      isBookInUserFavorites: null == isBookInUserFavorites
          ? _value.isBookInUserFavorites
          : isBookInUserFavorites // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookInUserRecents: null == isBookInUserRecents
          ? _value.isBookInUserRecents
          : isBookInUserRecents // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewCopyWith<$Res>? get userReviewForThisBook {
    if (_value.userReviewForThisBook == null) {
      return null;
    }

    return $ReviewCopyWith<$Res>(_value.userReviewForThisBook!, (value) {
      return _then(_value.copyWith(userReviewForThisBook: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookDetailsDataImplCopyWith<$Res>
    implements $BookDetailsDataCopyWith<$Res> {
  factory _$$BookDetailsDataImplCopyWith(_$BookDetailsDataImpl value,
          $Res Function(_$BookDetailsDataImpl) then) =
      __$$BookDetailsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Review> bookReviews,
      Review? userReviewForThisBook,
      bool isBookInUserFavorites,
      bool isBookInUserRecents});

  @override
  $ReviewCopyWith<$Res>? get userReviewForThisBook;
}

/// @nodoc
class __$$BookDetailsDataImplCopyWithImpl<$Res>
    extends _$BookDetailsDataCopyWithImpl<$Res, _$BookDetailsDataImpl>
    implements _$$BookDetailsDataImplCopyWith<$Res> {
  __$$BookDetailsDataImplCopyWithImpl(
      _$BookDetailsDataImpl _value, $Res Function(_$BookDetailsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookReviews = null,
    Object? userReviewForThisBook = freezed,
    Object? isBookInUserFavorites = null,
    Object? isBookInUserRecents = null,
  }) {
    return _then(_$BookDetailsDataImpl(
      bookReviews: null == bookReviews
          ? _value._bookReviews
          : bookReviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      userReviewForThisBook: freezed == userReviewForThisBook
          ? _value.userReviewForThisBook
          : userReviewForThisBook // ignore: cast_nullable_to_non_nullable
              as Review?,
      isBookInUserFavorites: null == isBookInUserFavorites
          ? _value.isBookInUserFavorites
          : isBookInUserFavorites // ignore: cast_nullable_to_non_nullable
              as bool,
      isBookInUserRecents: null == isBookInUserRecents
          ? _value.isBookInUserRecents
          : isBookInUserRecents // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookDetailsDataImpl implements _BookDetailsData {
  const _$BookDetailsDataImpl(
      {required final List<Review> bookReviews,
      this.userReviewForThisBook,
      required this.isBookInUserFavorites,
      required this.isBookInUserRecents})
      : _bookReviews = bookReviews;

  factory _$BookDetailsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookDetailsDataImplFromJson(json);

  final List<Review> _bookReviews;
  @override
  List<Review> get bookReviews {
    if (_bookReviews is EqualUnmodifiableListView) return _bookReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookReviews);
  }

  @override
  final Review? userReviewForThisBook;
  @override
  final bool isBookInUserFavorites;
  @override
  final bool isBookInUserRecents;

  @override
  String toString() {
    return 'BookDetailsData(bookReviews: $bookReviews, userReviewForThisBook: $userReviewForThisBook, isBookInUserFavorites: $isBookInUserFavorites, isBookInUserRecents: $isBookInUserRecents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailsDataImpl &&
            const DeepCollectionEquality()
                .equals(other._bookReviews, _bookReviews) &&
            (identical(other.userReviewForThisBook, userReviewForThisBook) ||
                other.userReviewForThisBook == userReviewForThisBook) &&
            (identical(other.isBookInUserFavorites, isBookInUserFavorites) ||
                other.isBookInUserFavorites == isBookInUserFavorites) &&
            (identical(other.isBookInUserRecents, isBookInUserRecents) ||
                other.isBookInUserRecents == isBookInUserRecents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookReviews),
      userReviewForThisBook,
      isBookInUserFavorites,
      isBookInUserRecents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDetailsDataImplCopyWith<_$BookDetailsDataImpl> get copyWith =>
      __$$BookDetailsDataImplCopyWithImpl<_$BookDetailsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookDetailsDataImplToJson(
      this,
    );
  }
}

abstract class _BookDetailsData implements BookDetailsData {
  const factory _BookDetailsData(
      {required final List<Review> bookReviews,
      final Review? userReviewForThisBook,
      required final bool isBookInUserFavorites,
      required final bool isBookInUserRecents}) = _$BookDetailsDataImpl;

  factory _BookDetailsData.fromJson(Map<String, dynamic> json) =
      _$BookDetailsDataImpl.fromJson;

  @override
  List<Review> get bookReviews;
  @override
  Review? get userReviewForThisBook;
  @override
  bool get isBookInUserFavorites;
  @override
  bool get isBookInUserRecents;
  @override
  @JsonKey(ignore: true)
  _$$BookDetailsDataImplCopyWith<_$BookDetailsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
