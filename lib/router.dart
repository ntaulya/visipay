// ignore_for_file: prefer_const_constructors, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:visipay/pages/menu/promo/deskripsi_promo.dart';
import 'package:visipay/pages/menu/promo/detail_promo.dart';
import 'package:visipay/pages/menu/pulsa/pilih_promo.dart';
import 'package:visipay/pages/menu/pulsa/promo_terpilih.dart';
import 'package:visipay/pages/onBoarding.dart';
import 'package:visipay/pages/auth/login.dart';
import 'package:visipay/pages/auth/pin.dart';
import 'package:visipay/pages/splashScreen.dart';
import 'package:visipay/pages/auth/register.dart';
import 'package:visipay/pages/menu/topup/index.dart';
import 'package:visipay/pages/menu/topup/virtual_account.dart';
import 'package:visipay/pages/menu/pulsa/pulsa.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';

import 'pages/menu/home.dart';

abstract class IRouter {
  String get initialRoute;
  Route<dynamic> onGenerateRoute(RouteSettings settings);
  Route<dynamic> onUnknownRoute(RouteSettings settings);
}

class VisiPayRouter implements IRouter {
  @override
  String get initialRoute => "/detailpromo";

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
      case "/virtualaccount":
        return _buildRoute(builder: (_) => VirtualAccount(), settings: settings);
      case "/pulsa":
        return _buildRoute(builder: (_) => IndexPulsa(), settings: settings);
      case "/konfirpulsa":
        return _buildRoute(builder: (_) => KonfirPulsa(), settings: settings);
      case "/pilihpromo":
        return _buildRoute(builder: (_) => PilihPromo(), settings: settings);
      case "/promoterpilih":
        return _buildRoute(builder: (_) => PromoTerpilih(), settings: settings);
      case "/detailpromo":
        return _buildRoute(builder: (_) => DetailPromo(), settings: settings);
      case "/deskripsipromo":
        return _buildRoute(builder: (_) => DeskripsiPromo(), settings: settings);
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