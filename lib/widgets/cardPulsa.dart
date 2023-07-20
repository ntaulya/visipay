import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/data/model/produk.dart';
import 'package:visipay/extention/currency_extention.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';

class CardPulsa extends StatefulWidget {
  final Produk produk;
  final String notes;
  final String no_hp;
  final String title;
  const CardPulsa(
      {required this.notes, required this.no_hp, required this.title, required this.produk});

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
                          Text(widget.produk.category,
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_15px,
                                fontWeight: FontWeight.w500,
                                color: Text1,
                              )),
                          Text((widget.produk.price).toRupiahWithSymbol,
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
                          Text('Harga ' + widget.produk.category,
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_15px,
                                fontWeight: FontWeight.w500,
                                color: Text1,
                              )),
                          Text((widget.produk.price).toRupiahWithSymbol,
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
                          Text(1000.toRupiahWithSymbol,
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
                          Text(((widget.produk.price) + 1000).toRupiahWithSymbol,
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
                            backgroundColor: Colors.white,
                            color: Primary50,
                            width: 151,
                            height: 48,
                          ),
                          Button(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KonfirPembayaran(
                                      notes: widget.notes,
                                      harga: widget.produk.price + 1000,
                                      product_id: widget.produk.id,
                                    ),
                                  ));
                            },
                            "Konfirmasi",
                            backgroundColor: Primary50,
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
      title: Text(widget.title,
          style: GoogleFonts.nunito(
            textStyle: Nunito_17px,
            fontWeight: FontWeight.w700,
            color: Text1,
          )),
      subtitle: Text("Harga " + ((widget.produk.price) + 1000).toRupiahWithSymbol,
          style: GoogleFonts.nunito(
            textStyle: Nunito_15px,
            fontWeight: FontWeight.w500,
            color: Text1,
          )),
    ));
  }
}
