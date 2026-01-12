import 'package:flutter/material.dart' show ChangeNotifier, Brightness;
import 'package:injectable/injectable.dart';

import '../../storage/constants/storage_constants.dart';
import '../../storage/contracts/flutter_secure_storage_service_contract.dart';
import '../constants/theme_constants.dart';
import '../extensions/brightness_enum_extension.dart';

@singleton
class ThemeManager extends ChangeNotifier {
  final StorageService _storageService;
  Brightness _currentTheme;

  ThemeManager(
    this._storageService,
    @Named(ThemeConstants.initCurrentTheme) this._currentTheme,
  );

  Brightness get currentTheme {
    return _currentTheme;
  }

  void changeTheme(Brightness newTheme) {
    _currentTheme = newTheme;
    _saveTheme();
    notifyListeners();
  }

  void _saveTheme() {
    _storageService.setStringValue(
      StorageConstants.themeKey,
      _currentTheme.getName(),
    );
  }
}
