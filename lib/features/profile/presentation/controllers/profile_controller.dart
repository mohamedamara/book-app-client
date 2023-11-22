import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/profile_repository.dart';
import '../../domain/profile_data/profile_data.dart';

final profileControllerProvider = StateNotifierProvider.autoDispose<
    ProfileController, AsyncValue<ProfileData>>(
  (ref) {
    final profileRepository = ref.watch(profileRepositoryProvider);
    return ProfileController(
      initialProfileData: AsyncValue.data(
        ProfileData.empty(),
      ),
      profileRepository: profileRepository,
    );
  },
);

class ProfileController extends StateNotifier<AsyncValue<ProfileData>> {
  ProfileController({
    required this.initialProfileData,
    required this.profileRepository,
  }) : super(initialProfileData) {
    getProfileData();
  }

  final ProfileRepository profileRepository;
  final AsyncValue<ProfileData> initialProfileData;

  Future<void> getProfileData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => profileRepository.getProfileData());
  }
}
