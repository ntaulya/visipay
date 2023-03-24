import 'package:flutter/material.dart';
import 'package:visipay/core/theme/palette.dart';
import 'package:visipay/core/theme/textSize.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Palette.Primary50,
              width: 375.0,
              height: 165.0,
            )
            Text('Masukkan PIN',style: TextSize.body1.apply(fontWeightDelta: 2)),
          ]
          ));
  }
}
