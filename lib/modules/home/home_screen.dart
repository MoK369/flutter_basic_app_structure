import 'package:flutter/material.dart';

import '../../core/bases/base_stateful_widget_state.dart';
import '../../core/layers/localization/enums/languages_enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Text(appLocalizations.cancel),
            FilledButton(
              onPressed: () {
                themeManager.changeTheme(
                  themeManager.currentTheme == Brightness.light
                      ? Brightness.dark
                      : Brightness.light,
                );
              },
              child: const Text('Change Theme'),
            ),
            FilledButton(
              onPressed: () async {
                await localizationManager.changeLocal(
                  localizationManager.currentLocale ==
                          LanguagesEnum.ar.getLanguageCode()
                      ? LanguagesEnum.en
                      : LanguagesEnum.ar,
                );
              },
              child: const Text('Change Local'),
            ),
          ],
        ),
      ),
    );
  }
}
