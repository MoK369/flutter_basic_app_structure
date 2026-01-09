import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'
    show ContentType, AwesomeSnackbarContent;
import 'package:flutter/material.dart';

import '../../main.dart';
import '../l10n/generated/app_localizations.dart' show AppLocalizations;

abstract class BaseStatelessWidget extends StatefulWidget {
  const BaseStatelessWidget({super.key});

  Widget build(BuildContext context, CommonDependency dependency);

  @override
  State<BaseStatelessWidget> createState() => _BaseStatelessWidgetState();
}

class _BaseStatelessWidgetState extends State<BaseStatelessWidget> {
  late CommonDependency dependency;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dependency = CommonDependency(
      AppLocalizations.of(context)!,
      Theme.of(context),
      MediaQuery.sizeOf(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, dependency);
  }
}

class CommonDependency {
  AppLocalizations appLocalizations;
  ThemeData theme;
  Size screenSize;

  CommonDependency(this.appLocalizations, this.theme, this.screenSize);

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
