import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/SvgIcon.dart';

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
      Navigator.of(context).pushNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        color: Palette.Primary50,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgIcon.asset(
              'icons/tabler_pig-money.svg',
              size: 100,
            ),

            SizedBox(height: 10),
            
            Text(
              'VisiPay',
              style: TextSize.headline1
                  .apply(color: Colors.white, fontWeightDelta: 1),
            ),
          ],
        ),
      ),
    );
  }
}
