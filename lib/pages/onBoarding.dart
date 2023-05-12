import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/SvgIcon.dart';
import 'package:visipay/widgets/button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/Wallpaper1.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 181,
                ),
                Image.asset(
                  "assets/img/On Boarding Hero.png",
                  width: 228,
                  height: 170,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Akses Transaksinya Dengan Mudah",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.bold,
                      color: Text1),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Nikmati berbagai layanan finansial dan kemudahan pembayaran dalam genggaman",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      textStyle: Nunito_15px,
                      fontWeight: FontWeight.normal,
                      color: Text1),
                ),
                const Spacer(),

                Button(
                  "Login",
                  backgroundColor: Primary50,
                  
                  onTap: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                ),

                Button("Register",
                    backgroundColor: Colors.white, color: Primary50, onTap: () {
                  Navigator.of(context).pushNamed('/register');
                }),
              ],
            ),
          ),
        ),
    );
  }
}
