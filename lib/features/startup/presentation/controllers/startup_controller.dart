import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../authentication/enums/authentication_status.dart';
import '../../application/services/startup_service.dart';

final startupControllerProvider = StateNotifierProvider.autoDispose<
    StartupController, AsyncValue<AuthenticationStatus>>((ref) {
  final startupService = ref.watch(startupServiceProvider);
  return StartupController(
    initialAuthenticationStatus: const AsyncValue.loading(),
    startupService: startupService,
  );
});

class StartupController
    extends StateNotifier<AsyncValue<AuthenticationStatus>> {
  StartupController({
    required this.initialAuthenticationStatus,
    required this.startupService,
  }) : super(initialAuthenticationStatus) {
    checkIfUserIsSignedIn();
  }

  final StartupService startupService;
  final AsyncValue<AuthenticationStatus> initialAuthenticationStatus;

  Future<void> checkIfUserIsSignedIn() async {
    final isUserSignedIn = await startupService.isUserSignedIn();
    if (isUserSignedIn) {
      state = const AsyncValue.data(AuthenticationStatus.authenticated);
    } else {
      state = const AsyncValue.data(AuthenticationStatus.unauthenticated);
    }
  }
}
