import 'package:books_app_client/features/home/domain/home_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/home_repository.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, AsyncValue<HomeData>>(
  (ref) {
    final homeRepository = ref.watch(homeRepositoryProvider);
    return HomeController(
      initialHomeData: const AsyncValue.data(
        HomeData(
          topBooks: [],
          recentlyViewedBooks: [],
        ),
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
