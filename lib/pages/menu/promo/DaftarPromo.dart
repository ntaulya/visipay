import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/promo/DetailPromo.dart';

class DaftarPromo extends StatefulWidget {
  const DaftarPromo({super.key});

  @override
  State<DaftarPromo> createState() => _DaftarPromoState();
}

class _DaftarPromoState extends State<DaftarPromo> {
  final TextEditingController __DaftarPromoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: Semantics(
            label: "Kembali",
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Navigator.pushNamed(context, "/home");
                Navigator.push(context, 
                MaterialPageRoute(builder: 
                (context) => Home(),
                )
                );
              },
            ),
          ),
          title: Text("Daftar Promo",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            SizedBox(height: 6,),

            Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const DetailPromo()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.discount),
                          
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cashback 50% pembelian token listrik",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_15px,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Berlaku hanya hari ini sampai 15.20",
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_13px,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          )
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
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
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
                                  builder: (context) => const DetailPromo()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.discount),
                          
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cashback 50% pembelian pulsa",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_15px,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Berlaku hanya hari ini sampai 15.20",
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_13px,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          )
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
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const DetailPromo()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.discount),
                          
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cashback 50% pembayaran PDAM",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_15px,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Berlaku hanya hari ini sampai 15.20",
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_13px,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                        ),
                      ),
                    ),
                  ),
                ),


          ],
        ),
      )),
    );
  }
}
