import 'package:books_app_client/core/models/failure.dart';
import 'package:dio/dio.dart';

extension DioExceptionsExtension on DioException {
  Failure get toFailure {
    if (type == DioExceptionType.connectionError) {
      return Failure(
        message: 'No internet connection',
        stackTrace: stackTrace,
      );
    }
    if (type == DioExceptionType.connectionTimeout) {
      return Failure(
        message: 'Connection timeout',
        stackTrace: stackTrace,
      );
    }
    if (response?.statusCode == 401) {
      return Failure(
        message: 'Wrong credentials',
        stackTrace: stackTrace,
      );
    }
    return Failure(
      message: 'An error occurred',
      stackTrace: stackTrace,
    );
  }
}
