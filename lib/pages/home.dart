// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/get_wallet/get_wallet_bloc.dart';
import 'package:visipay/extention/currency_extention.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/menu/promo/DaftarPromo.dart';
import 'package:visipay/pages/menu/pulsa/pulsapaket.dart';
import 'package:visipay/pages/menu/topup/topup.dart';
import 'package:visipay/pages/menu/profile/my_profile.dart';
import '../core/theme/palette.dart';
import '../core/theme/textSize.dart';
import 'menu/pdam/pdam.dart';
import 'menu/pln/pln.dart';
import 'menu/riwayat/riwayat.dart';
import 'package:visipay/widgets/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              // margin: EdgeInsets.only(top: 70),
              height: 108,
              color: Primary50,
              child: Padding(
                padding: const EdgeInsets.only(top: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Saldo",
                          style: GoogleFonts.nunito(
                              textStyle: Nunito_17px,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        BlocProvider(
                          create: (context) => sl<GetWalletBloc>(),
                          child: BlocBuilder<GetWalletBloc, GetWalletState>(
                            bloc: sl<GetWalletBloc>()..add(GetWalletInisiate()),
                            builder: (context, state) {
                              print(state);
                              if (state is GetWalletLoaded) {
                                return Text(
                                  state.wallet.balance.toRupiahWithSymbol,
                                  // state.wallet.balance.toString(),
                                  style: GoogleFonts.nunito(
                                      textStyle: Nunito_25px,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
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
                    Semantics(
                      label: "Profil",
                      child: IconButton(
                        icon: const Icon(Icons.account_circle_rounded),
                        color: Colors.white, // warna ikon
                        iconSize: 48, // ukuran ikon

                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProfile()));
                          // aksi yang akan dijalankan saat tombol di tekan
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 170,
                    height: 130,
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, "/topup");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TopUp(),
                              ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icon/Top up.png",
                              width: 48,
                              height: 48,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Top Up",
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_17px,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 130,
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(route!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Riwayat()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icon/Riyawat.png",
                              width: 48,
                              height: 48,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Riwayat",
                              style: GoogleFonts.nunito(
                                textStyle: Nunito_17px,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 16),
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
                          // Navigator.of(context).pushNamed(route!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DaftarPromo()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Promo Tersedia",
                                      style: GoogleFonts.nunito(
                                        textStyle: Nunito_17px,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      )),
                )),

            Container(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Column(
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      "Pilihan Transaksi",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Text1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardButton(
                      image: "assets/icon/PLN Listrik.png",
                      text: "PLN",
                      route: (_) => const Pln()),
                  CardButton(
                    image: "assets/icon/PDAM.png",
                    text: "PDAM",
                    route: (_) => const Pdam(),
                  ),
                ],
              ),
            ),

            // SizedBox(height: 8,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                // width: 380,
                height: 150,
                width: double.infinity,
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      //    Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const IndexPulsa()));
                      // },
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PulsaPaket()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/Mbanking.png",
                          width: 48,
                          height: 48,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Pulsa & Paket Data",
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_21px,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
