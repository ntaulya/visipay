import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:visipay/bloc/get_profile/get_profile_bloc.dart';
import 'package:visipay/bloc/produk/produk_bloc.dart';
import 'package:visipay/bloc/riwayat/riwayat_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/data/model/produk.dart';
import 'package:visipay/extention/currency_extention.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/cardToken.dart';
import 'package:visipay/widgets/container.dart';

import '../../../widgets/button.dart';

class Pln extends StatefulWidget {
  const Pln({super.key});

  @override
  State<Pln> createState() => _PlnState();
}

class _PlnState extends State<Pln> {
  String inputNumber = "";
  late BuildContext blocContext;
  final TextEditingController idpelangganController = TextEditingController();

  void onFieldSubmitted(String value) {
    setState(() {
      inputNumber = value;
    });
    blocContext
        .read<ProdukBloc>()
        .add(GetProdukListInisiate(code: "", category: "PLN", idPelanggan: value));
  }

  @override
  void initState() {
    context.read<GetProfileBloc>().add(GetProfileInisiate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name = context.select<GetProfileBloc, String>((value) {
      if (value.state is GetProfileLoaded) {
        return (value.state as GetProfileLoaded).user.name;
      }

      return '';
    });
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
                  Navigator.pop(context);
                },
              ),
            ),
            title: Text(
              "PLN",
              style: GoogleFonts.nunito(
                  textStyle: Nunito_21px, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: BlocProvider(
            create: (context) => sl<ProdukBloc>(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: idpelangganController,
                      onFieldSubmitted: onFieldSubmitted,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // prefixText: "Rp. ",
                        labelText: 'Nomor Pelanggan',
                        hintText: 'Contoh 123456789xxx',
                        // prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Primary30),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<RiwayatBloc, RiwayatState>(
                      bloc: sl<RiwayatBloc>()..add(RiwayatListInisiate(category: "PLN")),
                      builder: (context, state) {
                        if (state is RiwayatLoaded) {
                          if (state.riwayat.isEmpty) {
                            return SizedBox();
                          }

                          final data = state.riwayat.first;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Transaksi Terakhir",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunito(
                                    textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
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
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: 430,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.0, vertical: 32.0),
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('ID Pelanggan',
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_15px,
                                                              fontWeight: FontWeight.w500,
                                                              color: Text1,
                                                            )),
                                                        Text(data.billing_number.toString(),
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_15px,
                                                              fontWeight: FontWeight.w600,
                                                              color: Text1,
                                                            )),
                                                      ],
                                                    ),
                                                    SizedBox(height: 12),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Nama Pelanggan',
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_15px,
                                                              fontWeight: FontWeight.w500,
                                                              color: Text1,
                                                            )),
                                                        Text(name,
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_15px,
                                                              fontWeight: FontWeight.w600,
                                                              color: Text1,
                                                            ))
                                                      ],
                                                    ),
                                                    SizedBox(height: 12),
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Harga Token',
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_15px,
                                                              fontWeight: FontWeight.w500,
                                                              color: Text1,
                                                            )),
                                                        Text(
                                                            data.transactionProduct!.price
                                                                .toRupiahWithSymbol,
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Total Pembayaran',
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_15px,
                                                              fontWeight: FontWeight.w700,
                                                              color: Text1,
                                                            )),
                                                        Text(
                                                            (data.transactionProduct!.price
                                                                .toRupiahWithSymbol),
                                                            style: GoogleFonts.nunito(
                                                              textStyle: Nunito_15px,
                                                              fontWeight: FontWeight.w700,
                                                              color: Text1,
                                                            )),
                                                      ],
                                                    ),
                                                    SizedBox(height: 14),
                                                    Spacer(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
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
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      KonfirPembayaran(
                                                                    harga: data
                                                                        .transactionProduct!.price,
                                                                    product_id:
                                                                        data.transactionProduct!.id,
                                                                    notes: data.notes,
                                                                    billing_number:
                                                                        data.billing_number,
                                                                  ),
                                                                ));
                                                          },
                                                          "Konfirmasi",
                                                          backgroundColor: Primary70,
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
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "PLN Listrik",
                                                    style: GoogleFonts.nunito(
                                                      textStyle: Nunito_15px,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    DateFormat("dd MMM yyyy H:m")
                                                        .format(data.createdAt.toLocal()),
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
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                    BlocBuilder<ProdukBloc, ProdukState>(
                      builder: (context, state) {
                        blocContext = context;
                        if (state is ProdukListLoaded) {
                          return Column(
                            children: [
                              OutlinedBox(
                                padding: const EdgeInsets.all(16),
                                backgroundColor: Primary50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nama Pelanggan",
                                          style: GoogleFonts.nunito(
                                              textStyle: Nunito_13px,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          state.name,
                                          style: GoogleFonts.nunito(
                                              textStyle: Nunito_21px,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          idpelangganController.text,
                                          style: GoogleFonts.nunito(
                                              textStyle: Nunito_13px,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "",
                                          style: GoogleFonts.nunito(
                                              textStyle: Nunito_13px,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "",
                                          style: GoogleFonts.nunito(
                                              textStyle: Nunito_17px,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              GridView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CardToken(
                                    produk: state.produk[index],
                                    idpelanggan: inputNumber,
                                    name: state.name,
                                    notes: "Pembayaran",
                                  );
                                },
                                itemCount: state.produk.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    mainAxisExtent: 160),
                              ),
                            ],
                          );
                        } else if (state is ProdukLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is ProdukError) {
                          return Text("Gagal memuat data");
                        } else {
                          return SizedBox();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
