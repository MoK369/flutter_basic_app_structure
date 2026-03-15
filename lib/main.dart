import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:provider/provider.dart'
    show MultiProvider, ChangeNotifierProvider, Consumer2;

import 'core/di/injectable_initializer.dart';
import 'core/functions/safe_print.dart';
import 'core/layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import 'core/layers/localization/l10n/manager/localization_manager.dart'
    show LocalizationManager;
import 'core/layers/theme/factory/app_theme_factory.dart' show AppThemeFactory;
import 'core/layers/theme/manager/theme_manager.dart';
import 'core/routing/routing_provider.dart';
import 'core/screen/custom_breakpoints.dart';
import 'modules/home/home_screen.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializations
  await configureDependencies();
  await dotenv.load(fileName: 'config/.env');

  runApp(const MyApp());
  Future.microtask(() => safePrint(''),);
  Future.delayed(Duration.zero, () async {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LocalizationManager>()),
        ChangeNotifierProvider(create: (_) => getIt<ThemeManager>()),
      ],
      child: Consumer2<LocalizationManager, ThemeManager>(
        builder: (context, l10nManager, themeManager, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: globalNavigatorKey,
            locale: Locale(l10nManager.currentLocale),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: RoutingProvider.generateRoute,
            builder: (context, child) {
              return Theme(
                data: AppThemeFactory.create(
                  brightness: themeManager.currentTheme,
                  device: CustomBreakpoints().of(context),
                ),
                child: child!,
              );
            },
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
