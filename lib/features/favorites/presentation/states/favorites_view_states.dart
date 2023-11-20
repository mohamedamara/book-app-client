import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/book/book.dart';

part 'favorites_view_states.freezed.dart';

@freezed
class FavoritesViewStates with _$FavoritesViewStates {
  const factory FavoritesViewStates({
    required AsyncValue<List<Book>> favoriteBooks,
    required AsyncValue<bool> removeBookFromFavoritesResult,
  }) = _FavoritesViewStates;

  factory FavoritesViewStates.initial() {
    return const FavoritesViewStates(
      favoriteBooks: AsyncValue.data([]),
      removeBookFromFavoritesResult: AsyncValue.data(false),
    );
  }
}
