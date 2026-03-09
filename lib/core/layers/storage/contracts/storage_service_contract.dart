abstract interface class StorageService {
  void setInt(String key, int value);

  void setDouble(String key, double value);

  void setBool(String key, bool value);

  void setString(String key, String value);

  void setStringList(String key, List<String> value);

  Future<int?> getInt(String key);

  Future<double?> getDouble(String key);

  Future<bool?> getBool(String key);

  Future<String?> getString(String key);

  Future<List<String>?> getStringList(String key);

  Future<void> deleteValue(String key);

  Future<void> deleteAll();
}
