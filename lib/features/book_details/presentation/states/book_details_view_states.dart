import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/review/review.dart';

part 'book_details_view_states.freezed.dart';

@freezed
class BookDetailsViewStates with _$BookDetailsViewStates {
  const factory BookDetailsViewStates({
    required AsyncValue<List<Review>> bookReviews,
    required AsyncValue<Review?> userReviewForThisBook,
    required AsyncValue<bool> isBookInUserFavorites,
    required AsyncValue<bool> isBookInUserRecents,
  }) = _BookDetailsViewStates;

  factory BookDetailsViewStates.initial() {
    return const BookDetailsViewStates(
      bookReviews: AsyncValue.data([]),
      userReviewForThisBook: AsyncValue.data(null),
      isBookInUserFavorites: AsyncValue.data(false),
      isBookInUserRecents: AsyncValue.data(false),
    );
  }
}
