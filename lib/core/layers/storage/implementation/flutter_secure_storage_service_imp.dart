import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../functions/safe_print.dart' show safePrint;
import '../../../handlers/execution/execution_handler.dart';
import '../../../handlers/execution/execution_result.dart';
import '../constants/storage_constants.dart';
import '../contracts/flutter_secure_storage_service_contract.dart';

@Singleton(as: StorageService)
class SecureStorageServiceImp implements StorageService {
  final FlutterSecureStorage storageInstance;

  SecureStorageServiceImp(this.storageInstance);

  @override
  Future<void> setStringValue(String key, String value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.write(key: key, value: value),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<String?> getStringValue(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case ExecutionSuccess<String?>():
        return storageResult.data;
      case ExecutionError<String?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<void> deleteValue(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.delete(key: key),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorDeletingMessage(storageResult.error.toString()),
      );
    }
  }
}
