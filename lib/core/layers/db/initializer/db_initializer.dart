import 'package:injectable/injectable.dart' show module, preResolve;
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import '../models/email/email_model.dart';

@module
abstract class DbInitializer {
  @preResolve
  Future<Isar> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([EmailSchema], directory: dir.path);
  }
}
