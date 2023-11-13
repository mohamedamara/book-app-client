import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/home_repository.dart';
import '../../domain/home_data/home_data.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, AsyncValue<HomeData>>(
  (ref) {
    final homeRepository = ref.watch(homeRepositoryProvider);
    return HomeController(
      initialHomeData: AsyncValue.data(
        HomeData.empty(),
      ),
      homeRepository: homeRepository,
    );
  },
);

class HomeController extends StateNotifier<AsyncValue<HomeData>> {
  HomeController({
    required this.initialHomeData,
    required this.homeRepository,
  }) : super(initialHomeData) {
    getHomeData();
  }

  final HomeRepository homeRepository;
  final AsyncValue<HomeData> initialHomeData;

  Future<void> getHomeData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => homeRepository.getHomeData());
  }
}
