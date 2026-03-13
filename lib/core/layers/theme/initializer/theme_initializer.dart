import 'package:flutter/material.dart' show Brightness;
import 'package:injectable/injectable.dart';

import '../../storage/constants/storage_constants.dart';
import '../../storage/contracts/storage_service_contract.dart';
import '../constants/theme_constants.dart';
import '../extensions/brightness_enum_extension.dart';

@module
abstract class ThemeInitializer {
  @preResolve
  @Named(ThemeConstants.initCurrentTheme)
  Future<InitialTheme> getInitCurrentTheme(
    @Named(StorageConstants.secureStorage) StorageService storageService,
  ) async {
    final savedTheme =
        (await storageService.getString(StorageConstants.themeKey)) ??
        Brightness.light.getName();
    return InitialTheme(BrightnessEnumExtension.getBrightnessValue(savedTheme));
  }
}

class InitialTheme {
  Brightness theme;

  InitialTheme(this.theme);
}
