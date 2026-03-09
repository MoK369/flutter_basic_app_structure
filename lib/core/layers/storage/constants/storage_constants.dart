abstract class StorageConstants {
  // storage options
  static const String secureStorage = 'secureStorage';
  static const String sharedPreferences = 'sharedPreferences';
  static const String rememberMeValueKey = 'rememberMeKey';
  static const String localeKey = 'AppLocal';
  static const String themeKey = 'AppTheme';
  static const String beginner = '67c797e226895f87ce0aa94b';
  static const String intermediate = '67c797e226895f87ce0aa94c';
  static const String advance = '67c797e226895f87ce0aa94e';

  static String errorStoringMessage(String error) {
    return 'Error Storing Value: $error';
  }

  static String errorReadingMessage(String error) {
    return 'Error Reading Value: $error';
  }

  static String errorDeletingMessage(String error) {
    return 'Error Deleting Value: $error';
  }
}
