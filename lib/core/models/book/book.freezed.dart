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
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get contentOverview => throw _privateConstructorUsedError;
  String get contentURL => throw _privateConstructorUsedError;
  String get coverImageURL => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get numberOfPages => throw _privateConstructorUsedError;
  DateTime get publicationDate => throw _privateConstructorUsedError;
  num get rating => throw _privateConstructorUsedError;

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
      {@JsonKey(name: '_id') String id,
      String title,
      String author,
      String contentOverview,
      String contentURL,
      String coverImageURL,
      String genre,
      String language,
      int numberOfPages,
      DateTime publicationDate,
      num rating});
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
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? contentOverview = null,
    Object? contentURL = null,
    Object? coverImageURL = null,
    Object? genre = null,
    Object? language = null,
    Object? numberOfPages = null,
    Object? publicationDate = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      contentOverview: null == contentOverview
          ? _value.contentOverview
          : contentOverview // ignore: cast_nullable_to_non_nullable
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
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      publicationDate: null == publicationDate
          ? _value.publicationDate
          : publicationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
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
      {@JsonKey(name: '_id') String id,
      String title,
      String author,
      String contentOverview,
      String contentURL,
      String coverImageURL,
      String genre,
      String language,
      int numberOfPages,
      DateTime publicationDate,
      num rating});
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
    Object? id = null,
    Object? title = null,
    Object? author = null,
    Object? contentOverview = null,
    Object? contentURL = null,
    Object? coverImageURL = null,
    Object? genre = null,
    Object? language = null,
    Object? numberOfPages = null,
    Object? publicationDate = null,
    Object? rating = null,
  }) {
    return _then(_$BookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      contentOverview: null == contentOverview
          ? _value.contentOverview
          : contentOverview // ignore: cast_nullable_to_non_nullable
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
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      publicationDate: null == publicationDate
          ? _value.publicationDate
          : publicationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl implements _Book {
  const _$BookImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.author,
      required this.contentOverview,
      required this.contentURL,
      required this.coverImageURL,
      required this.genre,
      required this.language,
      required this.numberOfPages,
      required this.publicationDate,
      required this.rating});

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  @override
  final String author;
  @override
  final String contentOverview;
  @override
  final String contentURL;
  @override
  final String coverImageURL;
  @override
  final String genre;
  @override
  final String language;
  @override
  final int numberOfPages;
  @override
  final DateTime publicationDate;
  @override
  final num rating;

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, contentOverview: $contentOverview, contentURL: $contentURL, coverImageURL: $coverImageURL, genre: $genre, language: $language, numberOfPages: $numberOfPages, publicationDate: $publicationDate, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.contentOverview, contentOverview) ||
                other.contentOverview == contentOverview) &&
            (identical(other.contentURL, contentURL) ||
                other.contentURL == contentURL) &&
            (identical(other.coverImageURL, coverImageURL) ||
                other.coverImageURL == coverImageURL) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.numberOfPages, numberOfPages) ||
                other.numberOfPages == numberOfPages) &&
            (identical(other.publicationDate, publicationDate) ||
                other.publicationDate == publicationDate) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      author,
      contentOverview,
      contentURL,
      coverImageURL,
      genre,
      language,
      numberOfPages,
      publicationDate,
      rating);

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
      {@JsonKey(name: '_id') required final String id,
      required final String title,
      required final String author,
      required final String contentOverview,
      required final String contentURL,
      required final String coverImageURL,
      required final String genre,
      required final String language,
      required final int numberOfPages,
      required final DateTime publicationDate,
      required final num rating}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get title;
  @override
  String get author;
  @override
  String get contentOverview;
  @override
  String get contentURL;
  @override
  String get coverImageURL;
  @override
  String get genre;
  @override
  String get language;
  @override
  int get numberOfPages;
  @override
  DateTime get publicationDate;
  @override
  num get rating;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
