import 'package:injectable/injectable.dart' show LazySingleton, Named;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../functions/safe_print.dart' show safePrint;
import '../../../handlers/execution/execution_handler.dart'
    show ExecutionHandler;
import '../../../handlers/execution/execution_result.dart';
import '../constants/storage_constants.dart';
import '../contracts/storage_service_contract.dart';

@LazySingleton(as: StorageService)
@Named(StorageConstants.sharedPreferences)
class SharedPreferencesStorageServiceImp implements StorageService {
  final SharedPreferences storageInstance;

  SharedPreferencesStorageServiceImp(this.storageInstance);

  @override
  Future<void> setInt(String key, int value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.setInt(key, value),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> setDouble(String key, double value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.setDouble(key, value),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> setBool(String key, bool value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.setBool(key, value),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> setString(String key, String value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.setString(key, value),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.setStringList(key, value),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<int?> getInt(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.getInt(key),
    );
    switch (storageResult) {
      case ExecutionSuccess<int?>():
        return storageResult.data;
      case ExecutionError<int?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<double?> getDouble(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.getDouble(key),
    );
    switch (storageResult) {
      case ExecutionSuccess<double?>():
        return storageResult.data;
      case ExecutionError<double?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<bool?> getBool(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.getBool(key),
    );
    switch (storageResult) {
      case ExecutionSuccess<bool?>():
        return storageResult.data;
      case ExecutionError<bool?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<String?> getString(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.getString(key),
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
  Future<List<String>?> getStringList(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.getStringList(key),
    );
    switch (storageResult) {
      case ExecutionSuccess<List<String>?>():
        return storageResult.data;
      case ExecutionError<List<String>?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<void> deleteValue(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.remove(key),
    );
    if (storageResult is ExecutionError<bool>) {
      safePrint(
        StorageConstants.errorDeletingMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> deleteAll() async {
    final storageResult = await ExecutionHandler.execute(storageInstance.clear);
    if (storageResult is ExecutionError<bool>) {
      safePrint(
        StorageConstants.errorDeletingMessage(storageResult.error.toString()),
      );
    }
  }
}
