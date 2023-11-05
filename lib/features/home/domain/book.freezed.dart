// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get contentURL => throw _privateConstructorUsedError;
  String get coverImageURL => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;
  DateTime get publicationDate => throw _privateConstructorUsedError;
  int get readCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String title,
      String author,
      String contentURL,
      String coverImageURL,
      String genre,
      DateTime publicationDate,
      int readCount});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? contentURL = null,
    Object? coverImageURL = null,
    Object? genre = null,
    Object? publicationDate = null,
    Object? readCount = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      contentURL: null == contentURL
          ? _value.contentURL
          : contentURL // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageURL: null == coverImageURL
          ? _value.coverImageURL
          : coverImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      publicationDate: null == publicationDate
          ? _value.publicationDate
          : publicationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String author,
      String contentURL,
      String coverImageURL,
      String genre,
      DateTime publicationDate,
      int readCount});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? contentURL = null,
    Object? coverImageURL = null,
    Object? genre = null,
    Object? publicationDate = null,
    Object? readCount = null,
  }) {
    return _then(_$BookImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      contentURL: null == contentURL
          ? _value.contentURL
          : contentURL // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageURL: null == coverImageURL
          ? _value.coverImageURL
          : coverImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      publicationDate: null == publicationDate
          ? _value.publicationDate
          : publicationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readCount: null == readCount
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl implements _Book {
  const _$BookImpl(
      {required this.title,
      required this.author,
      required this.contentURL,
      required this.coverImageURL,
      required this.genre,
      required this.publicationDate,
      required this.readCount});

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final String title;
  @override
  final String author;
  @override
  final String contentURL;
  @override
  final String coverImageURL;
  @override
  final String genre;
  @override
  final DateTime publicationDate;
  @override
  final int readCount;

  @override
  String toString() {
    return 'Book(title: $title, author: $author, contentURL: $contentURL, coverImageURL: $coverImageURL, genre: $genre, publicationDate: $publicationDate, readCount: $readCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.contentURL, contentURL) ||
                other.contentURL == contentURL) &&
            (identical(other.coverImageURL, coverImageURL) ||
                other.coverImageURL == coverImageURL) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.publicationDate, publicationDate) ||
                other.publicationDate == publicationDate) &&
            (identical(other.readCount, readCount) ||
                other.readCount == readCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, author, contentURL,
      coverImageURL, genre, publicationDate, readCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final String title,
      required final String author,
      required final String contentURL,
      required final String coverImageURL,
      required final String genre,
      required final DateTime publicationDate,
      required final int readCount}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  String get title;
  @override
  String get author;
  @override
  String get contentURL;
  @override
  String get coverImageURL;
  @override
  String get genre;
  @override
  DateTime get publicationDate;
  @override
  int get readCount;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
