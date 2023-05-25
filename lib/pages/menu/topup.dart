// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/topup/virtual_account.dart';
import 'package:visipay/widgets/card.dart';
import '../../core/theme/palette.dart';
import '../../core/theme/textSize.dart';


class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Primary50,
            leading: 
              Semantics(
                label: "Kembali",
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                  },),
              ),
                
            
            title: Text("Top Up",
            style: GoogleFonts.nunito(
              textStyle: Nunito_21px,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
          ),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24,),
          
                Container(
                  // color: Colors.green,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Text("Jumlah Top Up",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    textStyle: Nunito_21px,
                    fontWeight: FontWeight.bold
                  ),),
                ),
          
                SizedBox(height: 8,),
          
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: "Rp. ",
                            // labelText: 'Username',
                            hintText: 'Masukkan Nominal',
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
          
                SizedBox(height: 16,),
          
                Container(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Text("Pilih Bank",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    textStyle: Nunito_21px,
                    fontWeight: FontWeight.bold
                  ),),
                ),
          
                SizedBox(height: 8,),
          
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardButton(image: "assets/img/BCA.png",text: "BCA",route: (_) => VirtualAccount()),
                      CardButton(image: "assets/img/BRI.png",text: "BRI",route: (_) => VirtualAccount()),
                    ],
                  ),
                ),
          
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                          // Navigator.of(context).pushNamed(route!);
                          // Navigator.pushNamed(context, "/home");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VirtualAccount()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/img/BNI.png",
                              // width: 48,
                              height: 48,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "BNI",
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
        ),
      );
    ;
  }
}