import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visipay/core/theme/palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacementNamed('/onboarding');
      Navigator.pushNamed(context, "/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        color: Primary50,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(
              height: 308,
            ),
            Image.asset(
              "assets/img/visipaylogo.png",
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
