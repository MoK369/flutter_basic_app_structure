import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart' show Named, singleton;

import '../../../api/error/api_error_handler.dart';
import '../../../di/injectable_initializer.dart' show getIt;
import '../../../l10n/generated/app_localizations.dart';
import '../../../validation/validation_functions.dart';
import '../../storage/constants/storage_constants.dart';
import '../../storage/contracts/flutter_secure_storage_service_contract.dart';
import '../constants/l10n_constants.dart';
import '../enums/languages_enum.dart';

@singleton
class LocalizationManager extends ChangeNotifier {
  String currentLocale;
  final StorageService _storageService;

  LocalizationManager(
    this._storageService,
    @Named(L10nConstants.initCurrentLocal) this.currentLocale,
  );

  Future<void> changeLocal(LanguagesEnum languageEnum) async {
    currentLocale = languageEnum.getLanguageCode();
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
    _storageService.setStringValue(StorageConstants.localeKey, languageCode);
  }

  Future<String?> getSavedLocal() async {
    final savedLocale = await _storageService.getStringValue(
      StorageConstants.localeKey,
    );
    return savedLocale;
  }

  bool get isEnglish => currentLocale == LanguagesEnum.en.getLanguageCode();
}
