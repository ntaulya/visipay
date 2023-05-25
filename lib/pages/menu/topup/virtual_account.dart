import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/menu/pulsa/promo_terpilih.dart';
import 'package:visipay/pages/menu/topup.dart';
import 'package:visipay/widgets/button.dart';

class VirtualAccount extends StatelessWidget {
  
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
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PromoTerpilih()));
            },
          ),
          title: Text("Top Up",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: [
                Image.asset("assets/img/BCA.png", width: 96, height: 48),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("BCA",
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_17px,
                          fontWeight: FontWeight.w700,
                          color: Text1,
                        )),
                    Text("Waktu tersisa 09.59.00",
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w700,
                          color: Text1,
                        )),
                  ],
                )
              ]),
            ),
            SizedBox(height: 20),
            Container(
              width: 328,
              height: 92,
              color: Color(0xffF1F6F9),
              padding: EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Virtual Account",
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w500,
                          color: Text1,
                        )),
                    Text("3 5 6 8 9 3 7 6 8",
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_21px,
                          fontWeight: FontWeight.w700,
                          color: Secondary50,
                        )),
                  ]),
            ),
            SizedBox(height: 17),
            Text(
              "Tata Cara Top Up di BCA",
              style: GoogleFonts.nunito(
                textStyle: Nunito_15px,
                fontWeight: FontWeight.w700,
                color: Text1,
              ),              
            ),
            SizedBox(height: 17),
            Container(
              padding: EdgeInsets.all(16.0),
              width: 328,
              height: 230,
              color: Color(0xffF9F5FF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "1. Masukkan kartu ATM dan pin BCA anda\n 2. Pilih menu transaksi lainnya\n 3. Pilih menu transfer\n 4. Pilih menu ke Rek BCA Virtual Account\n 5. Masukkan kode “12345” dan nomor handphone anda\n 6. Masukkan nominal top up\n 7. Lanjutkan transaksi sampai selesai",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 144),
          ]),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  "Cek Status Pembayaran",
                  backgroundColor: Primary50,
                  width: 328,
                  height: 48,
                ),
              ],
              ),
          ),
        ),
        ))
      ;
  }
}
            