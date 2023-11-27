import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/book/book.dart';
import '../../data/repositories/search_repository.dart';
import '../views/widget/search_filter_view.dart';

final searchControllerProvider =
    StateNotifierProvider.autoDispose<SearchController, AsyncValue<List<Book>>>(
  (ref) {
    final searchRepository = ref.watch(searchRepositoryProvider);
    return SearchController(
      initialState: const AsyncValue.data([]),
      searchRepository: searchRepository,
    );
  },
);

class SearchController extends StateNotifier<AsyncValue<List<Book>>> {
  SearchController({
    required this.initialState,
    required this.searchRepository,
  }) : super(initialState);

  final SearchRepository searchRepository;
  final AsyncValue<List<Book>> initialState;

  Future<void> getSearchedBooks(String searchkeyword) async {
    state = const AsyncValue.loading();
    if (searchkeyword.isEmpty) {
      state = const AsyncValue.data([]);
    } else {
      state = await AsyncValue.guard(
        () => searchRepository.getSearchedBooks(searchkeyword),
      );
    }
  }

  Future<void> getFilteredBooks({
    required FilterBooksResult filterBooks,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => searchRepository.getFilteredBooks(filterBooks: filterBooks),
    );
  }
}
