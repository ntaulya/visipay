import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/riwayat/riwayat_bloc.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/widgets/button.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';

class DetailRiwayat extends StatefulWidget {
  final String id;
  const DetailRiwayat({
    Key? key,
    required this.id,
  }) : super(key: key);

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
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                "Detail Riwayat Transaksi",
                style: GoogleFonts.nunito(
                    textStyle: Nunito_21px, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                  BlocProvider(
                                      create: (context) =>
                                          sl<RiwayatBloc>()..add(RiwayatDetailInisiate(widget.id)),
                                      child: BlocBuilder<RiwayatBloc, RiwayatState>(
                                          builder: (context, state) {
                                        print(state);
                                        if (state is RiwayatLoadedID) {
                                          return Column(
                                            children: [
                                              Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "assets/icon/PLN Listrik.png",
                                                      width: 34,
                                                      height: 34,
                                                    ),
                                                    SizedBox(height: 12),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          state.riwayat.notes ?? "",
                                                          style: GoogleFonts.nunito(
                                                            textStyle: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("ID Transaksi",
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_17px,
                                                              fontWeight: FontWeight.w500,
                                                              color: Text1,
                                                            )),
                                                        SizedBox(height: 20),
                                                        Text('Jumlah',
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_17px,
                                                              fontWeight: FontWeight.w500,
                                                              color: Text1,
                                                            )),
                                                        SizedBox(height: 20),
                                                        Text('Total Transaksi',
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_17px,
                                                              fontWeight: FontWeight.w500,
                                                              color: Text1,
                                                            )),
                                                        SizedBox(height: 20),
                                                        Text('Status',
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_17px,
                                                              fontWeight: FontWeight.w500,
                                                              color: Text1,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Text(state.riwayat.transactionMethodId,
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_17px,
                                                              fontWeight: FontWeight.w600,
                                                              color: Text1,
                                                            )),
                                                        SizedBox(height: 20),
                                                        Text(state.riwayat.amount.toString(),
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_17px,
                                                              fontWeight: FontWeight.w600,
                                                              color: Text1,
                                                            )),
                                                        SizedBox(height: 20),
                                                        Text(
                                                            (state.riwayat.amount + 2500)
                                                                .toString(),
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_17px,
                                                              fontWeight: FontWeight.w600,
                                                              color: Text1,
                                                            )),
                                                        SizedBox(height: 20),
                                                        Text(state.riwayat.transactionStatus,
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_17px,
                                                              fontWeight: FontWeight.w600,
                                                              color: Text1,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }))
                                ])),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: BlocProvider(
              create: (context) => sl<RiwayatBloc>()..add(RiwayatDetailInisiate(widget.id)),
              child: BlocBuilder<RiwayatBloc, RiwayatState>(
                builder: (context, state) {
                  return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (state is RiwayatLoadedID &&
                              state.riwayat.transactionStatus == "done") ...[
                            Button(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KonfirPembayaran(
                                      harga: state.riwayat.amount + 2500,
                                      product_id: state.riwayat.productId,
                                      notes: state.riwayat.notes ?? "Beli lagi produk",
                                    ),
                                  ),
                                );
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => KonfirPembayaran(
                                //           harga: state.produk[0].price + 2500,
                                //           product_id: state.produk[0].id,
                                //           notes: ""),
                                //     ));
                              },
                              "Beli Lagi",
                              backgroundColor: Primary50,
                              width: 151,
                              height: 48,
                            )
                          ]
                        ],
                      ));
                },
              ),
            ),
          ),
        ));
  }
}
