// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/pages/home.dart';
import 'package:visipay/pages/menu/topup/VA_BCA.dart';
import 'package:visipay/pages/menu/topup/VA_BNI.dart';
import 'package:visipay/pages/menu/topup/VA_BRI.dart';
import 'package:visipay/widgets/card.dart';
import 'package:visipay/widgets/cardTopUp.dart';
import '../../../core/theme/palette.dart';
import '../../../core/theme/textSize.dart';
import 'package:visipay/pages/data/dataTopup.dart';


class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  TextEditingController _nominalController = TextEditingController();

  // @override
  // void setNominal(){
  //   setState(() {
  //       _nominalController.text = DataUtil.getData().toString(); // Nilai awal yang ingin Anda set
  //   });
  // }

  @override
void initState() {
  if(DataUtil.getData().toString() != "null"){
  super.initState();
  _nominalController.text = DataUtil.getData().toString(); // Nilai awal yang ingin Anda set

  } else {
    _nominalController.text = "50000";
  }
}

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Primary50,
          leading: Semantics(
            label: "Kembali ke beranda",
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
          ),
          title: Text(
            "Top Up",
            style: GoogleFonts.nunito(
                textStyle: Nunito_21px,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),

            Container(
                // color: Colors.green,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Text(
                  "Jumlah Top Up",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                      textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 8,),

              Container(
                // width: 700,
                height: 280,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        CardTopUp(nominal: 20000),
                        SizedBox(
                          width: 4,
                        ),
                        CardTopUp(nominal: 50000),
                        SizedBox(
                          width: 4,
                        ),
                        CardTopUp(nominal: 100000)
                      ],
                    )),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        CardTopUp(nominal: 200000),
                        SizedBox(
                          width: 4,
                        ),
                        CardTopUp(nominal: 300000),
                        SizedBox(
                          width: 4,
                        ),
                        CardTopUp(nominal: 500000)
                      ],
                    )),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _nominalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: "Rp ",
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
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Text(
                  "Pilih Bank",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                      textStyle: Nunito_21px, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardButton(
                        image: "assets/img/BCA.png",
                        text: "BCA",
                        route: (_) => VirtualAccount()),
                    CardButton(
                        image: "assets/img/BRI.png",
                        text: "BRI",
                        route: (_) => VirtualAccountBRI()),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VirtualAccountBNI(),
                            ));
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
