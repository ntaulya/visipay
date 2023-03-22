// ignore_for_file: prefer_const_constructors, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/splashScreen.dart';

abstract class IRouter {
  String get initialRoute;
  Route<dynamic> onGenerateRoute(RouteSettings settings);
  Route<dynamic> onUnknownRoute(RouteSettings settings);
}

class VisiPayRouter implements IRouter {
  @override
  String get initialRoute => "/splash";

  @override
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Example
      // case RouteUrl.ROUTE_NAME:
      //   return _buildRoute(
      //       builder: (_) => con=st ROUTE_NAME_PAGE(), settings: settings);
      case "/home":
        return _buildRoute(builder: (_) => HomeScreen(), settings: settings);
      case "/splash":
        return _buildRoute(builder: (_) => SplashScreen(), settings: settings);
      default:
        return onUnknownRoute(settings);
    }
  }

  @override
  Route onUnknownRoute(RouteSettings settings) {
    return _buildRoute(
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          );
        },
        settings: settings);
  }

  Route<dynamic> _buildRoute(
      {required Widget Function(BuildContext) builder,
      required RouteSettings settings}) {
    return MaterialPageRoute(settings: settings, builder: builder);
  }
}
