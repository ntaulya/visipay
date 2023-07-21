import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/get_wallet/get_wallet_bloc.dart';
import 'package:visipay/bloc/pembayaran/pembayaran_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/data/model/promo.dart';
import 'package:visipay/extention/currency_extention.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/menu/pulsa/pilih_promo.dart';
import 'package:visipay/pages/menu/topup/topup.dart';
import 'package:visipay/pages/status/StatusBerhasil.dart';
import 'package:visipay/widgets/button.dart';
import 'package:visipay/widgets/container.dart';

class KonfirPembayaran extends StatefulWidget {
  const KonfirPembayaran(
      {super.key,
      required this.harga,
      required this.product_id,
      required this.notes,
      this.billing_number});
  final int harga;
  final String notes;
  final String product_id;
  final String? billing_number;

  @override
  State<KonfirPembayaran> createState() => _KonfirPembayaranState();
}

class _KonfirPembayaranState extends State<KonfirPembayaran> {
  final TextEditingController __KonfirPembayaranController = TextEditingController();
  Promo? selectedPromo;
  double discount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
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
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Mengatur child berada di sebelah kiri
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
                          widget.harga.toRupiahWithSymbol,
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
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Mengatur child berada di sebelah kiri
                      children: [
                        Text(
                          'Visipay',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w700,
                            color: Text1,
                          ),
                        ),
                        BlocProvider(
                          create: (context) => sl<GetWalletBloc>()..add(GetWalletInisiate()),
                          child: BlocBuilder<GetWalletBloc, GetWalletState>(
                            builder: (context, state) {
                              print(state);
                              if (state is GetWalletLoaded) {
                                return Text(
                                  state.wallet.balance.toRupiahWithSymbol,
                                  style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w600,
                                      color: Primary70),
                                );
                              } else if (state is GetWalletError) {
                                return Text(state.error_message);
                              }
                              return Text("Loading...");
                            },
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopUp(),
                            ));
                      },
                      child: Text(
                        'Top Up',
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_15px,
                          fontWeight: FontWeight.w700,
                          color: Primary90,
                        ),
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
            selectedPromo == null
                ? Card(
                    color: Color(0xffF1F6F9),
                    child: Column(
                      children: [
                        OutlinedBox(
                          child: Padding(
                            padding: EdgeInsets.all(8.0), // Menambahkan padding horizontal
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
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PilihPromo(
                                            harga: widget.harga,
                                          ),
                                        )).then((value) {
                                      print(value);
                                      setState(() {
                                        selectedPromo = value;
                                      });
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Card(
                    color: Color(0xffF1F6F9),
                    child: Column(
                      children: [
                        OutlinedBox(
                          child: Padding(
                            padding: EdgeInsets.all(8.0), // Menambahkan padding horizontal
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Membuat child berada di ujung kiri dan ujung kanan
                              children: [
                                IconButton(
                                  icon: Icon(Icons.discount),
                                  color: Secondary50,
                                  onPressed: () {},
                                ),
                                Text(
                                  selectedPromo!.name,
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_15px,
                                    fontWeight: FontWeight.w700,
                                    color: Secondary50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Mengatur child berada di sebelah kiri
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
                          (widget.harga -
                                  (selectedPromo == null
                                      ? 0
                                      : widget.harga * selectedPromo!.discount))
                              .toRupiahWithSymbol,
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_15px,
                            fontWeight: FontWeight.w500,
                            color: Text1,
                          ),
                        ),
                      ],
                    ),
                    BlocProvider(
                        create: (context) => sl<PembayaranBloc>(),
                        child: BlocConsumer<PembayaranBloc, PembayaranState>(
                            listener: (context, state) {
                          if (state is PembayaranSuccess) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => StatusBerhasil()), (_) => false);
                          } else if (state is BalanceInsufficent) {
                            showDialog<bool>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Saldo anda tidak mencukupi, Silahkan Top-Up terlebih dahulu'),
                                  actionsAlignment: MainAxisAlignment.spaceBetween,
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/topup');
                                      },
                                      child: const Text('Ke Halaman Top-Up'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: const Text('Tutup'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }, builder: (context, state) {
                          print(state);
                          if (state is PembayaranInitial) {
                            return Button(
                              "Bayar",
                              backgroundColor: Primary50,
                              width: 123,
                              height: 48,
                              onTap: () {
                                context.read<PembayaranBloc>().add(PembayaranInisiate(
                                    product_id: widget.product_id,
                                    promo_id: selectedPromo?.id ?? '',
                                    notes: widget.notes,
                                    billing_number: widget.billing_number));
                              },
                            );
                          } else if (state is PembayaranError) {
                            return Button(
                              "Bayar",
                              backgroundColor: Primary50,
                              width: 123,
                              height: 48,
                              onTap: () {
                                context.read<PembayaranBloc>().add(PembayaranInisiate(
                                    product_id: widget.product_id,
                                    promo_id: selectedPromo == null ? "" : selectedPromo!.id,
                                    notes: widget.notes));
                              },
                            );
                          } else {
                            return Button(
                              "Bayar",
                              backgroundColor: Primary50.withOpacity(0.5),
                              width: 123,
                              height: 48,
                            );
                          }
                        }))
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
