import 'package:books_app_client/features/authentication/services/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/authentication_status.dart';

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, AuthenticationStatus>(
  (ref) {
    final authenticationService = ref.watch(authenticationServiceProvider);
    return SignInController(
      initialAuthenticationStatus: AuthenticationStatus.unauthenticated,
      authenticationService: authenticationService,
    );
  },
);

class SignInController extends StateNotifier<AuthenticationStatus> {
  SignInController({
    required this.initialAuthenticationStatus,
    required this.authenticationService,
  }) : super(initialAuthenticationStatus);

  final AuthenticationService authenticationService;
  final AuthenticationStatus initialAuthenticationStatus;

  Future<void> signIn({required String email, required String password}) async {
    final isSignInSuccess = await authenticationService.signIn(
      email: email,
      password: password,
    );
    if (isSignInSuccess) {
      state = AuthenticationStatus.authenticated;
    }
  }
}
