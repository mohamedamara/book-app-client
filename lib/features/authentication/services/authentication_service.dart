import 'package:books_app_client/core/network/jwt_state_provider.dart';
import 'package:books_app_client/features/authentication/repositories/authentication_repository.dart';
import 'package:books_app_client/features/authentication/repositories/secure_storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationServiceProvider = Provider<AuthenticationService>(
  (ref) {
    final authenticationRepository =
        ref.watch(authenticationRepositoryProvider);
    final secureStorageRepository = ref.watch(secureStorageRepositoryProvider);
    return AuthenticationServiceImpl(
      authenticationRepository: authenticationRepository,
      secureStorageRepository: secureStorageRepository,
      ref: ref,
    );
  },
);

abstract class AuthenticationService {
  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<bool> signIn({
    required String email,
    required String password,
  });
}

class AuthenticationServiceImpl implements AuthenticationService {
  AuthenticationServiceImpl({
    required this.authenticationRepository,
    required this.secureStorageRepository,
    required this.ref,
  });
  final AuthenticationRepository authenticationRepository;
  final SecureStorageRepository secureStorageRepository;
  final Ref ref;

  @override
  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> signIn({required String email, required String password}) async {
    final jwt = await authenticationRepository.signIn(
      email: email,
      password: password,
    );
    if (jwt.isNotEmpty) {
      secureStorageRepository.addData("jwt", jwt);
      ref.read(jwtStateProvider.notifier).state = jwt;
      return true;
    } else {
      return false;
    }
  }
}
