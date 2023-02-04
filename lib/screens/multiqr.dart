import 'package:flutter/material.dart';

import '../utils/pretty_qr.dart';
import '../utils/pretty_qr_code.dart';

class MultiQrCode extends StatefulWidget {
  String data;
  MultiQrCode({required this.data});

  @override
  State<StatefulWidget> createState() => _MultiQrCodeState(data: data);
}

class _MultiQrCodeState extends State<MultiQrCode> {
  final MAX_MATCHES_PER_QR = 3;

  String data;

  _MultiQrCodeState({required this.data});

  int _currentCode = 0;

  @override
  Widget build(BuildContext context) {
    List<String> splitData = data.split("\n");

    splitData.removeAt(splitData.length - 1);

    String dataToScan = "";
    for (int i = _currentCode * MAX_MATCHES_PER_QR;
        i < (_currentCode + 1) * MAX_MATCHES_PER_QR && i < splitData.length;
        i++) {
      dataToScan += splitData[i] + "\n";
    }

    bool isFinalCode = _currentCode ==
        (((splitData.length / MAX_MATCHES_PER_QR) - 0.1).floor());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title: Text(
            "QR Code ${_currentCode + 1} / ${((splitData.length / MAX_MATCHES_PER_QR) - 0.1).floor() + 1}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
            ),
          ),
          leading: IconButton(
            icon: Image.asset(
              'assets/624logo.png',
            ),
            onPressed: () {},
          ),
          backgroundColor: Color.fromARGB(255, 65, 192, 69),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrettyQr(
              data: dataToScan,
              size: MediaQuery.of(context).size.width * 0.40,
              errorCorrectLevel: QrErrorCorrectLevel.M,
              roundEdges: true,
            ),
            ElevatedButton(
                onPressed: () {
                  if (isFinalCode) {
                    Navigator.pop(context);
                    return;
                  }
                  setState(() {
                    _currentCode++;
                  });
                },
                child: Text(isFinalCode ? "Done" : "Next"))
          ],
        ),
      ),
    );
  }
}
