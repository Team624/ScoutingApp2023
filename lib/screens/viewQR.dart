import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/utils/pretty_qr_code.dart';
import 'BottomNavBar.dart';
import 'package:scouting_app_2023/database/database.dart';

class DisplayQRcode extends StatefulWidget {
  Performance data;
  DisplayQRcode({required this.data}) : super();
  @override
  _DisplayQRcodeState createState() => _DisplayQRcodeState(data: data);
}

class _DisplayQRcodeState extends State<DisplayQRcode> {
  //All variables
  final Performance data;
  _DisplayQRcodeState({required this.data});
  @override
  Widget build(BuildContext context) {
    //setVariables();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title: Text(
            "QR Code",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 65, 192, 69),
        ),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Spacer(),
          Text(
            'Game: ' + data.match.toString(),
            style: TextStyle(height: 5, fontSize: 20),
          ),
          Text(
            'Team: ' + data.team.toString(),
            style: TextStyle(height: 5, fontSize: 20),
          ),
          Spacer(),
          PrettyQr(
              size: MediaQuery.of(context).size.width * 0.4,
              data: data.toString(),
              errorCorrectLevel: QrErrorCorrectLevel.M,
              roundEdges: true),
          Spacer(),
          TextButton(
            child: Text("DONE"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavBar(
                          currentIndex: 0,
                          data: Performance.next(data.initials, data.match + 1),
                        )),
              );
            },
          )
        ]),
      ),
    );
  }
}
