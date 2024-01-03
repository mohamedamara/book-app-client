import 'package:books_app_client/core/extensions/dio_exceptions_extension.dart';
import 'package:books_app_client/core/models/book/book.dart';
import 'package:books_app_client/core/providers/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return FavoritesRepositoryImpl(dio: dio);
  },
);

abstract class FavoritesRepository {
  Future<List<Book>> getFavoriteBooks();
  Future<bool> removeBookFromFavorites(String bookId);
}

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<Book>> getFavoriteBooks() async {
    try {
      final response = await dio.get('favorite-books');
      List<Book> favoriteBooks = List<Book>.from(
        response.data.map((book) => Book.fromJson(book)),
      );
      return favoriteBooks;
    } on DioException catch (error) {
      throw error.failure;
    }
  }

  @override
  Future<bool> removeBookFromFavorites(String bookId) async {
    try {
      await dio.delete('favorite-books/$bookId');
      return true;
    } on DioException catch (error) {
      throw error.failure;
    }
  }
}
