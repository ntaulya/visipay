import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/promo_terpilih.dart';
import 'package:visipay/pages/menu/topup/topup.dart';
import 'package:visipay/widgets/button.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
// import 'package:flutter_tts/flutter_tts.dart';


class VirtualAccount extends StatelessWidget {
  // final FlutterTts flutterTts = FlutterTts();

  // Future<void> announce(String message) async {
  //   await flutterTts.setSpeechRate(1.0); // Menyetel kecepatan ucapan
  //   await flutterTts.speak(message); // Mengucapkan pesan
  // }

  final String noVA = '0763846';

  void _copyTextToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: noVA));

    final snackBar = SnackBar(
      content: Text('nomor VA berhasil disalin'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Primary50,
              leading: Semantics(
                label: "Kembali ke beranda",
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ),
              title: Text("Top Up",
                  style: GoogleFonts.nunito(
                    textStyle: Nunito_21px,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
            ),
            body: Column(children: [
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
                height: 105,
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
                      // Semantics(
                      //   hint: "tekan untuk menyalin nomor V.A",
                      //   label: "tekan untuk menyalin nomor Virtual Account",
                      //   // onTap: () {
                      //   //   HapticFeedback.heavyImpact();
                      //   //   print("berhasil di salin");
                      //   // },
                      //   child: GestureDetector(
                      //     excludeFromSemantics: true,
                      //     onTap: () => _copyTextToClipboard(context),
                      //     child: Text(
                      //       noVA,
                      //       style: GoogleFonts.nunito(
                      //         textStyle: Nunito_21px,
                      //         fontWeight: FontWeight.w700,
                      //         color: Secondary50,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(noVA,
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_21px,
                                fontWeight: FontWeight.w700,
                                color: Secondary50,
                              )),
                              SizedBox(width: 4,),
                          Semantics(
                            label: "Salin nomor",
                            hint: "tekan untuk menyalin nomor Virtual Akun",
                            child: GestureDetector(
                              excludeFromSemantics: true,
                              onTap: () {
                                _copyTextToClipboard(context);
                                HapticFeedback.heavyImpact();
                                // AccessibilityEventAnnouncement('Tombol berhasil di klik');
                                // announce('Tombol berhasil di klik');
                              },
                              child: Icon(Icons.copy),
                            ),
                          ),
                        ],
                      ),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    },
                    "Cek Saldo",
                    backgroundColor: Primary50,
                    width: 328,
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
