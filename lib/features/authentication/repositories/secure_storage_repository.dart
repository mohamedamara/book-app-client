import 'package:books_app_client/core/storage/secure_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageRepositoryProvider = Provider<SecureStorageRepository>(
  (ref) {
    final secureStorage = ref.watch(secureStorageProvider);
    return SecureStorageRepositoryImpl(secureStorage: secureStorage);
  },
);

abstract class SecureStorageRepository {
  Future<void> addData(String key, String value);
  Future<String?> readData(String key);
  Future<void> removeData(String key);
  Future<void> clearAllData();
}

class SecureStorageRepositoryImpl implements SecureStorageRepository {
  SecureStorageRepositoryImpl({required this.secureStorage});
  final FlutterSecureStorage secureStorage;

  @override
  Future<void> addData(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> readData(String key) async {
    return await secureStorage.read(key: key);
  }

  @override
  Future<void> removeData(String key) async {
    await secureStorage.delete(key: key);
  }

  @override
  Future<void> clearAllData() async {
    await secureStorage.deleteAll();
  }
}
