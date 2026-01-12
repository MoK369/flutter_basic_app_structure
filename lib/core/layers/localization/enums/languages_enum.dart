enum LanguagesEnum { en, ar }

extension LanguagesEnumExtension on LanguagesEnum {
  String getLanguageCode() {
    return toString().split('.').toList()[1];
  }

  String getLanguageName() {
    switch (this) {
      case LanguagesEnum.en:
        return 'English';
      case LanguagesEnum.ar:
        return 'العربية';
    }
  }
}
