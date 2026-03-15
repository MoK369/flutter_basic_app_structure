import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    show ContentType, AwesomeSnackbarContent;
import 'package:flutter/material.dart';

import '../../main.dart';
import '../di/injectable_initializer.dart' show getIt;
import '../layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import '../layers/localization/l10n/manager/localization_manager.dart'
    show LocalizationManager;
import '../layers/theme/extensions/app_typography.dart' show AppTypography;
import '../layers/theme/manager/theme_manager.dart' show ThemeManager;

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  Widget buildWith(BuildContext context, CommonDependency d);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final d = CommonDependency(
      getIt.get<AppLocalizations>(),
      getIt.get<LocalizationManager>(),
      getIt.get<ThemeManager>(),
      theme,
      MediaQuery.sizeOf(context),
      theme.extension<AppTypography>() ?? AppTypography.mobileBase,
    );
    return buildWith(context, d);
  }
}

class CommonDependency {
  AppLocalizations appLocalizations;
  ThemeData theme;

  LocalizationManager localizationManager;
  ThemeManager themeManager;

  AppTypography typography;
  Size screenSize;

  CommonDependency(
    this.appLocalizations,
    this.localizationManager,
    this.themeManager,
    this.theme,
    this.screenSize,
    this.typography,
  );

  void displaySnackBar({
    required ContentType contentType,
    required String title,
    String? message,
    int? durationInSeconds,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: Duration(seconds: durationInSeconds ?? 2),
      content: AwesomeSnackbarContent(
        title: title,
        titleTextStyle: theme.textTheme.titleMedium!.copyWith(
          color: Colors.white,
        ),
        message: message ?? '',
        messageTextStyle: theme.textTheme.labelMedium!.copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(globalNavigatorKey.currentContext!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
