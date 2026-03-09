// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../api/callers/dio/dio_service.dart' as _i530;
import '../api/error/api_error_handler.dart' as _i367;
import '../layers/localization/initializer/locale_initializer.dart' as _i806;
import '../layers/localization/l10n/generated/app_localizations.dart' as _i58;
import '../layers/localization/l10n/manager/localization_manager.dart' as _i362;
import '../layers/localization/l10n/register/app_localization_register.dart'
    as _i555;
import '../layers/storage/contracts/storage_service_contract.dart' as _i1003;
import '../layers/storage/implementation/flutter_secure_storage_service_imp.dart'
    as _i856;
import '../layers/storage/initializer/storage_initializer.dart' as _i272;
import '../layers/theme/initializer/theme_initializer.dart' as _i990;
import '../layers/theme/manager/theme_manager.dart' as _i701;
import '../validation/validation_functions.dart' as _i166;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storagesInitializer = _$StoragesInitializer();
    final dioService = _$DioService();
    final localeInitializer = _$LocaleInitializer();
    final themeInitializer = _$ThemeInitializer();
    final appLocalizationRegister = _$AppLocalizationRegister();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storagesInitializer.initSharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioService.getInstance());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
    );
    gh.lazySingleton<_i1003.StorageService>(
      () => _i856.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()),
      instanceName: 'secureStorage',
    );
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    await gh.factoryAsync<_i990.InitialTheme>(
      () => themeInitializer.getInitCurrentTheme(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
      instanceName: 'InitialCurrentTheme',
      preResolve: true,
    );
    gh.singleton<_i362.LocalizationManager>(
      () => _i362.LocalizationManager(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<String>(instanceName: 'initCurrentLocal'),
      ),
    );
    await gh.factoryAsync<_i58.AppLocalizations>(
      () => appLocalizationRegister.register(
        gh<String>(instanceName: 'initCurrentLocal'),
      ),
      preResolve: true,
    );
    gh.singleton<_i701.ThemeManager>(
      () => _i701.ThemeManager(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<_i990.InitialTheme>(instanceName: 'InitialCurrentTheme'),
      ),
    );
    gh.lazySingleton<_i367.ApiErrorHandler>(
      () => _i367.ApiErrorHandler(gh<_i58.AppLocalizations>()),
    );
    gh.lazySingleton<_i166.ValidateFunctions>(
      () => _i166.ValidateFunctions(gh<_i58.AppLocalizations>()),
    );
    return this;
  }
}

class _$StoragesInitializer extends _i272.StoragesInitializer {}

class _$DioService extends _i530.DioService {}

class _$LocaleInitializer extends _i806.LocaleInitializer {}

class _$ThemeInitializer extends _i990.ThemeInitializer {}

class _$AppLocalizationRegister extends _i555.AppLocalizationRegister {}
