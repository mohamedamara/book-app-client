// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return _HomeData.fromJson(json);
}

/// @nodoc
mixin _$HomeData {
  List<Book> get topBooks => throw _privateConstructorUsedError;
  List<Book> get recentlyViewedBooks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeDataCopyWith<HomeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDataCopyWith<$Res> {
  factory $HomeDataCopyWith(HomeData value, $Res Function(HomeData) then) =
      _$HomeDataCopyWithImpl<$Res, HomeData>;
  @useResult
  $Res call({List<Book> topBooks, List<Book> recentlyViewedBooks});
}

/// @nodoc
class _$HomeDataCopyWithImpl<$Res, $Val extends HomeData>
    implements $HomeDataCopyWith<$Res> {
  _$HomeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topBooks = null,
    Object? recentlyViewedBooks = null,
  }) {
    return _then(_value.copyWith(
      topBooks: null == topBooks
          ? _value.topBooks
          : topBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      recentlyViewedBooks: null == recentlyViewedBooks
          ? _value.recentlyViewedBooks
          : recentlyViewedBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeDataImplCopyWith<$Res>
    implements $HomeDataCopyWith<$Res> {
  factory _$$HomeDataImplCopyWith(
          _$HomeDataImpl value, $Res Function(_$HomeDataImpl) then) =
      __$$HomeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Book> topBooks, List<Book> recentlyViewedBooks});
}

/// @nodoc
class __$$HomeDataImplCopyWithImpl<$Res>
    extends _$HomeDataCopyWithImpl<$Res, _$HomeDataImpl>
    implements _$$HomeDataImplCopyWith<$Res> {
  __$$HomeDataImplCopyWithImpl(
      _$HomeDataImpl _value, $Res Function(_$HomeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topBooks = null,
    Object? recentlyViewedBooks = null,
  }) {
    return _then(_$HomeDataImpl(
      topBooks: null == topBooks
          ? _value._topBooks
          : topBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      recentlyViewedBooks: null == recentlyViewedBooks
          ? _value._recentlyViewedBooks
          : recentlyViewedBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDataImpl implements _HomeData {
  const _$HomeDataImpl(
      {required final List<Book> topBooks,
      required final List<Book> recentlyViewedBooks})
      : _topBooks = topBooks,
        _recentlyViewedBooks = recentlyViewedBooks;

  factory _$HomeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeDataImplFromJson(json);

  final List<Book> _topBooks;
  @override
  List<Book> get topBooks {
    if (_topBooks is EqualUnmodifiableListView) return _topBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topBooks);
  }

  final List<Book> _recentlyViewedBooks;
  @override
  List<Book> get recentlyViewedBooks {
    if (_recentlyViewedBooks is EqualUnmodifiableListView)
      return _recentlyViewedBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentlyViewedBooks);
  }

  @override
  String toString() {
    return 'HomeData(topBooks: $topBooks, recentlyViewedBooks: $recentlyViewedBooks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDataImpl &&
            const DeepCollectionEquality().equals(other._topBooks, _topBooks) &&
            const DeepCollectionEquality()
                .equals(other._recentlyViewedBooks, _recentlyViewedBooks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topBooks),
      const DeepCollectionEquality().hash(_recentlyViewedBooks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      __$$HomeDataImplCopyWithImpl<_$HomeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDataImplToJson(
      this,
    );
  }
}

abstract class _HomeData implements HomeData {
  const factory _HomeData(
      {required final List<Book> topBooks,
      required final List<Book> recentlyViewedBooks}) = _$HomeDataImpl;

  factory _HomeData.fromJson(Map<String, dynamic> json) =
      _$HomeDataImpl.fromJson;

  @override
  List<Book> get topBooks;
  @override
  List<Book> get recentlyViewedBooks;
  @override
  @JsonKey(ignore: true)
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
