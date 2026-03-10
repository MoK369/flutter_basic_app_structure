abstract interface class DbBaseRepository<T> {
  // --- create ---
  Future<void> create(List<T> models);

  // --- get ---
  Future<T?> findById(int id);

  Future<List<T>> findAll();

  // --- update ---
  Future<bool> updateById(int id, void Function(T current) mutate);

  Future<int> updateManyByIds(List<int> ids, void Function(T current) mutate);

  // --- delete ---
  Future<bool> delete(int id);

  Future<int> deleteAll();
}
