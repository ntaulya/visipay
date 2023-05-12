// ignore_for_file: prefer_const_constructors, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:visipay/pages/onBoarding.dart';
import 'package:visipay/pages/auth/login.dart';
import 'package:visipay/pages/auth/pin.dart';
import 'package:visipay/pages/splashScreen.dart';
import 'package:visipay/pages/auth/register.dart';
import 'package:visipay/pages/topup/index.dart';

import 'pages/menu/home.dart';

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
      case "/onboarding":
        return _buildRoute(builder: (_) => OnBoarding(), settings: settings);
      case "/splash":
        return _buildRoute(builder: (_) => SplashScreen(), settings: settings);
      case "/login":
        return _buildRoute(builder: (_) => Login(), settings: settings);
      case "/register":
        return _buildRoute(builder: (_) => Register(), settings: settings);
      case "/home":
        return _buildRoute(builder: (_) => Home(), settings: settings);
      case "/pin":
        return _buildRoute(builder: (_) => pin(), settings: settings);
      case "/topup":
        return _buildRoute(builder: (_) => IndexTopUp(), settings: settings);
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