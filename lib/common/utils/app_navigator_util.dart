import 'package:flutter/material.dart';
import 'package:rgt_assessment/src/home/screens/home_screen.dart';

class AppNavigatorUtil {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Page Not Found!', style: TextStyle(fontSize: 16)),
        ),
      );
    });
  }

  static Future<Object?> pushNamed(BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed(context, routeName, arguments: arguments);

  static Future<Object?> pushReplacementNamed(
          BuildContext context, String routeName,
          {Object? arguments, Object? result}) =>
      Navigator.pushReplacementNamed(context, routeName,
          arguments: arguments, result: result);

  static Future<Object?> pushNamedAndRemoveUntil(
    BuildContext context,
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        predicate,
        arguments: arguments,
      );

  static void pop(BuildContext context, [Object? result]) =>
      Navigator.pop(context, result);

  static NavigatorState of(BuildContext context, {bool rootNavigator = false}) =>
      Navigator.of(context, rootNavigator: rootNavigator);

  static Future<Object?> popAndPushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
    Object? result,
  }) =>
      Navigator.popAndPushNamed(
        context,
        routeName,
        arguments: arguments,
        result: result,
      );
}

class AppRoute {
  static const home = 'home';
}
