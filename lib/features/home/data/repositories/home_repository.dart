import 'package:books_app_client/core/models/failure.dart';
import 'package:books_app_client/core/providers/dio_provider.dart';
import 'package:books_app_client/features/home/domain/book.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return HomeRepositoryImpl(dio: dio);
  },
);

abstract class HomeRepository {
  Future<List<Book>> getTopBooks();
  Future<List<Book>> getRecentlyViewedBooks();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<Book>> getTopBooks() async {
    try {
      final response = await dio.get('books');
      final topBooks = List<Book>.from(
        response.data.map((element) => Book.fromJson(element)),
      );
      return topBooks;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Failure(
          message: 'No internet connection',
          stackTrace: e.stackTrace,
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Failure(
          message: 'Connection timeout',
          stackTrace: e.stackTrace,
        );
      }
      throw Failure(
        message: 'An error occurred',
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  Future<List<Book>> getRecentlyViewedBooks() async {
    try {
      final response = await dio.get('books');
      final topBooks = List<Book>.from(
        response.data.map((element) => Book.fromJson(element)),
      );
      return topBooks;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Failure(
          message: 'No internet connection',
          stackTrace: e.stackTrace,
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Failure(
          message: 'Connection timeout',
          stackTrace: e.stackTrace,
        );
      }
      throw Failure(
        message: 'An error occurred',
        stackTrace: e.stackTrace,
      );
    }
  }
}
