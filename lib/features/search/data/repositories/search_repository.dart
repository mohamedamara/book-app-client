import 'package:books_app_client/core/extensions/dio_exceptions_extension.dart';
import 'package:books_app_client/core/models/book/book.dart';
import 'package:books_app_client/core/providers/dio_provider.dart';
import 'package:books_app_client/features/search/presentation/views/widget/filter_books_view.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchRepositoryProvider = Provider<SearchRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return SearchRepositoryImpl(dio: dio);
  },
);

abstract class SearchRepository {
  Future<List<Book>> getSearchedBooks(String searchkeyword);
  Future<List<Book>> getFilteredBooks({
    required FilterBooksResult filterBooks,
  });
}

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<Book>> getSearchedBooks(String searchkeyword) async {
    try {
      final response = await dio.get(
        'books',
        queryParameters: {
          'search-keyword': searchkeyword,
        },
      );
      List<Book> searchedBooks = List<Book>.from(
        response.data.map((book) => Book.fromJson(book)),
      );
      return searchedBooks;
    } on DioException catch (error) {
      throw error.failure;
    }
  }

  @override
  Future<List<Book>> getFilteredBooks({
    required FilterBooksResult filterBooks,
  }) async {
    try {
      final response = await dio.get(
        'books',
        queryParameters: {
          'rating': filterBooks.rating.value,
          'genre': filterBooks.genre.name,
          'sort-by': filterBooks.sort.value.sortBy,
          'sort-order': filterBooks.sort.value.sortOrder,
        },
      );
      List<Book> filteredBooks = List<Book>.from(
        response.data.map((book) => Book.fromJson(book)),
      );
      return filteredBooks;
    } on DioException catch (error) {
      throw error.failure;
    }
  }
}
