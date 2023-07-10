import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:visipay/bloc/riwayat/riwayat_bloc.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/riwayat/DetailRiwayat.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
            title: Text(
              "Riwayat",
              style: GoogleFonts.nunito(
                  textStyle: Nunito_21px,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: BlocProvider(
              create: (context) =>
                  sl<RiwayatBloc>()..add(RiwayatListInisiate()),
              child: BlocBuilder<RiwayatBloc, RiwayatState>(
                  builder: (context, state) {
                print(state);
                if (state is RiwayatLoaded) {
                  return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.black,
                          ),
                      itemCount: state.riwayat.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => DetailRiwayat(
                                    id: state.riwayat[index].id)));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 37,
                                color: Colors.black12,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 7),
                                child: Center(
                                  child: Text(
                                    DateFormat('dd/MM/yyyy', 'id_ID').format(state.riwayat[index].createdAt),
                                    style: GoogleFonts.nunito(
                                        textStyle: Nunito_17px,
                                        fontWeight: FontWeight.bold,
                                        color: Text1),
                                  )
                                ),
                              ),
                              Container(
                                  height: 76,
                                  child: InkWell(
                                      // onTap: () {
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               DetailRiwayat(id: state.riwayat[index].id)));
                                      // },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(children: [
                                                  Image.asset(
                                                    "assets/icon/PLN Listrik.png",
                                                    width: 34,
                                                    height: 34,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        state.riwayat[index]
                                                            .notes ?? '',
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle:
                                                              Nunito_17px,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        state.riwayat[index]
                                                            .amount
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.nunito(
                                                                textStyle:
                                                                    Nunito_15px,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                      )
                                                    ],
                                                  )
                                                ])
                                              ]))))
                            ],
                          ),
                        );
                      });
                }
                return Center(child: CircularProgressIndicator());
              })

              // body: SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       Container(
              //         width: double.infinity,
              //         height: 37,
              //         color: Colors.black12,
              //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              //         child: Center(
              //           child: Text(
              //             "Rabu, 24 Mei 2023",
              //             style: GoogleFonts.nunito(
              //                 textStyle: Nunito_17px,
              //                 fontWeight: FontWeight.bold,
              //                 color: Text1),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 76,
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const DetailRiwayat()));
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(horizontal: 16),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Image.asset(
              //                       "assets/icon/PLN Listrik.png",
              //                       width: 34,
              //                       height: 34,
              //                     ),
              //                     SizedBox(
              //                       width: 8,
              //                     ),
              //                     Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           "PLN Listrik",
              //                           style: GoogleFonts.nunito(
              //                             textStyle: Nunito_17px,
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                         ),
              //                         Text(
              //                           "Rp. 150.000",
              //                           style: GoogleFonts.nunito(
              //                               textStyle: Nunito_15px,
              //                               fontWeight: FontWeight.normal),
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 76,
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const Home()));
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(horizontal: 16),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Image.asset(
              //                       "assets/icon/PLN Listrik.png",
              //                       width: 34,
              //                       height: 34,
              //                     ),
              //                     SizedBox(
              //                       width: 8,
              //                     ),
              //                     Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           "PLN Listrik",
              //                           style: GoogleFonts.nunito(
              //                             textStyle: Nunito_17px,
              //                             fontWeight: FontWeight.bold,
              //                           ),
              //                         ),
              //                         Text(
              //                           "Rp. 150.000",
              //                           style: GoogleFonts.nunito(
              //                               textStyle: Nunito_15px,
              //                               fontWeight: FontWeight.normal),
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),

              ),
        ),
      ),
    );
  }
}
