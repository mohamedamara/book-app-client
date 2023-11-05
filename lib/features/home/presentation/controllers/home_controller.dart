import 'package:books_app_client/core/models/failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/services/home_service.dart';
import '../states/home_state.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, AsyncValue<HomeState>>(
  (ref) {
    final homeService = ref.watch(homeServiceProvider);
    return HomeController(
      initialHomeData: const AsyncValue.data(
        HomeState(
          homeData: (
            topBooks: [],
            recentlyViewedBooks: [],
          ),
        ),
      ),
      homeService: homeService,
    );
  },
);

class HomeController extends StateNotifier<AsyncValue<HomeState>> {
  HomeController({
    required this.initialHomeData,
    required this.homeService,
  }) : super(initialHomeData) {
    getHomeData();
  }

  final HomeService homeService;
  final AsyncValue<HomeState> initialHomeData;

  Future<void> getHomeData() async {
    state = const AsyncValue.loading();
    try {
      final homeData = await homeService.getHomeData();
      state = AsyncValue.data(HomeState(homeData: homeData));
    } on Failure catch (failure) {
      state = AsyncValue.error(failure, failure.stackTrace);
    }
  }
}
