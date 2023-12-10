import 'package:books_app_client/features/book_details/data/repositories/book_details_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/failure.dart';
import '../states/book_details_view_states.dart';

final bookDetailsControllerProvider = StateNotifierProvider.autoDispose
    .family<BookDetailsController, BookDetailsViewStates, String>(
  (ref, bookId) {
    final bookDetailsRepository = ref.watch(bookDetailsRepositoryProvider);
    return BookDetailsController(
      initialState: BookDetailsViewStates.initial(),
      bookDetailsRepository: bookDetailsRepository,
      bookId: bookId,
    );
  },
);

class BookDetailsController extends StateNotifier<BookDetailsViewStates> {
  BookDetailsController({
    required this.initialState,
    required this.bookDetailsRepository,
    required this.bookId,
  }) : super(initialState) {
    getBookDetailsData(bookId: bookId);
  }

  final BookDetailsRepository bookDetailsRepository;
  final BookDetailsViewStates initialState;
  final String bookId;

  Future<void> getBookDetailsData({required String bookId}) async {
    state = state.copyWith(bookReviews: const AsyncValue.loading());
    try {
      var bookDetailsData = await bookDetailsRepository.getBookDetails(
        bookId: bookId,
      );
      state = state.copyWith(
        bookReviews: AsyncData(bookDetailsData.bookReviews),
        userReviewForThisBook: AsyncData(bookDetailsData.userReviewForThisBook),
        isBookInUserFavorites: AsyncData(bookDetailsData.isBookInUserFavorites),
      );
    } on Failure catch (failure) {
      state = state.copyWith(
        bookReviews: AsyncValue.error(failure, failure.stackTrace),
        userReviewForThisBook: const AsyncValue.data(null),
        isBookInUserFavorites: const AsyncValue.data(false),
      );
    }
  }

  Future<void> addBookToFavorites({required String bookId}) async {
    state = state.copyWith(isBookInUserFavorites: const AsyncValue.loading());
    state = state.copyWith(
      isBookInUserFavorites: await AsyncValue.guard(
        () => bookDetailsRepository.addBookToFavorites(bookId: bookId),
      ),
    );
  }

  Future<void> removeBookFromFavorites({required String bookId}) async {
    state = state.copyWith(isBookInUserFavorites: const AsyncValue.loading());
    state = state.copyWith(
      isBookInUserFavorites: await AsyncValue.guard(
        () => bookDetailsRepository.removeBookFromFavorites(bookId: bookId),
      ),
    );
  }

  Future<void> addReview({
    required String reviewContent,
    required num reviewRating,
    required String bookId,
  }) async {
    state = state.copyWith(
      userReviewForThisBook: const AsyncValue.loading(),
    );
    if (reviewContent.isEmpty) {
      var failure = Failure(
        message: 'Field cannot be empty',
        stackTrace: StackTrace.empty,
      );
      state = state.copyWith(
        userReviewForThisBook: AsyncValue.error(
          failure,
          failure.stackTrace,
        ),
      );
      return;
    }
    try {
      final review = await bookDetailsRepository.addReview(
        reviewContent: reviewContent,
        reviewRating: reviewRating,
        bookId: bookId,
      );
      state = state.copyWith(
        userReviewForThisBook: AsyncData(review),
        bookReviews: AsyncValue.data([...state.bookReviews.value!, review]),
      );
    } on Failure catch (failure) {
      state = state.copyWith(
        userReviewForThisBook: AsyncValue.error(
          failure,
          failure.stackTrace,
        ),
      );
    }
  }
}
