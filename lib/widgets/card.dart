import 'package:flutter/material.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:google_fonts/google_fonts.dart';

class CardButton extends StatelessWidget {

  final String? image;
  final String? text;
  const CardButton({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                              Image.asset(image!,width: 48,height: 48,),
                              SizedBox(height: 8,),
                              Text(
                                text!,
                                style: GoogleFonts.nunito(
                                  textStyle: Nunito_15px,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
          );
}
}