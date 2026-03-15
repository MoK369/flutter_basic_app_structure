import 'package:flutter/material.dart';

import '../../modules/home/home_screen.dart';
import 'defined_routes.dart' show DefinedRoutes;
import 'page_transitions.dart' show PageTransitions;

abstract class RoutingProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      final String? name = settings.name;
      //var args = settings.arguments;
      switch (name) {
        case DefinedRoutes.homeRoute:
          // MaterialPageRoute
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),

            /// executed during push (when the route is being shown) and pop (when it’s being dismissed)
            transitionsBuilder: PageTransitions.slideAndFade,

            /// This is important for testing
            settings: const RouteSettings(name: DefinedRoutes.homeRoute),
          );

        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static List<Route<dynamic>> generateInitialRoute(String initialRoute) {
    try {
      switch (initialRoute) {
        case DefinedRoutes.homeRoute:
          return [
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const HomeScreen(),
              transitionsBuilder: PageTransitions.slideAndFade,
            ),
          ];
        default:
          return [_errorRoute()];
      }
    } catch (e) {
      return [_errorRoute()];
    }
  }

  static Route<dynamic> _errorRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Material(
          child: Container(
            color: Colors.red,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionsBuilder: PageTransitions.slideAndFade,
    );
  }
}
