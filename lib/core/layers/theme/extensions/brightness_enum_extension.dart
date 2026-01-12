import 'package:flutter/material.dart' show Brightness;

extension BrightnessEnumExtension on Brightness {
  String getName() {
    return toString().split('.').toList()[1];
  }

  static Brightness getBrightnessValue(String strValue) {
    if (strValue == Brightness.light.getName()) {
      return Brightness.light;
    } else if (strValue == Brightness.dark.getName()) {
      return Brightness.dark;
    } else {
      throw Exception('Invalid Brightness value ❌');
    }
  }
}
