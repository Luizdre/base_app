abstract class ILocalStorage {
  Future<bool> containsKey({required String key});

  Future<void> deleteKey({required String key});

  Future<String?> readKey({required String key});

  Future<void> write({required String key, required String value});
}
