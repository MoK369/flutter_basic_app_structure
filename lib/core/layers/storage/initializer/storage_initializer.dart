import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class StoragesInitializer {
  // TODO: Always when using this app structure don't forget to decide which storage to use and remove the other one
  @lazySingleton
  FlutterSecureStorage initFlutterSecureStorage() {
    return FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
      iOptions: _getIosOptions(),
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions();

  IOSOptions _getIosOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  @preResolve
  Future<SharedPreferences> initSharedPreferences() {
    return SharedPreferences.getInstance();
  }
}
