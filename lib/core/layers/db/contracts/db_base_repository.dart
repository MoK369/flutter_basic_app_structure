abstract interface class DbBaseRepository<T> {
  // --- create ---
  Future<void> create(List<T> models);

  // --- get ---
  Future<T?> findById(String id);

  Future<List<T>> findAll();

  // --- update ---
  Future<void> updateById(String id, T updatedModel);

  Future<void> updateManyByIds(List<String> ids, T updatedModel);

  // --- delete ---
  Future<void> delete(String id);

  Future<int> deleteAll();
}
