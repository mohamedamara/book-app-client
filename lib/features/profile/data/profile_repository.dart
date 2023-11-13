import 'package:books_app_client/core/extensions/dio_exception_extension.dart';
import 'package:books_app_client/core/providers/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/profile_data/profile_data.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);
    return ProfileRepositoryImpl(dio: dio);
  },
);

abstract class ProfileRepository {
  Future<ProfileData> getProfileData();
}

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<ProfileData> getProfileData() async {
    try {
      final response = await dio.get('users');
      final profileData = ProfileData.fromJson(response.data);
      return profileData;
    } on DioException catch (error) {
      throw error.failure;
    }
  }
}
