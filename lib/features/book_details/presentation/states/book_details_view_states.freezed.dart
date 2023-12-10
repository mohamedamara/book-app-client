// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_details_view_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookDetailsViewStates {
  AsyncValue<List<Review>> get bookReviews =>
      throw _privateConstructorUsedError;
  AsyncValue<Review?> get userReviewForThisBook =>
      throw _privateConstructorUsedError;
  AsyncValue<bool> get isBookInUserFavorites =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookDetailsViewStatesCopyWith<BookDetailsViewStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailsViewStatesCopyWith<$Res> {
  factory $BookDetailsViewStatesCopyWith(BookDetailsViewStates value,
          $Res Function(BookDetailsViewStates) then) =
      _$BookDetailsViewStatesCopyWithImpl<$Res, BookDetailsViewStates>;
  @useResult
  $Res call(
      {AsyncValue<List<Review>> bookReviews,
      AsyncValue<Review?> userReviewForThisBook,
      AsyncValue<bool> isBookInUserFavorites});
}

/// @nodoc
class _$BookDetailsViewStatesCopyWithImpl<$Res,
        $Val extends BookDetailsViewStates>
    implements $BookDetailsViewStatesCopyWith<$Res> {
  _$BookDetailsViewStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookReviews = null,
    Object? userReviewForThisBook = null,
    Object? isBookInUserFavorites = null,
  }) {
    return _then(_value.copyWith(
      bookReviews: null == bookReviews
          ? _value.bookReviews
          : bookReviews // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Review>>,
      userReviewForThisBook: null == userReviewForThisBook
          ? _value.userReviewForThisBook
          : userReviewForThisBook // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Review?>,
      isBookInUserFavorites: null == isBookInUserFavorites
          ? _value.isBookInUserFavorites
          : isBookInUserFavorites // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookDetailsViewStatesImplCopyWith<$Res>
    implements $BookDetailsViewStatesCopyWith<$Res> {
  factory _$$BookDetailsViewStatesImplCopyWith(
          _$BookDetailsViewStatesImpl value,
          $Res Function(_$BookDetailsViewStatesImpl) then) =
      __$$BookDetailsViewStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<Review>> bookReviews,
      AsyncValue<Review?> userReviewForThisBook,
      AsyncValue<bool> isBookInUserFavorites});
}

/// @nodoc
class __$$BookDetailsViewStatesImplCopyWithImpl<$Res>
    extends _$BookDetailsViewStatesCopyWithImpl<$Res,
        _$BookDetailsViewStatesImpl>
    implements _$$BookDetailsViewStatesImplCopyWith<$Res> {
  __$$BookDetailsViewStatesImplCopyWithImpl(_$BookDetailsViewStatesImpl _value,
      $Res Function(_$BookDetailsViewStatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookReviews = null,
    Object? userReviewForThisBook = null,
    Object? isBookInUserFavorites = null,
  }) {
    return _then(_$BookDetailsViewStatesImpl(
      bookReviews: null == bookReviews
          ? _value.bookReviews
          : bookReviews // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Review>>,
      userReviewForThisBook: null == userReviewForThisBook
          ? _value.userReviewForThisBook
          : userReviewForThisBook // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Review?>,
      isBookInUserFavorites: null == isBookInUserFavorites
          ? _value.isBookInUserFavorites
          : isBookInUserFavorites // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ));
  }
}

/// @nodoc

class _$BookDetailsViewStatesImpl implements _BookDetailsViewStates {
  const _$BookDetailsViewStatesImpl(
      {required this.bookReviews,
      required this.userReviewForThisBook,
      required this.isBookInUserFavorites});

  @override
  final AsyncValue<List<Review>> bookReviews;
  @override
  final AsyncValue<Review?> userReviewForThisBook;
  @override
  final AsyncValue<bool> isBookInUserFavorites;

  @override
  String toString() {
    return 'BookDetailsViewStates(bookReviews: $bookReviews, userReviewForThisBook: $userReviewForThisBook, isBookInUserFavorites: $isBookInUserFavorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailsViewStatesImpl &&
            (identical(other.bookReviews, bookReviews) ||
                other.bookReviews == bookReviews) &&
            (identical(other.userReviewForThisBook, userReviewForThisBook) ||
                other.userReviewForThisBook == userReviewForThisBook) &&
            (identical(other.isBookInUserFavorites, isBookInUserFavorites) ||
                other.isBookInUserFavorites == isBookInUserFavorites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bookReviews, userReviewForThisBook, isBookInUserFavorites);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDetailsViewStatesImplCopyWith<_$BookDetailsViewStatesImpl>
      get copyWith => __$$BookDetailsViewStatesImplCopyWithImpl<
          _$BookDetailsViewStatesImpl>(this, _$identity);
}

abstract class _BookDetailsViewStates implements BookDetailsViewStates {
  const factory _BookDetailsViewStates(
          {required final AsyncValue<List<Review>> bookReviews,
          required final AsyncValue<Review?> userReviewForThisBook,
          required final AsyncValue<bool> isBookInUserFavorites}) =
      _$BookDetailsViewStatesImpl;

  @override
  AsyncValue<List<Review>> get bookReviews;
  @override
  AsyncValue<Review?> get userReviewForThisBook;
  @override
  AsyncValue<bool> get isBookInUserFavorites;
  @override
  @JsonKey(ignore: true)
  _$$BookDetailsViewStatesImplCopyWith<_$BookDetailsViewStatesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
