import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:printing/printing.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/riwayat/riwayat.dart';
import 'package:visipay/widgets/button.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

class DetailRiwayat extends StatefulWidget {
  const DetailRiwayat({super.key});

  @override
  State<DetailRiwayat> createState() => _DetailRiwayatState();
}

class _DetailRiwayatState extends State<DetailRiwayat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: Primary50,
            leading: Semantics(
              label: "Kembali ke riwayat",
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Riwayat(),
                      ));
                },
              ),
            ),
            title: Text(
              "Detail Riwayat Transaksi",
              style: GoogleFonts.nunito(
                  textStyle: Nunito_21px,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/icon/PLN Listrik.png",
                          width: 34,
                          height: 34,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "PLN Listrik",
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_21px,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          Text(
                            "Detail Transaksi",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_21px,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // Konten kolom pertama
                              child: Text(
                                "ID Transaksi",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // Konten kolom kedua
                              child: Text(
                                "32750344",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // Konten kolom pertama
                              child: Text(
                                "Jumlah",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // Konten kolom kedua

                              child: Text(
                                "Rp. 150.000",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // Konten kolom pertama
                              child: Text(
                                "Total Transaksi",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // Konten kolom kedua

                              child: Text(
                                "Rp. 150.000",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // Konten kolom pertama
                              child: Text(
                                "Status",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // Konten kolom kedua

                              child: Text(
                                "Berhasil",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_17px,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          "Beli Lagi",
                          backgroundColor: Primary50,
                          width: 151,
                          height: 48,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));
                          },
                        ),
                        Button(
                          "Simpan Riwayat",
                          backgroundColor: Color(0xffF9F5FF),
                          color: Text1,
                          width: 151,
                          height: 48,
                          // onPressed: () => printDoc(),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));
                          },
                        ),
                        
                      ],
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        )));
  
  }
  // Future<void> printDoc() async {
  //                         final image = await imageFromAssetBundle(
  //                           'assets/Image/image.png',
  //                         );
  //                         final doc = pw.Document();
  //                         doc.addPage(pw.Page(
  //                           pageFormat: PdfPageFormat.a4,
  //                           build: (pw.Context context) {
  //                             return buildPrintableData(image);
  //                           }))};
  //                         await Printing.layoutPdf(
  //                           onLayout: PdfPageFormat format) async => doc.save());
  //                       }
}
