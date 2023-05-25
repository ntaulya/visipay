// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/palette.dart';
import '../core/theme/textSize.dart';
import 'onBoarding.dart';
import 'menu/transaksi/pdam.dart';
import 'menu/transaksi/pln.dart';
import 'menu/transaksi/pulsa&paket.dart';
import 'menu/riwayat.dart';
import 'menu/topup.dart';
import 'menu/riwayat.dart';
import 'package:visipay/widgets/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  // margin: EdgeInsets.only(top: 70),
                  height: 108,
                  color: Primary50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Saldo",
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_17px,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rp 21054380",
                                    style: GoogleFonts.nunito(
                                        textStyle: Nunito_25px,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        // TextButton(
                        // child: Text("Halaman Profil",
                        // style: GoogleFonts.nunito(
                        //   textStyle: Nunito_15px,
                        //   fontWeight: FontWeight.w500,
                        //   color: Secondary50
                        // ),),
                        // onPressed: () {
                        //       Navigator.pushNamed(context, "/home");
                        // },),
                        Semantics(
                          label: "Profil",
                          child: IconButton(
                            icon: Icon(Icons.account_circle_rounded),
                            color: Colors.white, // warna ikon
                            iconSize: 48, // ukuran ikon
                            
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                              // aksi yang akan dijalankan saat tombol di tekan
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          
                SizedBox(
                  height: 8,
                ),
          
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 189,
                        height: 130,
                        child: Card(
                          shadowColor: Colors.black,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/topup");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icon/Top up.png",
                                  width: 48,
                                  height: 48,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Top Up",
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_17px,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 189,
                        height: 130,
                        child: Card(
                          shadowColor: Colors.black,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              // Navigator.of(context).pushNamed(route!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Riwayat()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icon/Riyawat.png",
                                  width: 48,
                                  height: 48,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Riwayat",
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_17px,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                  child: SizedBox(
                    // width: 380,
                    height: 76,
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // SizedBox(width: 16,),
                                  // Image.asset("assets/icon/Top up.png",width: 48,height: 48,),
                                  Text(
                                    "Lihat 5 Voucher tersedia",
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_15px,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaksi Terakhir",
                        style: GoogleFonts.nunito(
                            textStyle: Nunito_21px,
                            fontWeight: FontWeight.bold,
                            color: Text1),
                  
                      ),
                      // TextButton(
                      //   child: Text("Selengkapnya",
                      //   style: GoogleFonts.nunito(
                      //     textStyle: Nunito_15px,
                      //     fontWeight: FontWeight.w500,
                      //     color: Secondary50
                      //   ),),
                      //   onPressed: () {
          
                      //   },)
                    ],
                  ),
                ),
          
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  child: SizedBox(
                    // width: 380,
                    height: 76,
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(route!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Riwayat()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon/History.png",
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
                                "Membeli PLN Listrik",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_15px,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "09 Maret 2021, 22.10",
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_13px,
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
                  ),
                ),
          
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 4,bottom: 4),
                  child: Text(
                    "Pilihan Transaksi",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                        textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                  ),
                ),
          
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardButton(
                          image: "assets/icon/PLN Listrik.png",
                          text: "PLN",
                          route: (_) => Pln()),
                      CardButton(
                        image: "assets/icon/PDAM.png",
                        text: "PDAM",
                        route: (_) => Pdam(),
                      ),
                    ],
                  ),
                ),
          
                // SizedBox(height: 8,),
          
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    // width: 380,
                    height: 150,
                    width: double.infinity,
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(route!);
                          Navigator.pushNamed(context, "/home");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const Home()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icon/Mbanking.png",
                              width: 48,
                              height: 48,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Pulsa & Paket Data",
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_21px,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
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