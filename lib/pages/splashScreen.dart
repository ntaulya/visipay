import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/onBoarding.dart';
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
      // Navigator.of(context).pushReplacementNamed('/onboarding');
      Navigator.push(context, 
      MaterialPageRoute(builder: (context) => OnBoarding(),)
      );
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
              const SizedBox(height: 308,),
              Image.asset("assets/icon/Logo_VisiPay.png",width: 150,height: 150,),
              Text("VisiPay", style: GoogleFonts.nunito(textStyle: Nunito_25px,fontWeight: FontWeight.w700,color: Colors.white )),
            ],
          ),
      ),
    );
  }
}
