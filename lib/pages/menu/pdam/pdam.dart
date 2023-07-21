import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:visipay/bloc/riwayat/riwayat_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/extention/currency_extention.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/bloc/produk/produk_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visipay/pages/menu/pulsa/konfirmasi_pembayaran.dart';
import 'package:visipay/widgets/button.dart';
import 'package:visipay/widgets/cardToken.dart';
import 'package:visipay/widgets/container.dart';

class Pdam extends StatefulWidget {
  const Pdam({super.key});

  @override
  State<Pdam> createState() => _PdamState();
}

class _PdamState extends State<Pdam> {
  String inputNumber = "";
  late BuildContext blocContext;
  final TextEditingController idpelangganController = TextEditingController();
  final List<String> pdamList = ['PDAM JAKARTA', 'PDAM BANDUNG', 'PDAM SURABAYA', 'PDAM JOGJA'];
  String? selectedPDAM;

  void onFieldSubmitted(String value) {
    setState(() {
      inputNumber = value;
    });
    context
        .read<ProdukBloc>()
        .add(GetProdukListInisiate(code: "", category: "PDAM", idPelanggan: value));
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
              label: "Kembali",
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Text(
              "PDAM",
              style: GoogleFonts.nunito(
                  textStyle: Nunito_21px, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24,
              ),
              Container(
                width: double.maxFinite,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<String>(
                  hint: Text('Pilih Lokasi PDAM'),
                  isExpanded: true,
                  value: selectedPDAM,
                  items: List<DropdownMenuItem<String>>.from(pdamList.map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))),
                  onChanged: (value) {
                    setState(() {
                      selectedPDAM = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: idpelangganController,
                  onFieldSubmitted: onFieldSubmitted,
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
              BlocBuilder<RiwayatBloc, RiwayatState>(
                bloc: sl<RiwayatBloc>()..add(RiwayatListInisiate(category: "PDAM")),
                builder: (context, state) {
                  if (state is RiwayatLoaded) {
                    if (state.riwayat.isEmpty) {
                      return SizedBox();
                    }
                    final data = state.riwayat.first;
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => KonfirPembayaran(
                                        harga: data.amount,
                                        product_id: data.transactionProduct?.id ?? '',
                                        notes: "PDAM",
                                        billing_number: idpelangganController.text,
                                      ),
                                    ),
                                  );
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
                                                "PDAM",
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
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              Expanded(
                child: BlocConsumer<ProdukBloc, ProdukState>(
                  listener: (context, state) {
                    /// listener dipake buat navigasi, nampilin popup, atau yang lainnya
                    /// yang tidak berhubungan buat nampilin widget

                    if (state is ProdukListLoaded) {
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
                                        Text(idpelangganController.text,
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
                                        Text(state.name,
                                            style: GoogleFonts.nunito(
                                              textStyle: Nunito_15px,
                                              fontWeight: FontWeight.w600,
                                              color: Text1,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text('Tarif/Daya',
                                    //         style: GoogleFonts.nunito(
                                    //           textStyle: Nunito_15px,
                                    //           fontWeight: FontWeight.w500,
                                    //           color: Text1,
                                    //         )),
                                    //     Text('',
                                    //         style: GoogleFonts.nunito(
                                    //           textStyle: Nunito_15px,
                                    //           fontWeight: FontWeight.w600,
                                    //           color: Text1,
                                    //         )),
                                    //   ],
                                    // ),
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
                                        Text('Harga Token',
                                            style: GoogleFonts.nunito(
                                              textStyle: Nunito_15px,
                                              fontWeight: FontWeight.w500,
                                              color: Text1,
                                            )),
                                        Text(state.produk[0].price.toRupiahWithSymbol,
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
                                        Text(2500.toRupiahWithSymbol,
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
                                        Text((state.produk[0].price + 2500).toRupiahWithSymbol,
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => KonfirPembayaran(
                                                      harga: state.produk[0].price + 2500,
                                                      product_id: state.produk[0].id,
                                                      notes: ""),
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
                    }
                  },
                  builder: (context, state) {
                    /// kalo builder dipake buat render/nampilin widget,
                    /// navigasi/nampilin popup ga boleh ditaruh disini

                    if (state is ProdukLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProdukError) {
                      return Center(
                        child: Text(state.error_message),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        )));
    ;
  }
}
