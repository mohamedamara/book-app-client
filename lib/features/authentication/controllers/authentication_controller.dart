import 'package:books_app_client/core/models/failure.dart';
import 'package:books_app_client/features/authentication/services/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

final authenticationControllerProvider = StateNotifierProvider.autoDispose<
    AuthenticationController, AsyncValue<AuthenticationStatus>>((ref) {
  final authenticationService = ref.watch(authenticationServiceProvider);
  return AuthenticationController(
    initialAuthenticationStatus: const AsyncValue.data(
      AuthenticationStatus.unauthenticated,
    ),
    authenticationService: authenticationService,
  );
});

class AuthenticationController
    extends StateNotifier<AsyncValue<AuthenticationStatus>> {
  AuthenticationController({
    required this.initialAuthenticationStatus,
    required this.authenticationService,
  }) : super(initialAuthenticationStatus);

  final AuthenticationService authenticationService;
  final AsyncValue<AuthenticationStatus> initialAuthenticationStatus;

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      await authenticationService.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      state = const AsyncValue.data(AuthenticationStatus.authenticated);
    } on Failure catch (failure) {
      state = AsyncValue.error(failure, failure.stackTrace);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncValue.loading();
    try {
      await authenticationService.signIn(
        email: email,
        password: password,
      );
      state = const AsyncValue.data(AuthenticationStatus.authenticated);
    } on Failure catch (failure) {
      state = AsyncValue.error(failure, failure.stackTrace);
    }
  }
}
