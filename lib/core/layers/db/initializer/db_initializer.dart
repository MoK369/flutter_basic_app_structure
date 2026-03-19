import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart' show module, lazySingleton;

@module
abstract class DbInitializer {
  @lazySingleton
  FirebaseFirestore getFirestoreInstance() {
    return FirebaseFirestore.instance;
  }
}
