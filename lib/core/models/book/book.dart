// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String author,
    required String contentURL,
    required String coverImageURL,
    required String genre,
    required DateTime publicationDate,
    required num rating,
  }) = _Book;

  factory Book.fromJson(Map<String, Object?> json) => _$BookFromJson(json);
}
