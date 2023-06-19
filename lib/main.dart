import 'package:flutter/material.dart';
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
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: _router.initialRoute,
      onGenerateRoute: _router.onGenerateRoute,
      onUnknownRoute: _router.onUnknownRoute,
    );
  }
}
