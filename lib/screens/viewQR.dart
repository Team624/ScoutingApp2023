import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/database.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/utils/pretty_qr_code.dart';
import 'package:scouting_app_2023/screens/BottomNavBar.dart';

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
            data.team.toString() + " in Match " + data.match.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 0, 244, 0),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Spacer(),
          PrettyQr(
              size: MediaQuery.of(context).size.height * 0.6,
              data: data.toString(),
              errorCorrectLevel: QrErrorCorrectLevel.M,
              roundEdges: true),
          Spacer(),
          TextButton(
            child: Text("DONE"),
            onPressed: () async {
              await insertPerformance(data);
              print(await viewDB());
              print(await data.toMap());
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
