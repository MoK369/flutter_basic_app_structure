import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.hero,
    required this.title,
    required this.body,
    required this.label,
    required this.button,
  });

  final TextStyle hero;
  final TextStyle title;
  final TextStyle body;
  final TextStyle label;
  final TextStyle button;

  static const mobileBase = AppTypography(
    hero: TextStyle(
      fontSize: 34, // prominent but still phone-friendly
      fontWeight: FontWeight.w800,
      height: 1.15,
      letterSpacing: -0.25,
    ),
    title: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.30,
      letterSpacing: 0.10,
    ),
    body: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.50,
      letterSpacing: 0.25,
    ),
    label: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.40,
      letterSpacing: 0.50,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.20,
      letterSpacing: 0.10,
    ),
  );

  // TABLET: slightly larger, keeps density balanced for medium screens
  static const tabletBase = AppTypography(
    hero: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w800,
      height: 1.15,
      letterSpacing: -0.20,
    ),
    title: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.30,
      letterSpacing: 0.10,
    ),
    body: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.52,
      letterSpacing: 0.20,
    ),
    label: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.40,
      letterSpacing: 0.40,
    ),
    button: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.20,
      letterSpacing: 0.10,
    ),
  );

  // DESKTOP: more room, expressive display, relaxed body
  static const desktopBase = AppTypography(
    hero: TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w700,
      height: 1.15,
      letterSpacing: -0.15,
    ),
    title: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      height: 1.28,
      letterSpacing: 0.05,
    ),
    body: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.50,
      letterSpacing: 0.15,
    ),
    label: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.40,
      letterSpacing: 0.30,
    ),
    button: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.20,
      letterSpacing: 0.10,
    ),
  );

  AppTypography withColors(ColorScheme scheme, {bool forFilledButtons = true}) {
    final Color buttonColor = forFilledButtons
        ? scheme.onPrimary
        : scheme.primary;
    return AppTypography(
      hero: hero.copyWith(color: scheme.onSurface),
      title: title.copyWith(color: scheme.onSurface),
      // slightly lower contrast for long-form reading
      body: body.copyWith(color: scheme.onSurface.withAlpha(200)),
      label: label.copyWith(color: scheme.onSurfaceVariant),
      button: button.copyWith(color: buttonColor),
    );
  }

  AppTypography withFontFamily(String? fontFamily) {
    if (fontFamily == null) return this;
    TextStyle f(TextStyle s) => s.copyWith(fontFamily: fontFamily);
    return AppTypography(
      hero: f(hero),
      title: f(title),
      body: f(body),
      label: f(label),
      button: f(button),
    );
  }

  static AppTypography mobileLight(
    ColorScheme scheme, {
    String? fontFamily,
    bool forFilledButtons = true,
  }) => mobileBase
      .withFontFamily(fontFamily)
      .withColors(scheme, forFilledButtons: forFilledButtons);

  static AppTypography mobileDark(
    ColorScheme scheme, {
    String? fontFamily,
    bool forFilledButtons = true,
  }) => mobileBase
      .withFontFamily(fontFamily)
      .withColors(scheme, forFilledButtons: forFilledButtons);

  static AppTypography tabletLight(
    ColorScheme scheme, {
    String? fontFamily,
    bool forFilledButtons = true,
  }) => tabletBase
      .withFontFamily(fontFamily)
      .withColors(scheme, forFilledButtons: forFilledButtons);

  static AppTypography tabletDark(
    ColorScheme scheme, {
    String? fontFamily,
    bool forFilledButtons = true,
  }) => tabletBase
      .withFontFamily(fontFamily)
      .withColors(scheme, forFilledButtons: forFilledButtons);

  static AppTypography desktopLight(
    ColorScheme scheme, {
    String? fontFamily,
    bool forFilledButtons = true,
  }) => desktopBase
      .withFontFamily(fontFamily)
      .withColors(scheme, forFilledButtons: forFilledButtons);

  static AppTypography desktopDark(
    ColorScheme scheme, {
    String? fontFamily,
    bool forFilledButtons = true,
  }) => desktopBase
      .withFontFamily(fontFamily)
      .withColors(scheme, forFilledButtons: forFilledButtons);

  @override
  AppTypography copyWith({
    TextStyle? hero,
    TextStyle? title,
    TextStyle? body,
    TextStyle? label,
    TextStyle? button,
  }) {
    return AppTypography(
      hero: hero ?? this.hero,
      title: title ?? this.title,
      body: body ?? this.body,
      label: label ?? this.label,
      button: button ?? this.button,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) {
      return this;
    }
    return other;
  }
}
