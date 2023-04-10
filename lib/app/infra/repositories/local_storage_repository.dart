import 'package:firebase/app/shared/exceptions/local_storage_exception.dart';
import 'package:firebase/app/domain/interfaces/i_local_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageRepository implements ILocalStorage {
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  @override
  Future<bool> containsKey({required String key}) async {
    try {
      return await _flutterSecureStorage.containsKey(key: key);
    } catch (e) {
      throw LocalStorageException(
          '[ LocalStorageException ] - Failed to check if contains key');
    }
  }

  @override
  Future<void> deleteKey({required String key}) async {
    try {
      return await _flutterSecureStorage.delete(key: key);
    } catch (e) {
      throw LocalStorageException('[ LocalStorageException ] - ');
    }
  }

  @override
  Future<String?> readKey({required String key}) async {
    try {
      return await _flutterSecureStorage.read(key: key);
    } catch (e) {
      throw LocalStorageException('[ LocalStorageException ] - ');
    }
  }

  @override
  Future<void> write({required String key, required String value}) async {
    try {
      return await _flutterSecureStorage.write(key: key, value: value);
    } catch (e) {
      throw LocalStorageException('[ LocalStorageException ] - ');
    }
  }
}
