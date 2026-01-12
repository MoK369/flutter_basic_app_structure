import 'package:flutter/material.dart' show Locale;
import 'package:injectable/injectable.dart' show Named, module, preResolve;

import '../../constants/l10n_constants.dart' show L10nConstants;
import '../generated/app_localizations.dart';

@module
abstract class AppLocalizationRegister {
  @preResolve
  Future<AppLocalizations> register(
    @Named(L10nConstants.initCurrentLocal) String initLocal,
  ) {
    return AppLocalizations.delegate.load(Locale(initLocal));
  }
}
