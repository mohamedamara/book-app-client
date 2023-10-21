import 'package:books_app_client/features/authentication/services/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

final authenticationControllerProvider = StateNotifierProvider.autoDispose<
    AuthenticationController, AuthenticationStatus>((ref) {
  final authenticationService = ref.watch(authenticationServiceProvider);
  return AuthenticationController(
    initialAuthenticationStatus: AuthenticationStatus.unauthenticated,
    authenticationService: authenticationService,
  );
});

class AuthenticationController extends StateNotifier<AuthenticationStatus> {
  AuthenticationController({
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
