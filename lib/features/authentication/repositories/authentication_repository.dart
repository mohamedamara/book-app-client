import 'package:books_app_client/core/extensions/dio_exception_extension.dart';
import 'package:books_app_client/core/models/failure.dart';
import 'package:books_app_client/core/providers/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return AuthenticationRepositoryImpl(dio: dio);
  },
);

abstract class AuthenticationRepository {
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<String> signIn({
    required String email,
    required String password,
  });
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'users',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );
      String jwt = response.data['jwt'];
      return jwt;
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
      if (e.response?.statusCode == 401) {
        throw Failure(
          message: 'Wrong email or password',
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
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'auth',
        data: {
          'email': email,
          'password': password,
        },
      );
      String jwt = response.data['jwt'];
      return jwt;
    } on DioException catch (error) {
      throw error.toFailure;
    }
  }
}
