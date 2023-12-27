// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_view_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesViewStates {
  AsyncValue<List<Book>> get favoriteBooks =>
      throw _privateConstructorUsedError;
  AsyncValue<bool> get removeBookFromFavoritesResult =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesViewStatesCopyWith<FavoritesViewStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesViewStatesCopyWith<$Res> {
  factory $FavoritesViewStatesCopyWith(
          FavoritesViewStates value, $Res Function(FavoritesViewStates) then) =
      _$FavoritesViewStatesCopyWithImpl<$Res, FavoritesViewStates>;
  @useResult
  $Res call(
      {AsyncValue<List<Book>> favoriteBooks,
      AsyncValue<bool> removeBookFromFavoritesResult});
}

/// @nodoc
class _$FavoritesViewStatesCopyWithImpl<$Res, $Val extends FavoritesViewStates>
    implements $FavoritesViewStatesCopyWith<$Res> {
  _$FavoritesViewStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteBooks = null,
    Object? removeBookFromFavoritesResult = null,
  }) {
    return _then(_value.copyWith(
      favoriteBooks: null == favoriteBooks
          ? _value.favoriteBooks
          : favoriteBooks // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Book>>,
      removeBookFromFavoritesResult: null == removeBookFromFavoritesResult
          ? _value.removeBookFromFavoritesResult
          : removeBookFromFavoritesResult // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoritesViewStatesImplCopyWith<$Res>
    implements $FavoritesViewStatesCopyWith<$Res> {
  factory _$$FavoritesViewStatesImplCopyWith(_$FavoritesViewStatesImpl value,
          $Res Function(_$FavoritesViewStatesImpl) then) =
      __$$FavoritesViewStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<Book>> favoriteBooks,
      AsyncValue<bool> removeBookFromFavoritesResult});
}

/// @nodoc
class __$$FavoritesViewStatesImplCopyWithImpl<$Res>
    extends _$FavoritesViewStatesCopyWithImpl<$Res, _$FavoritesViewStatesImpl>
    implements _$$FavoritesViewStatesImplCopyWith<$Res> {
  __$$FavoritesViewStatesImplCopyWithImpl(_$FavoritesViewStatesImpl _value,
      $Res Function(_$FavoritesViewStatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteBooks = null,
    Object? removeBookFromFavoritesResult = null,
  }) {
    return _then(_$FavoritesViewStatesImpl(
      favoriteBooks: null == favoriteBooks
          ? _value.favoriteBooks
          : favoriteBooks // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Book>>,
      removeBookFromFavoritesResult: null == removeBookFromFavoritesResult
          ? _value.removeBookFromFavoritesResult
          : removeBookFromFavoritesResult // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ));
  }
}

/// @nodoc

class _$FavoritesViewStatesImpl implements _FavoritesViewStates {
  const _$FavoritesViewStatesImpl(
      {required this.favoriteBooks,
      required this.removeBookFromFavoritesResult});

  @override
  final AsyncValue<List<Book>> favoriteBooks;
  @override
  final AsyncValue<bool> removeBookFromFavoritesResult;

  @override
  String toString() {
    return 'FavoritesViewStates(favoriteBooks: $favoriteBooks, removeBookFromFavoritesResult: $removeBookFromFavoritesResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesViewStatesImpl &&
            (identical(other.favoriteBooks, favoriteBooks) ||
                other.favoriteBooks == favoriteBooks) &&
            (identical(other.removeBookFromFavoritesResult,
                    removeBookFromFavoritesResult) ||
                other.removeBookFromFavoritesResult ==
                    removeBookFromFavoritesResult));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, favoriteBooks, removeBookFromFavoritesResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesViewStatesImplCopyWith<_$FavoritesViewStatesImpl> get copyWith =>
      __$$FavoritesViewStatesImplCopyWithImpl<_$FavoritesViewStatesImpl>(
          this, _$identity);
}

abstract class _FavoritesViewStates implements FavoritesViewStates {
  const factory _FavoritesViewStates(
          {required final AsyncValue<List<Book>> favoriteBooks,
          required final AsyncValue<bool> removeBookFromFavoritesResult}) =
      _$FavoritesViewStatesImpl;

  @override
  AsyncValue<List<Book>> get favoriteBooks;
  @override
  AsyncValue<bool> get removeBookFromFavoritesResult;
  @override
  @JsonKey(ignore: true)
  _$$FavoritesViewStatesImplCopyWith<_$FavoritesViewStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
