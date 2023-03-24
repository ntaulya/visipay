import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //vector up
            Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.2, -80),
              child: SvgPicture.asset(
                'images/vector.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  //gambar
                  Center(child: Image.asset('images/login.png', height: MediaQuery.of(context).size.height * 0.4)),

                  //container
                  SizedBox(height: 16),

                  //text 1
                  Text(
                    'Masuk atau Daftar',
                    style: TextSize.body1.apply(fontWeightDelta: 3),
                  ),

                  //container
                  SizedBox(height: 8),

                  //text 2
                  Text(
                    'Masuk atau Daftar cuma butuh nomor HP aja.',
                    style: TextSize.body1.apply(fontWeightDelta: 1),
                  ),

                  SizedBox(height: 16),

                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '+62 8xx - xxxx - xxxx',
                    ),
                  ),

                  SizedBox(height: 2),

                  Row(
                    children: [
                      Text(
                        'Nomor HP nggak aktif atau hilang?',
                        style: TextSize.body2.apply(fontWeightDelta: 1),
                      ),
                       GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('/home');
                          print("tes");
                        },
                         child: Text(
                          'Atur Ulang',
                          style: TextSize.body2.apply(color: Palette.Info50,fontWeightDelta: 1),
                                             ),
                       ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
        //bottom bar
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Button("Lanjutkan", onTap: () {
            Navigator.of(context).pushNamed('/register');
          },),
        ));
  }
}
