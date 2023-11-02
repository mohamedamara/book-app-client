import 'package:books_app_client/features/authentication/repositories/authentication_repository.dart';

class StubAuthenticationRepository implements AuthenticationRepository {
  final String _jwt = 'abcdefg';

  @override
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return Future.value(_jwt);
  }

  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) {
    return Future.value(_jwt);
  }
}
