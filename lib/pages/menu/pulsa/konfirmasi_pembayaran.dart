import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/status/StatusBerhasil.dart';
import 'package:visipay/widgets/button.dart';
import 'package:visipay/widgets/container.dart';

class KonfirPulsa extends StatefulWidget {
  const KonfirPulsa({super.key});

  @override
  State<KonfirPulsa> createState() => _KonfirPulsaState();
}

class _KonfirPulsaState extends State<KonfirPulsa> {
  final TextEditingController __KonfirPulsaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
            },
          ),
          title: Text("Konfirmasi Pembayaran",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(height: 20),
            Card(
              color: Color(0xffEEEEEE),
              // padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Membuat child berada di ujung kiri dan ujung kanan
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Mengatur child berada di sebelah kiri
                      children: [
                        Text(
                          'Tagihan Pembayaran',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_17px,
                            fontWeight: FontWeight.w700,
                            color: Text1,
                          ),
                        ),
                        Text(
                          'Rp 100000',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w500,
                            color: Text1,
                          ),
                        ),
                      ],
                    ),
                    // Text(
                    //   'Rp 100000',
                    //   style: GoogleFonts.nunito(
                    //     textStyle: Nunito_15px,
                    //     fontWeight: FontWeight.w500,
                    //     color: Text1,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Membuat teks berada di ujung kiri dan ujung kanan
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Metode Pembayaran',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0), // Menambahkan padding horizontal
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Membuat child berada di ujung kiri dan ujung kanan
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Mengatur child berada di sebelah kiri
                      children: [
                        Text(
                          'Visipay',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w700,
                            color: Text1,
                          ),
                        ),
                        Text(
                          'Saldo: Rp 1075000',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w300,
                            color: Color(0xffC20025),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Refresh',
                      style: GoogleFonts.nunito(
                        textStyle: Nunito_15px,
                        fontWeight: FontWeight.w700,
                        color: Primary90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Membuat teks berada di ujung kiri dan ujung kanan
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Promo & Voucher',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Card(
              color: Color(0xffF1F6F9),
              child: Column(
                children: [
                  OutlinedBox(
                    child: Padding(
                      padding:
                          EdgeInsets.all(8.0), // Menambahkan padding horizontal
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Membuat child berada di ujung kiri dan ujung kanan
                        children: [
                          Text(
                            'Lihat Promo Yang Tersedia',
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_15px,
                              fontWeight: FontWeight.w700,
                              color: Primary90,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_right_alt_sharp),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ]),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedBox(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              backgroundColor: Color(0xffF1F6F9),
              child: Padding(
                padding: EdgeInsets.all(16.0), // Menambahkan padding horizontal
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Membuat child berada di ujung kiri dan ujung kanan
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Mengatur child berada di sebelah kiri
                      children: [
                        Text(
                          'Total Bayar',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_17px,
                            fontWeight: FontWeight.w700,
                            color: Text1,
                          ),
                        ),
                        Text(
                          'Rp 100000',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w500,
                            color: Text1,
                          ),
                        ),
                      ],
                    ),
                    Button(
                      "Bayar",
                      backgroundColor: Secondary50,
                      width: 123,
                      height: 48,
                      onTap: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: 
                        (context) => Status(),
                        )
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
