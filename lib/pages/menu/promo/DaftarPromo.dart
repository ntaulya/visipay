import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/promo/promo_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/promo/DetailPromo.dart';

class DaftarPromo extends StatefulWidget {
  const DaftarPromo({super.key});

  @override
  State<DaftarPromo> createState() => _DaftarPromoState();
}

class _DaftarPromoState extends State<DaftarPromo> {
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
                // Navigator.pushNamed(context, "/home");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
            ),
          ),
          title: Text("Daftar Promo",
              style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            SizedBox(height: 6),
            Expanded(
              child: BlocProvider(
                  create: (context) => sl<PromoBloc>()..add(PromoInisiate()),
                  child: BlocBuilder<PromoBloc, PromoState>(
                      builder: (context, state) {
                    print(state);
                    if (state is PromoLoaded) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return Card(
                              shadowColor: Colors.black,
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Icon(Icons.discount),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.promo[index].name,
                                              style: GoogleFonts.nunito(
                                                textStyle: Nunito_15px,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              state.promo[index].description,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.nunito(
                                                  textStyle: Nunito_13px,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount: state.promo.length);
                    }
                    return Container();
                  })),
            )
          ],
        ),
      )),
    );
  }
}
