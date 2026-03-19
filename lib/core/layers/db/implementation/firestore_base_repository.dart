import 'package:cloud_firestore/cloud_firestore.dart';

import '../contracts/db_base_repository.dart';

abstract class FirestoreBaseRepository<T> implements DbBaseRepository<T> {
  FirebaseFirestore firestoreDb;
  CollectionReference<T> collectionReference;

  String? Function(T model) getId;

  Map<String, dynamic> Function(T model) toJson;

  FirestoreBaseRepository(
    this.firestoreDb,
    this.collectionReference,
    this.getId,
    this.toJson,
  );

  // --- Create ---
  @override
  Future<void> create(List<T> models) async {
    final batch = firestoreDb.batch();

    for (final model in models) {
      final doc = collectionReference.doc(getId(model));
      batch.set(doc, model);
    }

    return batch.commit();
  }

  // --- Read ---
  @override
  Future<T?> findById(String id) async =>
      (await collectionReference.doc(id).get()).data();

  @override
  Future<List<T>> findAll() async =>
      (await collectionReference.get()).docs.map((e) => e.data()).toList();

  // --- Update (partial by id) ---
  @override
  Future<void> updateById(String id, T updatedModel) async {
    return collectionReference.doc(id).update(toJson(updatedModel));
  }

  @override
  Future<void> updateManyByIds(List<String> ids, T updatedModel) async {
    final batch = firestoreDb.batch();

    for (final id in ids) {
      final docRef = collectionReference.doc(id);
      batch.update(docRef, toJson(updatedModel));
    }

    return batch.commit();
  }

  // --- Delete ---
  @override
  Future<void> delete(String id) async {
    return collectionReference.doc(id).delete();
  }

  @override
  Future<int> deleteAll() async {
    int deleted = 0;
    while (true) {
      final query = await collectionReference.limit(100).get();
      if (query.docs.isEmpty) break;

      final batch = FirebaseFirestore.instance.batch();

      for (final doc in query.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
      deleted += query.docs.length;
    }
    return deleted;
  }
}
