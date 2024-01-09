import 'package:books_app_client/core/constants/secure_storage_constants.dart';
import 'package:books_app_client/features/authentication/data/repositories/secure_storage_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers/jwt_state_provider.dart';

final startupServiceProvider = Provider<StartupService>((ref) {
  final secureStorageRepository = ref.watch(secureStorageRepositoryProvider);
  return StartupServiceImpl(
    secureStorageRepository: secureStorageRepository,
    ref: ref,
  );
});

abstract class StartupService {
  Future<bool> isUserSignedIn();
}

class StartupServiceImpl implements StartupService {
  StartupServiceImpl({
    required this.secureStorageRepository,
    required this.ref,
  });
  final SecureStorageRepository secureStorageRepository;
  final Ref ref;

  @override
  Future<bool> isUserSignedIn() async {
    String? jwt = await secureStorageRepository.readData(
      SecureStorageConstants.jwt,
    );
    if (jwt != null) {
      ref.read(jwtStateProvider.notifier).state = jwt;
      return true;
    } else {
      return false;
    }
  }
}
