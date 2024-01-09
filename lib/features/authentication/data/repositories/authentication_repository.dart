import 'package:books_app_client/core/extensions/dio_exceptions_extension.dart';
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
    } on DioException catch (error) {
      throw error.failure;
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
      throw error.failure;
    }
  }
}
