import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/database.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/utils/pretty_qr_code.dart';
import 'package:scouting_app_2023/screens/BottomNavBar.dart';
import 'package:scouting_app_2023/utils/teams.dart';
import 'dataview.dart';

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
          leading: IconButton(
            icon: Image.asset(
              'assets/624logo.png',
              height: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DataView()));
            },
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  await insertPerformance(data);
                  if (data.initials.toString().length == 2 &&
                      data.team.toString() != "1") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavBar(
                                currentIndex: 0,
                                data: Performance.next(
                                  data.initials,
                                  data.match + 1,
                                ),
                              )),
                    );
                  } else if (data.initials.toString().length != 2) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text("Scouter Initials Not Properly Defined"),
                        content: Text(
                          "Go back to prematch",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (data.team.toString() == "1") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text("Invalid Team Number"),
                        content: Text(
                          "Go back to prematch",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 40, 60),
                  padding:
                      const EdgeInsets.symmetric(vertical: 38, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "DONE",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          Spacer()
        ]),
      ),
    );
  }
}
