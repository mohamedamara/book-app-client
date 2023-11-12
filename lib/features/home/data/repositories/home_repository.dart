import 'package:books_app_client/core/extensions/dio_exception_extension.dart';
import 'package:books_app_client/core/providers/dio_provider.dart';
import 'package:books_app_client/features/home/domain/home_data.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return HomeRepositoryImpl(dio: dio);
  },
);

abstract class HomeRepository {
  Future<HomeData> getHomeData();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<HomeData> getHomeData() async {
    try {
      final response = await dio.get('books');
      final homeData = HomeData.fromJson(response.data);
      return homeData;
    } on DioException catch (error) {
      throw error.failure;
    }
  }
}
