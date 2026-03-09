import 'package:flutter/material.dart' show ChangeNotifier, Locale;
import 'package:injectable/injectable.dart' show Named, singleton;

import '../../../../api/error/api_error_handler.dart';
import '../../../../di/injectable_initializer.dart' show getIt;
import '../../../../validation/validation_functions.dart';
import '../../../storage/constants/storage_constants.dart';
import '../../../storage/contracts/storage_service_contract.dart';
import '../../constants/l10n_constants.dart';
import '../../enums/languages_enum.dart';
import '../generated/app_localizations.dart' show AppLocalizations;

@singleton
class LocalizationManager extends ChangeNotifier {
  String _currentLocale;
  final StorageService _storageService;

  LocalizationManager(
    @Named(StorageConstants.secureStorage) this._storageService,
    @Named(L10nConstants.initCurrentLocal) this._currentLocale,
  );

  String get currentLocale {
    return _currentLocale;
  }

  Future<void> changeLocal(LanguagesEnum languageEnum) async {
    _currentLocale = languageEnum.getLanguageCode();
    final appLocalization = await AppLocalizations.delegate.load(
      Locale(languageEnum.getLanguageCode()),
    );
    if (getIt.isRegistered<AppLocalizations>()) {
      await getIt.unregister<AppLocalizations>();
    }
    getIt.registerSingleton<AppLocalizations>(appLocalization);
    getIt.get<ValidateFunctions>().appLocalizations = appLocalization;
    getIt.get<ApiErrorHandler>().appLocalizations = appLocalization;
    _saveLocal(languageEnum.getLanguageCode());
    notifyListeners();
  }

  void _saveLocal(String languageCode) {
    _storageService.setString(StorageConstants.localeKey, languageCode);
  }

  Future<String?> getSavedLocal() async {
    final savedLocale = await _storageService.getString(
      StorageConstants.localeKey,
    );
    return savedLocale;
  }

  bool get isEnglish => currentLocale == LanguagesEnum.en.getLanguageCode();
}
