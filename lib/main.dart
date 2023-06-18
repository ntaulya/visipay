import 'package:flutter/material.dart';
import 'package:visipay/pages/auth/login.dart';
import 'package:visipay/pages/auth/pin.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pln/pln.dart';
import 'package:visipay/pages/menu/pulsa/pulsapaket.dart';
import 'package:visipay/pages/menu/riwayat/riwayat.dart';
import 'package:visipay/pages/onBoarding.dart';
import 'package:visipay/pages/splashScreen.dart';
import 'package:visipay/router.dart';
import 'injection_container/di.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final IRouter _router = VisiPayRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      // initialRoute: _router.initialRoute,
      // onGenerateRoute: _router.onGenerateRoute,
      // onUnknownRoute: _router.onUnknownRoute,
    );
  }
}