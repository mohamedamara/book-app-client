import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book/book.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required String reviewContent,
    required num reviewRating,
    required Book createdFor,
  }) = _Review;

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);
}
