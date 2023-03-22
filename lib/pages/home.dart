import 'package:flutter/material.dart';
import 'package:visipay/core/theme/textSize.dart';
import 'package:visipay/widgets/SvgIcon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  int hexColor(String color) {
    String newColor = '0xff' + color;
    newColor = newColor.replaceAll('#', '');
    int finalColor = int.parse(newColor);
    return finalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(42.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: 'assets/on-boarding-hero.png'),
            Text(
              'Akses Transaksimu Dengan Mudah',
              style:
                  TextSize.body1.apply(color: Colors.black, fontWeightDelta: 3),
            ),
            SizedBox(height: 20),
            Text(
              'Nikmati berbagai layanan finansial dan kemudahan pembayaran dalam genggaman.',
              style: TextSize.body2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
