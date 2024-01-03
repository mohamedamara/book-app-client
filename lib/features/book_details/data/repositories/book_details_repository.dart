import 'package:books_app_client/core/extensions/dio_exceptions_extension.dart';
import 'package:books_app_client/core/providers/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/review/review.dart';
import '../../domain/book_details_data/book_details_data.dart';

final bookDetailsRepositoryProvider = Provider<BookDetailsRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return BookDetailsRepositoryImpl(dio: dio);
  },
);

abstract class BookDetailsRepository {
  Future<BookDetailsData> getBookDetails({required String bookId});
  Future<bool> addBookToFavorites({required String bookId});
  Future<bool> removeBookFromFavorites({required String bookId});
  Future<Review> addReview({
    required String bookId,
    required String reviewContent,
    required num reviewRating,
  });
  Future<bool> addBookToRecents({required String bookId});
}

class BookDetailsRepositoryImpl implements BookDetailsRepository {
  BookDetailsRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<BookDetailsData> getBookDetails({required String bookId}) async {
    try {
      final response = await dio.get('books/$bookId/book-details');
      final bookDetailsData = BookDetailsData.fromJson(response.data);
      return bookDetailsData;
    } on DioException catch (error) {
      throw error.failure;
    }
  }

  @override
  Future<bool> addBookToFavorites({required String bookId}) async {
    try {
      await dio.post('favorite-books/$bookId');
      return true;
    } on DioException catch (error) {
      throw error.failure;
    }
  }

  @override
  Future<bool> removeBookFromFavorites({required String bookId}) async {
    try {
      await dio.delete('favorite-books/$bookId');
      return false;
    } on DioException catch (error) {
      throw error.failure;
    }
  }

  @override
  Future<Review> addReview({
    required String bookId,
    required String reviewContent,
    required num reviewRating,
  }) async {
    try {
      final response = await dio.post(
        'reviews',
        data: {
          'bookId': bookId,
          'reviewContent': reviewContent,
          'reviewRating': reviewRating,
        },
      );
      final reviewData = Review.fromJson(response.data);
      return reviewData;
    } on DioException catch (error) {
      throw error.failure;
    }
  }

  @override
  Future<bool> addBookToRecents({required String bookId}) async {
    try {
      await dio.post('recently-viewed-books/$bookId');
      return true;
    } on DioException catch (error) {
      throw error.failure;
    }
  }
}
