// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16), 
                // margin: EdgeInsets.only(top: 70),
                height: 108,
                color: Primary50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 27),
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Saldo", 
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_17px,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),),
                            Row(
                              children: [
                                Text("Rp. 21.054.380",
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_25px,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                                ),),
                                SizedBox(width: 8,),
                                Icon(Icons.visibility_off_outlined,color: Colors.white,)
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                  icon: Icon(Icons.notifications_active),
                  color: Colors.white, // warna ikon
                  iconSize: 24, // ukuran ikon
                  onPressed: () {
                    // aksi yang akan dijalankan saat tombol di tekan
                  },
                )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset("assets/icon/Top up.png", width: 36, height: 36,),
                        onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const TopUp()));
                        }, ),
                        Text("Top Up")
                    ],
                  ), 
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset("assets/icon/Tarik Tunai.png", width: 36, height: 36,),
                        onPressed: (){}, ),
                        Text("Tarik Tunai")
                    ],
                  ), 
                  Column(
                    children: [
                      IconButton(
                        icon: Image.asset("assets/icon/Riyawat.png", width: 36, height: 36,),
                        onPressed: (){}, ),
                        Text("Riwayat")
                    ],
                  ), 
                ],
              ),

              SizedBox(height: 32,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transaksi Terakhir",
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_21px,
                      fontWeight: FontWeight.bold,
                      color: Text1
                    ),),
                    TextButton(
                      child: Text("Selengkapnya",
                      style: GoogleFonts.nunito(
                        textStyle: Nunito_15px,
                        fontWeight: FontWeight.w500,
                        color: Secondary50
                      ),),
                      onPressed: () {
                        
                      },)
                  ],
                ),
              ),

              SizedBox(height: 8,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icon/History.png",width: 34,height: 34,),
                        SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("PLN Listrik",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_15px,
                              fontWeight: FontWeight.w600,

                            ),),
                            Text("09 Maret 2021, 22.10",
                            style: GoogleFonts.nunito(
                              textStyle: Nunito_13px,
                              fontWeight: FontWeight.normal
                            ),)
                          ],
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: Text("Beli Lagi",
                      style: GoogleFonts.nunito(
                        textStyle: Nunito_15px,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),),
                    )
                  ],
                ),
              ),

              SizedBox(height: 16,),
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Text("Pilihan Transaksi",
                textAlign: TextAlign.left,
                style: GoogleFonts.nunito(
                  textStyle: Nunito_21px,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 16,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardButton(image: "assets/icon/Mbanking.png", text: "Pulsa & Paket Data",),
                    CardButton(image: "assets/icon/PLN Listrik.png", text: "PLN",),
                  ],
                ),
              ),

              // SizedBox(height: 8,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 189,
                      height: 150,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 1.0,
                        
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          
                          onTap: () {
                            // aksi yang akan dijalankan saat tombol ditekan
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icon/PDAM.png",width: 48,height: 48,),
                              SizedBox(height: 8,),
                              Text(
                                'Air PDAM',
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_15px,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 189,
                      height: 150,
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 1.0,
                        
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          
                          onTap: () {
                            // aksi yang akan dijalankan saat tombol ditekan
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icon/Internet & Tv Kabel.png",width: 48,height: 48,),
                              SizedBox(height: 8,),
                              Text(
                                'Internet & TV',
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_15px,
                                  fontWeight: FontWeight.w600
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


            ],
          ),
        ),
      ),
    );
  }
}