// ignore_for_file: prefer_const_constructors, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:visipay/Pages/menu/topup.dart';
import 'package:visipay/Pages/menu/transaksi/pdam.dart';
import 'package:visipay/Pages/onBoarding.dart';
import 'package:visipay/pages/auth/login.dart';
import 'package:visipay/pages/auth/register.dart';
import 'package:visipay/pages/menu/promo/DetailPromo.dart';
import 'package:visipay/pages/menu/promo/DaftarPromo.dart';
import 'package:visipay/pages/splashScreen.dart';
import 'package:visipay/pages/menu/pulsa/pulsa.dart';
import 'package:visipay/pages/status/StatusBerhasil.dart';
import 'package:visipay/pages/status/StatusGagal.dart';
import 'Pages/Home.dart';

abstract class IRouter {
  String get initialRoute;
  Route<dynamic> onGenerateRoute(RouteSettings settings);
  Route<dynamic> onUnknownRoute(RouteSettings settings);
}

class VisiPayRouter implements IRouter {
  @override
  String get initialRoute => "/home";

  @override
  Route onGenerateRoute(RouteSettings settings) {
    // print(settings.name);
    switch (settings.name) {
      case "/onboarding":
        return _buildRoute(builder: (_) => OnBoarding(), settings: settings);
      case "/register":
        return _buildRoute(builder: (_) => Register(), settings: settings);
      case "/splash":
        return _buildRoute(builder: (_) => SplashScreen(), settings: settings);
      case "/login":
        return _buildRoute(builder: (_) => Login(), settings: settings);
      case "/home":
        return _buildRoute(builder: (_) => Home(), settings: settings);
      case "/topup":
        return _buildRoute(builder: (_) => TopUp(), settings: settings);
      case "/pdam":
        return _buildRoute(builder: (_) => Pdam(), settings: settings);
      case "/daftarpromo":
        return _buildRoute(builder: (_) => DaftarPromo(), settings: settings);
      case "/detailpromo":
        return _buildRoute(builder: (_) => DetailPromo(), settings: settings);
      case "/pulsa":
        return _buildRoute(builder: (_) => IndexPulsa(), settings: settings);
      case "/berhasil":
        return _buildRoute(builder: (_) => Status(), settings: settings);
      case "/gagal":
        return _buildRoute(builder: (_) => StatusGagal(), settings: settings);
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