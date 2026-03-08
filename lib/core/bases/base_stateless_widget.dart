import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    show ContentType, AwesomeSnackbarContent;
import 'package:flutter/material.dart';

import '../../main.dart';
import '../layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import '../layers/theme/extensions/app_typography.dart' show AppTypography;

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  Widget buildWith(BuildContext context, CommonDependency d);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final d = CommonDependency(
      AppLocalizations.of(context)!,
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

  AppTypography typography;
  Size screenSize;

  CommonDependency(
    this.appLocalizations,
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
