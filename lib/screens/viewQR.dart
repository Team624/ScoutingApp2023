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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Spacer(),
          getTeamsList().contains(data.team.toString())
              ? PrettyQr(
                  size: MediaQuery.of(context).size.height * 0.6,
                  data: data.toString(),
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  roundEdges: true)
              : Image.asset(
                  'assets/who_let_bro_cook.jpg',
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  await insertPerformance(data);
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
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 40, 60),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
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
