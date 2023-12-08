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
        isBookReviewedByUser: AsyncData(bookDetailsData.isBookReviewedByUser),
        isBookInUserFavorites: AsyncData(bookDetailsData.isBookInUserFavorites),
      );
    } on Failure catch (failure) {
      state = state.copyWith(
        bookReviews: AsyncValue.error(failure, failure.stackTrace),
        isBookReviewedByUser: const AsyncValue.data(false),
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
    // try {
    //   await bookDetailsRepository.addBookToFavorites(bookId: bookId);
    //   state = state.copyWith(
    //     isBookInUserFavorites: const AsyncData(true),
    //   );
    // } on Failure catch (failure) {
    //   state = state.copyWith(
    //     isBookInUserFavorites: AsyncValue.error(
    //       failure,
    //       failure.stackTrace,
    //     ),
    //   );
    // }
  }

  Future<void> removeBookFromFavorites({required String bookId}) async {
    state = state.copyWith(isBookInUserFavorites: const AsyncValue.loading());
    state = state.copyWith(
      isBookInUserFavorites: await AsyncValue.guard(
        () => bookDetailsRepository.removeBookFromFavorites(bookId: bookId),
      ),
    );
    // try {
    //   await bookDetailsRepository.removeBookFromFavorites(bookId: bookId);
    //   state = state.copyWith(
    //     isBookInUserFavorites: const AsyncData(false),
    //   );
    // } on Failure catch (failure) {
    //   state = state.copyWith(
    //     isBookInUserFavorites: AsyncValue.error(
    //       failure,
    //       failure.stackTrace,
    //     ),
    //   );
    // }
  }

  Future<void> addReview({
    required String reviewContent,
    required num reviewRating,
    required String bookId,
  }) async {
    state = state.copyWith(
      isBookReviewedByUser: const AsyncValue.loading(),
    );
    if (reviewContent.isEmpty) {
      var failure = Failure(
        message: 'Field cannot be empty',
        stackTrace: StackTrace.empty,
      );
      state = state.copyWith(
        isBookReviewedByUser: AsyncValue.error(
          failure,
          failure.stackTrace,
        ),
      );
      return;
    }
    state = state.copyWith(
      isBookReviewedByUser: await AsyncValue.guard(
        () => bookDetailsRepository.addReview(
          reviewContent: reviewContent,
          reviewRating: reviewRating,
          bookId: bookId,
        ),
      ),
    );
    // try {
    //   await bookDetailsRepository.addReview(
    //     reviewContent: reviewContent,
    //     reviewRating: 4,
    //     bookId: bookId,
    //   );
    //   state = state.copyWith(
    //     isBookReviewedByUser: const AsyncData(true),
    //   );
    // } on Failure catch (failure) {
    //   state = state.copyWith(
    //     isBookReviewedByUser: AsyncValue.error(
    //       failure,
    //       failure.stackTrace,
    //     ),
    //   );
    // }
  }
}
