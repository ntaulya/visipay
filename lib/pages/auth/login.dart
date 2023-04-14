import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  
import 'package:visipay/core/theme/textSize.dart';

class Login extends StatelessWidget {
   Login({super.key});

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
              padding:  const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  //gambar
                  // Center(child: Image.asset('images/login.png', height: MediaQuery.of(context).size.height * 0.4)),

                  //container
                  SizedBox(height: 16),

                  //text 1
                  Text(
                    'Masuk atau Daftar',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  //container
                  SizedBox(height: 8),

                  //text 2
                  Text(
                    'Masuk atau Daftar cuma butuh nomor HP aja.',
                    style: GoogleFonts.nunito(
                      textStyle: Nunito_17px,
                      fontWeight: FontWeight.normal
                    ),
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
                        style: GoogleFonts.nunito(
                          textStyle: Nunito_17px,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                       GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('/home');
                          print("tes");
                        },
                         child: Text(
                          'Atur Ulang',
                          style: GoogleFonts.nunito(
                            textStyle: Nunito_17px,
                            fontWeight: FontWeight.normal
                          ),
                                             ),
                       )],
                  ),

                ],
              ),
            ),
          ],
        ),
        //bottom bar
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(40.0),
          child: TextButton(child: Text("Lanjutkan"), onPressed: () {

            Navigator.of(context).pushNamed('/home');
          
          },),
        ));
  }
}
