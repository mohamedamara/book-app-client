import 'package:books_app_client/features/book_details/data/repositories/book_details_repository.dart';
import 'package:books_app_client/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../home/presentation/controllers/home_controller.dart';
import '../states/book_details_view_states.dart';

final bookDetailsControllerProvider = StateNotifierProvider.autoDispose
    .family<BookDetailsController, BookDetailsViewStates, String>(
  (ref, bookId) {
    final bookDetailsRepository = ref.watch(bookDetailsRepositoryProvider);
    final favoritesController = ref.watch(favoritesControllerProvider.notifier);
    final homeController = ref.watch(homeControllerProvider.notifier);
    return BookDetailsController(
      initialState: BookDetailsViewStates.initial(),
      bookDetailsRepository: bookDetailsRepository,
      bookId: bookId,
      favoritesController: favoritesController,
      homeController: homeController,
    );
  },
);

class BookDetailsController extends StateNotifier<BookDetailsViewStates> {
  BookDetailsController({
    required this.initialState,
    required this.bookDetailsRepository,
    required this.bookId,
    required this.favoritesController,
    required this.homeController,
  }) : super(initialState) {
    getBookDetailsData(bookId: bookId);
  }

  final BookDetailsRepository bookDetailsRepository;
  final BookDetailsViewStates initialState;
  final String bookId;
  final FavoritesController favoritesController;
  final HomeController homeController;

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
        isBookInUserRecents: AsyncData(bookDetailsData.isBookInUserRecents),
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
    try {
      final removeBookFromFavoritesResult =
          await bookDetailsRepository.addBookToFavorites(bookId: bookId);
      state = state.copyWith(
        isBookInUserFavorites: AsyncData(removeBookFromFavoritesResult),
      );
      favoritesController.getFavoritesBooks();
    } on Failure catch (failure) {
      state = state.copyWith(
        isBookInUserFavorites: AsyncValue.error(failure, failure.stackTrace),
      );
    }
  }

  Future<void> removeBookFromFavorites({required String bookId}) async {
    state = state.copyWith(isBookInUserFavorites: const AsyncValue.loading());
    try {
      final removeBookFromFavoritesResult =
          await bookDetailsRepository.removeBookFromFavorites(bookId: bookId);
      state = state.copyWith(
        isBookInUserFavorites: AsyncData(removeBookFromFavoritesResult),
      );
      favoritesController.getFavoritesBooks();
    } on Failure catch (failure) {
      state = state.copyWith(
        isBookInUserFavorites: AsyncValue.error(failure, failure.stackTrace),
      );
    }
  }

  Future<void> addReview({
    required String bookId,
    required String reviewContent,
    required num reviewRating,
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
        bookId: bookId,
        reviewContent: reviewContent,
        reviewRating: reviewRating,
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

  Future<void> addBookToRecents({required String bookId}) async {
    try {
      await bookDetailsRepository.addBookToRecents(
        bookId: bookId,
      );
      state = state.copyWith(
        isBookInUserRecents: const AsyncData(true),
      );
      homeController.getHomeData();
    } on Failure catch (_) {}
  }
}
