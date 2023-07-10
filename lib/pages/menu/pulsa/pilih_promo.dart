import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/bloc/promo/promo_bloc.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/injection_container/di.dart';
import 'package:visipay/pages/menu/promo/DetailPromo.dart';
import 'package:visipay/widgets/button.dart';

class PilihPromo extends StatefulWidget {
  final int harga;
  const PilihPromo({super.key, required this.harga});

  @override
  State<PilihPromo> createState() => _PilihPromoState();
}

class _PilihPromoState extends State<PilihPromo> {
  final TextEditingController __PilihPromoController = TextEditingController();
  var selectedPromo = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    backgroundColor: Primary50,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {},
    ),
    title: Text("Pilih Promo",
        style: GoogleFonts.nunito(
          textStyle: Nunito_21px,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        )),
        ),
        
        body: BlocProvider(
      create: (context) => sl<PromoBloc>()..add(PromoListInisiate()),
      child:
          BlocBuilder<PromoBloc, PromoState>(builder: (context, state) {
        print(state);
        if (state is PromoLoaded) {
          return Column(
            children: [
              Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Voucher Bulan Mei',
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_17px,
                              fontWeight: FontWeight.w700,
                              color: Text1,
                            ),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet consectetur. Convallis velit imperdiet volutpat massa vel ut mauris quisque.',
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_15px,
                              fontWeight: FontWeight.w500,
                              color: Text1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Button(
                      "Pilih",
                      backgroundColor: Secondary50,
                      width: 70,
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
              Expanded(
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (widget.harga>=state.promo[index].min_order) {
                            Navigator.of(context).pop(state.promo[index]);
                          }
                        },
                        child: Opacity(
                          opacity: widget.harga<state.promo[index].min_order?0.5:1.0,
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Icon(Icons.discount),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: state.promo.length),
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      })),
      );
  }
}
