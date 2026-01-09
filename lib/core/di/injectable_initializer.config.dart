// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/error/api_error_handler.dart' as _i367;
import '../l10n/generated/app_localizations.dart' as _i735;
import '../l10n/register/app_localization_register.dart' as _i734;
import '../layers/localization/initializer/locale_initializer.dart' as _i806;
import '../layers/localization/l10n_manager/localization_manager.dart' as _i589;
import '../layers/storage/contracts/flutter_secure_storage_service_contract.dart'
    as _i349;
import '../layers/storage/implementation/flutter_secure_storage_service_imp.dart'
    as _i856;
import '../layers/storage/initializer/storage_initializer.dart' as _i272;
import '../validation/validation_functions.dart' as _i166;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storagesInitializer = _$StoragesInitializer();
    final localeInitializer = _$LocaleInitializer();
    final appLocalizationRegister = _$AppLocalizationRegister();
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.singleton<_i349.StorageService>(
      () => _i856.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()),
    );
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(gh<_i349.StorageService>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    gh.singleton<_i589.LocalizationManager>(
      () => _i589.LocalizationManager(
        gh<_i349.StorageService>(),
        gh<String>(instanceName: 'initCurrentLocal'),
      ),
    );
    await gh.factoryAsync<_i735.AppLocalizations>(
      () => appLocalizationRegister.register(
        gh<String>(instanceName: 'initCurrentLocal'),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i367.ApiErrorHandler>(
      () => _i367.ApiErrorHandler(gh<_i735.AppLocalizations>()),
    );
    gh.lazySingleton<_i166.ValidateFunctions>(
      () => _i166.ValidateFunctions(gh<_i735.AppLocalizations>()),
    );
    return this;
  }
}

class _$StoragesInitializer extends _i272.StoragesInitializer {}

class _$LocaleInitializer extends _i806.LocaleInitializer {}

class _$AppLocalizationRegister extends _i734.AppLocalizationRegister {}
