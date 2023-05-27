import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';



class Pln extends StatefulWidget {
  const Pln({super.key});

  @override
  State<Pln> createState() => _PlnState();
}

class _PlnState extends State<Pln> {
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
              "PLN",
              style: GoogleFonts.nunito(
                  textStyle: Nunito_21px,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
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
                Container(
                  // color: Colors.green,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Text(
                    "Transaksi Terakhir",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                        textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                  ),
                ),
          
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
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
                            SizedBox(
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
                                  "09 Maret 2021, 22.10",
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
                  ),
          
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    color: Primary50,
                    height: 117,
            
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama Pelanggan",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_13px,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                            ),),
                            Text("John Smith",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_21px,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),),
                            Text("123456789",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_13px,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                            ),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tarif / Daya",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_13px,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                            ),),
                            Text("R1 / 000001300VA",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_17px,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                                Navigator.pushNamed(context, "/topup");
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("20K",
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_25px,
                                    fontWeight: FontWeight.w700,
                                    color: Text1
                                  ),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Harga Rp22.500",
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w500,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("50K",
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_25px,
                                    fontWeight: FontWeight.w700
                                  ),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Harga Rp52.500",
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                                Navigator.pushNamed(context, "/topup");
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("100k",
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_25px,
                                    fontWeight: FontWeight.w700,
                                    color: Text1
                                  ),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Harga Rp102.500",
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w500,
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
                                        builder: (context) => const Home()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("200K",
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_25px,
                                    fontWeight: FontWeight.w700
                                  ),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Harga Rp202.500",
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                                Navigator.pushNamed(context, "/topup");
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("500k",
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_25px,
                                    fontWeight: FontWeight.w700,
                                    color: Text1
                                  ),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Harga Rp502.500",
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_15px,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("1000K",
                                  style: GoogleFonts.nunito(
                                    textStyle: Nunito_25px,
                                    fontWeight: FontWeight.w700
                                  ),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Harga Rp1.002.500",
                                    style: GoogleFonts.nunito(
                                      textStyle: Nunito_17px,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          
              ],
            ),
          ),
        )));
  }
}
