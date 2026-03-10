import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart' show Isar, QueryFilters, QueryExecute;

import '../contracts/email_repository.dart';
import '../models/email/email_model.dart';
import 'isar_base_repository.dart';

@Injectable(as: EmailRepository)
class EmailRepositoryImp extends IsarBaseRepository<Email>
    implements EmailRepository {
  EmailRepositoryImp(Isar isar) : super(isar, isar.emails);

  @override
  Future<Email?> findByTitle(String title) {
    return isar.emails.where().filter().titleEqualTo(title).findFirst();
  }
}
