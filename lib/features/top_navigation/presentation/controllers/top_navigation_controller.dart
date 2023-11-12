import 'package:books_app_client/features/authentication/repositories/secure_storage_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final topNavigationControllerProvider = Provider<TopNavigationController>(
  (ref) {
    final secureStorageRepository = ref.watch(secureStorageRepositoryProvider);
    return TopNavigationController(
      secureStorageRepository: secureStorageRepository,
    );
  },
);

class TopNavigationController {
  TopNavigationController({
    required this.secureStorageRepository,
  });

  final SecureStorageRepository secureStorageRepository;

  Future<void> signOut() async {
    secureStorageRepository.clearAllData();
  }
}
