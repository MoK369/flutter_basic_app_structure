import 'package:fit_ui/fit_ui.dart';
import 'package:flutter/material.dart';

import '../extensions/app_typography.dart';

abstract class AppThemeFactory {
  static ThemeData create({
    required Brightness brightness,
    required DeviceScreenType device,
    String? fontFamily,
  }) {
    final ColorScheme colorScheme = _getScheme(brightness);
    final typography = switch ((brightness, device)) {
      (Brightness.light, DeviceScreenType.mobile) => AppTypography.mobileLight(
        colorScheme,
        fontFamily: fontFamily,
      ),
      (Brightness.light, DeviceScreenType.tablet) => AppTypography.tabletLight(
        colorScheme,
        fontFamily: fontFamily,
      ),
      (Brightness.dark, DeviceScreenType.mobile) => AppTypography.mobileDark(
        colorScheme,
        fontFamily: fontFamily,
      ),
      (Brightness.dark, DeviceScreenType.tablet) => AppTypography.tabletDark(
        colorScheme,
        fontFamily: fontFamily,
      ),
      (_, _) => AppTypography.mobileLight(
        colorScheme,
        fontFamily: fontFamily,
      ), // Default
    };

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
        brightness: brightness,
      ),
      extensions: [typography],
    );
  }

  static ColorScheme _getScheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF83C5BE),
          onPrimary: Color(0xFF00363A),
          primaryContainer: Color(0xFF006D77),
          onPrimaryContainer: Color(0xFFB2DFDB),

          secondary: Color(0xFF90E0EF),
          onSecondary: Color(0xFF023047),
          secondaryContainer: Color(0xFF118AB2),
          onSecondaryContainer: Color(0xFFE0F7FA),

          tertiary: Color(0xFFFFB5C2),
          onTertiary: Color(0xFF5A001E),
          tertiaryContainer: Color(0xFFEF476F),
          onTertiaryContainer: Color(0xFFFFE4E8),

          error: Color(0xFFFCD8DF),
          onError: Color(0xFF37000B),
          errorContainer: Color(0xFFB00020),
          onErrorContainer: Color(0xFFFFEDEE),

          surface: Color(0xFF1E1E1E),
          onSurface: Color(0xFFE6E6E6),
          surfaceContainerHighest: Color(0xFF2C2C2C),
          onSurfaceVariant: Color(0xFFB0B0B0),

          outline: Color(0xFF8A8A8A),
          shadow: Color(0xFF000000),
          inverseSurface: Color(0xFFF8F9FA),
          onInverseSurface: Color(0xFF2C2C2C),
          inversePrimary: Color(0xFF006D77),
        );

      case Brightness.light:
        return const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF006D77),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFF83C5BE),
          onPrimaryContainer: Color(0xFF00363A),

          secondary: Color(0xFF118AB2),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color(0xFF90E0EF),
          onSecondaryContainer: Color(0xFF023047),

          tertiary: Color(0xFFEF476F),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFFFB5C2),
          onTertiaryContainer: Color(0xFF5A001E),

          error: Color(0xFFB00020),
          onError: Color(0xFFFFFFFF),
          errorContainer: Color(0xFFFCD8DF),
          onErrorContainer: Color(0xFF37000B),

          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF1C1C1C),
          surfaceContainerHighest: Color(0xFFE0E0E0),
          onSurfaceVariant: Color(0xFF4A4A4A),

          outline: Color(0xFF737373),
          shadow: Color(0xFF000000),
          inverseSurface: Color(0xFF2C2C2C),
          onInverseSurface: Color(0xFFF8F9FA),
          inversePrimary: Color(0xFFB2DFDB),
        );
    }
  }
}
