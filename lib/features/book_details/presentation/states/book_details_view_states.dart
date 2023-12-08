import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/review/review.dart';

part 'book_details_view_states.freezed.dart';

@freezed
class BookDetailsViewStates with _$BookDetailsViewStates {
  const factory BookDetailsViewStates({
    required AsyncValue<List<Review>> bookReviews,
    required AsyncValue<bool> isBookReviewedByUser,
    required AsyncValue<bool> isBookInUserFavorites,
  }) = _BookDetailsViewStates;

  factory BookDetailsViewStates.initial() {
    return const BookDetailsViewStates(
      bookReviews: AsyncValue.data([]),
      isBookReviewedByUser: AsyncValue.data(false),
      isBookInUserFavorites: AsyncValue.data(false),
    );
  }
}
