import 'package:isar_community/isar.dart'
    show Isar, IsarCollection, QueryExecute, QueryBuilder, QWhere;

import '../contracts/db_base_repository.dart';

abstract class IsarBaseRepository<T> implements DbBaseRepository<T> {
  late final Isar isar;
  late final IsarCollection<T> collection;

  IsarBaseRepository(this.isar, this.collection);

  // --- Create ---
  @override
  Future<List<int>> create(List<T> models) async {
    return isar.writeTxn(() async {
      return collection.putAll(models);
    });
  }

  // --- Read ---
  @override
  Future<T?> findById(int id) async => collection.get(id);

  @override
  Future<List<T>> findAll() async => collection.where().findAll();

  Future<List<T>> query(
    QueryBuilder<T, T, QWhere> Function(QueryBuilder<T, T, QWhere>) builder,
  ) async {
    final qb = builder(collection.where());
    return qb.findAll();
  }

  // --- Update (partial by id) ---
  @override
  Future<bool> updateById(int id, void Function(T current) mutate) async {
    return isar.writeTxn(() async {
      final current = await collection.get(id);
      if (current == null) return false;
      mutate(current);
      collection.put(current);
      return true;
    });
  }

  @override
  Future<int> updateManyByIds(
    List<int> ids,
    void Function(T current) mutate,
  ) async {
    return isar.writeTxn(() async {
      final items = await collection.getAll(ids);
      int updated = 0;
      for (final item in items) {
        if (item == null) continue;
        mutate(item);
        updated++;
      }
      if (updated > 0) {
        collection.putAll(items.whereType<T>().toList());
      }
      return updated;
    });
  }

  // --- Delete ---
  @override
  Future<bool> delete(int id) async {
    return isar.writeTxn(() async {
      return collection.delete(id);
    });
  }

  @override
  Future<int> deleteAll() async {
    return isar.writeTxn(() async {
      return collection.where().deleteAll();
    });
  }
}
