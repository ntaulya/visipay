import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clipboard/clipboard.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Copy Text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String textToCopy = '0763846';

  void _copyTextToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: textToCopy));

    final snackBar = SnackBar(
      content: Text('Teks berhasil disalin'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Copy Text Demo'),
      ),
      body: Center(
        child: Semantics(
          hint: "tekan untuk menyalin nomor VA",
          label: "Virtual Account BCA",
          child: GestureDetector(
            onTap: () => _copyTextToClipboard(context),
            child: Text(
              textToCopy,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
