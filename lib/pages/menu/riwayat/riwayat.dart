import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/pages/home.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Primary50,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
            title: Text(
              "Riwayat",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 37,
                  color: Colors.black12,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                  child: Center(
                    child: Text("Rabu, 24 Mei 2023",
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.bold,
                      color: Text1
                    ),),
                  ),
                ),

                 Container(
                  // color: Colors.amber,
                // padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                height: 76,
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed(route!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icon/PLN Listrik.png",
                      width: 34,
                      height: 34,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PLN Listrik",
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_17px,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rp. 150.000",
                          style: GoogleFonts.nunito(
                              textStyle: Nunito_15px,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                    "Beli Lagi",
                    style: GoogleFonts.nunito(
                        textStyle: Nunito_15px,
                        fontWeight: FontWeight.bold,
                        color: Primary50),
                  )
                ],
                ),
                  ),
                ),
              ),

   Container(
                  // color: Colors.green,
                // padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                height: 76,
                child: InkWell(
                  
                  onTap: () {
                    // Navigator.of(context).pushNamed(route!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icon/PLN Listrik.png",
                      width: 34,
                      height: 34,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PLN Listrik",
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_17px,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rp. 150.000",
                          style: GoogleFonts.nunito(
                              textStyle: Nunito_15px,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                    "Beli Lagi",
                    style: GoogleFonts.nunito(
                        textStyle: Nunito_15px,
                        fontWeight: FontWeight.bold,
                        color: Primary50),
                  )
                ],
                ),
                  ),
                ),
              ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}