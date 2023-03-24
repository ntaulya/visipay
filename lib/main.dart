import 'package:flutter/material.dart';
import 'package:visipay/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final IRouter _router = VisiPayRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: _router.initialRoute,
      onGenerateRoute: _router.onGenerateRoute,
      onUnknownRoute: _router.onUnknownRoute,
    );
  }
}