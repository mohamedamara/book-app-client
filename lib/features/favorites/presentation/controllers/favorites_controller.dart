import 'package:books_app_client/core/exceptions/failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/favorites_repository.dart';
import '../states/favorites_view_states.dart';

final favoritesControllerProvider =
    StateNotifierProvider.autoDispose<FavoritesController, FavoritesViewStates>(
  (ref) {
    final favoritesRepository = ref.watch(favoritesRepositoryProvider);
    return FavoritesController(
      initialState: FavoritesViewStates.initial(),
      favoritesRepository: favoritesRepository,
    );
  },
);

class FavoritesController extends StateNotifier<FavoritesViewStates> {
  FavoritesController({
    required this.initialState,
    required this.favoritesRepository,
  }) : super(initialState) {
    getFavoritesBooks();
  }

  final FavoritesRepository favoritesRepository;
  final FavoritesViewStates initialState;

  Future<void> getFavoritesBooks() async {
    state = state.copyWith(favoriteBooks: const AsyncValue.loading());
    state = state.copyWith(
      favoriteBooks: await AsyncValue.guard(
        () => favoritesRepository.getFavoriteBooks(),
      ),
    );
  }

  Future<void> removeBookFromFavorites(String bookId) async {
    var favoriteBooksStateBeforeDeleting = state.favoriteBooks;
    state = state.copyWith(
      removeBookFromFavoritesResult: const AsyncData(false),
      favoriteBooks: AsyncValue.data(
        state.favoriteBooks.value!.where((book) => book.id != bookId).toList(),
      ),
    );
    try {
      await favoritesRepository.removeBookFromFavorites(bookId);
      state = state.copyWith(
        removeBookFromFavoritesResult: const AsyncData(true),
      );
    } on Failure catch (failure) {
      state = state.copyWith(
        favoriteBooks: favoriteBooksStateBeforeDeleting,
        removeBookFromFavoritesResult: AsyncValue.error(
          failure,
          failure.stackTrace,
        ),
      );
    }
  }
}
