import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/pages/home.dart';

import '../../widgets/button.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Primary50,
              leading: Semantics(
                label: "Kembali",
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                ),
              ),
              title: Text(
                "Profile",
                style: GoogleFonts.nunito(
                    textStyle: Nunito_21px,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            body: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Nama',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_21px,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Neta Aulya Kurnia Ningrum',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nomor Handphone',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_21px,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '+62895330683880',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'E-Mail',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_21px,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'netaaulya@gmail.com',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Kebijakan Privasi',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      decoration: TextDecoration.underline,
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Terms & Condition',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      decoration: TextDecoration.underline,
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Button(
                  "Edit Profile",
                  backgroundColor: Secondary50,
                  width: 286,
                  height: 45,
                ),
            
                SizedBox(height: 8),
                Button(
                  "Log Out",
                  backgroundColor: Color(0xffD66161),
                  width: 286,
                  height: 45,
                ),
              ]),
            )));
  }
}
