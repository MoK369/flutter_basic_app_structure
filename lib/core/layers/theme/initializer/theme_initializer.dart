import 'package:flutter/material.dart' show Brightness;
import 'package:injectable/injectable.dart';

import '../../storage/constants/storage_constants.dart';
import '../../storage/contracts/flutter_secure_storage_service_contract.dart';
import '../constants/theme_constants.dart';
import '../extensions/brightness_enum_extension.dart';

@module
abstract class ThemeInitializer {
  @preResolve
  @Named(ThemeConstants.initCurrentTheme)
  Future<Brightness> getInitCurrentTheme(StorageService storageService) async {
    final savedTheme =
        (await storageService.getStringValue(StorageConstants.localeKey)) ??
        Brightness.light.getName();
    return BrightnessEnumExtension.getBrightnessValue(savedTheme);
  }
}
