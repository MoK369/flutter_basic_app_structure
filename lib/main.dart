import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart'
    show MultiProvider, ChangeNotifierProvider, Consumer;

import 'core/di/injectable_initializer.dart';
import 'core/l10n/generated/app_localizations.dart' show AppLocalizations;
import 'core/layers/localization/l10n_manager/localization_manager.dart'
    show LocalizationManager;
import 'core/routing/routing_provider.dart';
import 'core/screen/custom_breakpoints.dart';
import 'core/theme/factory/app_theme_factory.dart';
import 'modules/home/home_screen.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await dotenv.load(fileName: 'config/.env');

  runApp(const MyApp());
  Future.delayed(Duration.zero, () async {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LocalizationManager>()),
      ],
      child: Consumer<LocalizationManager>(
        builder: (context, l10nManager, child) {
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
                  brightness: Brightness.light,
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
