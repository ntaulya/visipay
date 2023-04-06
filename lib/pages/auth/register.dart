import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/button.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //vector up
            // Transform.translate(
            //   offset: Offset(MediaQuery.of(context).size.width * 0.2, -80),
            //   child: SvgPicture.asset(
            //     'images/vector.svg',
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(height: 30),

                  //text 1
                  Text(
                    'Daftar Akun',
                    style: TextSize.body1.apply(fontWeightDelta: 3),
                  ),

                  //text 2
                  Text(
                    'Lengkapi profile untuk melanjutkan',
                    style: TextSize.body1.apply(fontWeightDelta: 1),
                  ),

                  SizedBox(height: 8),

                  //nama lengkap
                  Text(
                    'Nama Lengkap',
                    style: TextSize.body1.apply(fontWeightDelta: 2),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Nama Lengkap',
                    ),
                  ),

                  SizedBox(height: 8),

                  //email
                  Text(
                    'E-Mail',
                    style: TextSize.body1.apply(fontWeightDelta: 2),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan E-Mail',
                    ),
                  ),

                  SizedBox(height: 8),

                  //no hp
                  Text(
                    'No Handphone',
                    style: TextSize.body1.apply(fontWeightDelta: 2),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan No Handphone',
                    ),
                  ),

                  SizedBox(height: 8),

                  //pin transaksi
                  Text(
                    'Masukkan PIN',
                    style: TextSize.body1.apply(fontWeightDelta: 2),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan PIN Transaksi',
                    ),
                  ),

                  SizedBox(height: 8),

                  //no hp
                  Text(
                    'Konfirmasi PIN',
                    style: TextSize.body1.apply(fontWeightDelta: 2),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Konfirmasi PIN Anda',
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
        //bottom bar
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Button(
            "Lanjutkan",
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
        ));
  }
}
