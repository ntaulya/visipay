import 'package:flutter/material.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/menu/pulsa/pilih_promo.dart';
import 'package:visipay/pages/menu/pulsa/promo_terpilih.dart';
import 'package:visipay/pages/menu/pulsa/pulsa.dart';
import 'package:visipay/router.dart';
import 'package:google_fonts/google_fonts.dart';
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
      home: IndexPulsa(),
      debugShowCheckedModeBanner: false,
      // initialRoute: _router.initialRoute,
      // onGenerateRoute: _router.onGenerateRoute,
      // onUnknownRoute: _router.onUnknownRoute,
    );
  }
}