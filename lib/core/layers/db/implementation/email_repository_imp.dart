import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../contracts/email_repository.dart';
import '../models/email/email_model.dart';
import 'firestore_base_repository.dart';

@Injectable(as: EmailRepository)
class EmailRepositoryImp extends FirestoreBaseRepository<EmailModel>
    implements EmailRepository {
  EmailRepositoryImp(FirebaseFirestore firestoreDB)
    : super(
        firestoreDB,
        firestoreDB
            .collection('emails')
            .withConverter(
              fromFirestore: (snapshot, options) =>
                  EmailModel.fromJson(snapshot.data()),
              toFirestore: (emailModel, options) => emailModel.toJson(),
            ),
        (model) => model.id ?? model.hashCode.toString(),
        (model) => model.toJson(),
      );

  @override
  Future<EmailModel> getByTitle(String title) async {
    return (await collectionReference.where('title', isEqualTo: title).get())
        .docs
        .first
        .data();
  }
}
