import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';

class StatusGagal extends StatefulWidget {
  const StatusGagal({super.key});

  @override
  State<StatusGagal> createState() => _StatusGagalState();
}

class _StatusGagalState extends State<StatusGagal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/Wallpaper2.png"), fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 308,
                  ),
                  // Image.asset("assets/img/Completed_successfully.png",width: 313,height: 313,),
                  Image.asset(
                    "assets/img/Payment failed.png",
                    width: 313,
                    height: 313,
                  ),
                  Text("Transaksi Gagal",
                      style: GoogleFonts.nunito(
                          textStyle: Nunito_25px, fontWeight: FontWeight.w600, color: Text1)),
                ],
              ),
            ),
          ),
        )));
  }
}
