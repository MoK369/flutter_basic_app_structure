import 'package:injectable/injectable.dart';

import '../../storage/constants/storage_constants.dart';
import '../../storage/contracts/storage_service_contract.dart';
import '../constants/l10n_constants.dart';
import '../enums/languages_enum.dart';

@module
abstract class LocaleInitializer {
  @preResolve
  @Named(L10nConstants.initCurrentLocal)
  Future<String> initCurrentLocal(
    @Named(StorageConstants.secureStorage) StorageService storageService,
  ) async {
    final savedLocale = await storageService.getString(
      StorageConstants.localeKey,
    );
    return savedLocale ?? LanguagesEnum.en.getLanguageCode();
  }
}
