import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/review/review.dart';

part 'book_details_data.freezed.dart';
part 'book_details_data.g.dart';

@freezed
class BookDetailsData with _$BookDetailsData {
  const factory BookDetailsData({
    required List<Review> bookReviews,
    Review? userReviewForThisBook,
    required bool isBookInUserFavorites,
    required bool isBookInUserRecents,
  }) = _BookDetailsData;

  factory BookDetailsData.empty() {
    return const BookDetailsData(
      bookReviews: [],
      userReviewForThisBook: null,
      isBookInUserFavorites: false,
      isBookInUserRecents: false,
    );
  }

  factory BookDetailsData.fromJson(Map<String, Object?> json) =>
      _$BookDetailsDataFromJson(json);
}
