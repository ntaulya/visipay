import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visipay/Pages/onBoarding.dart';
import 'package:visipay/bloc/page_navigation/page_navigation_bloc.dart';
import 'package:visipay/core/constant/routes.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/auth/login.dart';
import 'package:visipay/pages/auth/pin.dart';
import 'package:visipay/pages/auth/register.dart';
import 'package:visipay/pages/menu/pdam/pdam.dart';
import 'package:visipay/pages/menu/profile/edit_profile.dart';
import 'package:visipay/pages/menu/promo/DetailPromo.dart';
import 'package:visipay/pages/menu/promo/DaftarPromo.dart';
import 'package:visipay/pages/menu/pulsa/pulsapaket.dart';
import 'package:visipay/pages/menu/topup/topup.dart';
import 'package:visipay/pages/splashScreen.dart';
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
  String get initialRoute => "/";

  @override
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _buildRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      sl<PageNavigationBloc>()..add(PageNavigationAuthentication()),
                  child: BlocBuilder<PageNavigationBloc, PageNavigationState>(
                    builder: (context, state) {
                      if (state is PageNavigationSuccess) {
                        return Home();
                      } else {
                        return OnBoarding();
                      }
                    },
                  ),
                ),
            settings: settings);
      case "/onboarding":
        return _buildRoute(builder: (_) => OnBoarding(), settings: settings);
      case "/register":
        return _buildRoute(builder: (_) => Register(), settings: settings);
      case "/splash":
        return _buildRoute(builder: (_) => SplashScreen(), settings: settings);
      case "/login":
        return _buildRoute(builder: (_) => Login(), settings: settings);
      case "/pin":
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return _buildRoute(builder: (_) => Pin(phone: args['phone']), settings: settings);
      case RouteUrl.Home:
        return _buildRoute(builder: (_) => Home(), settings: settings);
      case "/topup":
        return _buildRoute(builder: (_) => TopUp(), settings: settings);
      case "/pdam":
        return _buildRoute(builder: (_) => Pdam(), settings: settings);
      case "/daftarpromo":
        return _buildRoute(builder: (_) => DaftarPromo(), settings: settings);
      case "/detailpromo":
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return _buildRoute(builder: (_) => DetailPromo(id: args['id']), settings: settings);
      case "/pulsa":
        return _buildRoute(builder: (_) => PulsaPaket(), settings: settings);
      case "/berhasil":
        return _buildRoute(builder: (_) => StatusBerhasil(), settings: settings);
      case "/gagal":
        return _buildRoute(builder: (_) => StatusGagal(), settings: settings);
      case "/editprofile":
        return _buildRoute(builder: (_) => EditProfile(), settings: settings);
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
      {required Widget Function(BuildContext) builder, required RouteSettings settings}) {
    return MaterialPageRoute(settings: settings, builder: builder);
  }
}
