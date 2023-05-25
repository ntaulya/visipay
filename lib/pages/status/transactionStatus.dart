import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage("assets/img/Wallpaper2.png"),
              fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 308,),
              Image.asset("assets/img/Completed_successfully.png",width: 313,height: 313,),
              // Image.asset("assets/img/Payment_failed.png",width: 313,height: 313,),
              Text("Payment Berhasil", style: GoogleFonts.nunito(textStyle: Nunito_25px,fontWeight: FontWeight.w600,color: Text1 )),
            ],
          ),
        ),
      ),
      )
      )
      );;
  }
}