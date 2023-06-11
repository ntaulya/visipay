import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';

class Pdam extends StatefulWidget {
  const Pdam({super.key});

  @override
  State<Pdam> createState() => _PdamState();
}

class _PdamState extends State<Pdam> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 430,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Informasi Pelanggan',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w700,
                      color: Text1,
                    )),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID Pelanggan',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w500,
                          color: Text1,
                        )),
                    Text('123456789',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w600,
                          color: Text1,
                        )),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nama Pelanggan',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w500,
                          color: Text1,
                        )),
                    Text('Ilham Ilyas',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w600,
                          color: Text1,
                        )),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Periode',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w500,
                          color: Text1,
                        )),
                    Text('Juni 2023',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w600,
                          color: Text1,
                        )),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Text('Detail Pembayaran',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_17px,
                          fontWeight: FontWeight.w700,
                          color: Text1,
                        )),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Harga Voucher',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w500,
                          color: Text1,
                        )),
                    Text("Rp 100000",
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w600,
                          color: Text1,
                        )),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biaya Transaksi',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w500,
                          color: Text1,
                        )),
                    Text('Rp 2500',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w600,
                          color: Text1,
                        )),
                  ],
                ),
                SizedBox(height: 12),
                Divider(
                  color: Color(0xff3A3541), // Warna garis
                  thickness: 1.0, // Ketebalan garis
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Pembayaran',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w700,
                          color: Text1,
                        )),
                    Text("Rp 100000",
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w700,
                          color: Text1,
                        )),
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      "Ubah",
                      backgroundColor: Primary50,
                      width: 151,
                      height: 48,
                    ),
                    Button(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KonfirPulsa(),
                            ));
                      },
                      "Konfirmasi",
                      backgroundColor: Secondary50,
                      width: 151,
                      height: 48,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
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
                      MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
            ),
            title: Text(
              "PDAM",
              style: GoogleFonts.nunito(
                  textStyle: Nunito_21px,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _textEditingController,
                    onFieldSubmitted: (value) {
                      _showModal();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // prefixText: "Rp. ",
                      labelText: 'Nomor Pelanggan',
                      hintText: 'Contoh 123456789xxx',
                      // prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Primary30),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  // color: Colors.green,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Text(
                    "Transaksi Terakhir",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                        textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
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
                                    "assets/icon/History.png",
                                    width: 34,
                                    height: 34,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "PDAM",
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
              ],
            ),
          ),
        )));
    ;
  }
}
