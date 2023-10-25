import 'package:books_app_client/core/network/jwt_state_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final jwt = ref.watch(jwtStateProvider);
  final options = BaseOptions(
    baseUrl: 'http://10.0.2.2:5000/api/',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    headers: {if (jwt.isNotEmpty) 'Authorization': 'Bearer $jwt'},
  );
  return Dio(options);
});
