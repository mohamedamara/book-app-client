import 'package:books_app_client/core/models/failure.dart';
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
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Failure(
          message: 'No internet connection',
          stackTrace: e.stackTrace,
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Failure(
          message: 'Connection timeout',
          stackTrace: e.stackTrace,
        );
      }
      throw Failure(
        message: 'An error occurred',
        stackTrace: e.stackTrace,
      );
    }
  }
}
