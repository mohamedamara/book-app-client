import 'package:books_app_client/core/models/failure.dart';
import 'package:books_app_client/features/home/data/repositories/home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/book.dart';

final homeServiceProvider = Provider<HomeService>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return HomeServiceImpl(
    homeRepository: homeRepository,
  );
});

abstract class HomeService {
  Future<({List<Book> topBooks, List<Book> recentlyViewedBooks})> getHomeData();
}

class HomeServiceImpl implements HomeService {
  HomeServiceImpl({
    required this.homeRepository,
  });
  final HomeRepository homeRepository;

  @override
  Future<({List<Book> topBooks, List<Book> recentlyViewedBooks})>
      getHomeData() async {
    try {
      final [topBooks, recentlyViewedBooks] = await Future.wait<List<Book>>(
        [
          homeRepository.getTopBooks(),
          homeRepository.getRecentlyViewedBooks(),
        ],
        eagerError: true,
      );

      return (
        topBooks: topBooks,
        recentlyViewedBooks: recentlyViewedBooks,
      );
    } on Failure catch (_) {
      rethrow;
    }
  }
}
