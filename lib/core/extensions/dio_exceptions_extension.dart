import 'dart:convert';

import 'package:books_app_client/core/exceptions/failure.dart';
import 'package:dio/dio.dart';

extension DioExceptionsExtension on DioException {
  Failure get failure {
    // authentication exceptions
    if (response?.statusCode == 401) {
      return Failure(
        message: 'Wrong email or password',
        stackTrace: stackTrace,
      );
    }
    if (response?.statusCode == 409) {
      var decodedResponse = jsonDecode(response.toString());
      return Failure(
        message: decodedResponse['message'],
        stackTrace: stackTrace,
      );
    }
    // network exceptions
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
    // default exception
    return Failure(
      message: 'An error occurred',
      stackTrace: stackTrace,
    );
  }
}
