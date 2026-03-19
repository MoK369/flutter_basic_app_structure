// this repo is just as an example
import '../models/email/email_model.dart';
import 'db_base_repository.dart';

abstract interface class EmailRepository
    implements DbBaseRepository<EmailModel> {
  Future<EmailModel> getByTitle(String title);
}
