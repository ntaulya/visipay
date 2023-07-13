import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';

class CardPulsa extends StatefulWidget {
  final int harga;
  final String product_id;
  final String notes;
  final String no_hp;
  const CardPulsa({required this.harga, required this.product_id, required this.notes, required this.no_hp});

  @override
  State<CardPulsa> createState() => _CardPulsaState();
}

class _CardPulsaState extends State<CardPulsa> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 400,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
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
                          Text('No Ponsel',
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_15px,
                                fontWeight: FontWeight.w500,
                                color: Text1,
                              )),
                          Text(widget.no_hp.toString(),
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
                          Text('Pulsa',
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_15px,
                                fontWeight: FontWeight.w500,
                                color: Text1,
                              )),
                          Text("Rp " + (widget.harga).toString(),
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
                          Text('Harga Pulsa',
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_15px,
                                fontWeight: FontWeight.w500,
                                color: Text1,
                              )),
                          Text("Rp " + (widget.harga).toString(),
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
                          Text('Rp 1000',
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
                          Text("Rp " + ((widget.harga) + 1000).toString(),
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
                            "Batal",
                            backgroundColor: Primary50,
                            width: 151,
                            height: 48,
                          ),
                          Button(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KonfirPembayaran(harga: widget.harga + 2500, product_id: widget.product_id, notes: widget.notes),
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
            });
      },
      title: Text("Pulsa Rp " + (widget.harga).toString(),
          style: GoogleFonts.nunito(
            textStyle: Nunito_17px,
            fontWeight: FontWeight.w700,
            color: Text1,
          )),
      subtitle: Text("Harga Rp " + ((widget.harga) + 1000).toString(),
          style: GoogleFonts.nunito(
            textStyle: Nunito_15px,
            fontWeight: FontWeight.w500,
            color: Text1,
          )),
    ));
  }
}
