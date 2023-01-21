import 'package:flutter/material.dart';
import 'package:scouting_app_2023/screens/viewQR.dart';
// import 'package:scouting_app/backend/csv/CsvUtil.dart';
// import 'package:scouting_app/backend/csv/MatchData.dart';
// import 'package:scouting_app/pages/DataView.dart';

import '../database/database.dart';
import '../database/performance.dart';

class ReviewPage extends StatefulWidget {
  Performance data;
  ReviewPage({required this.data}) : super();
  @override
  _ReviewPageState createState() => _ReviewPageState(data: data);
}

class _ReviewPageState extends State<ReviewPage> {
  Performance data;
  _ReviewPageState({required this.data});

  int calculatePointsAuton() {
    int top_count = 0;
    int mid_count = 0;
    int bottom_count = 0;
    List<int> top_nodes = [
      data.auto_cone_H1,
      data.auto_cube_H2,
      data.auto_cone_H3,
      data.auto_cone_H4,
      data.auto_cube_H5,
      data.auto_cone_H6,
      data.auto_cone_H7,
      data.auto_cube_H8,
      data.auto_cone_H9
    ];
    List<int> mid_nodes = [
      data.auto_cone_M1,
      data.auto_cube_M2,
      data.auto_cone_M3,
      data.auto_cone_M4,
      data.auto_cube_M5,
      data.auto_cone_M6,
      data.auto_cone_M7,
      data.auto_cube_M8,
      data.auto_cone_M9
    ];
    List<int> bottom_nodes = [
      data.auto_hybrid_L1,
      data.auto_hybrid_L2,
      data.auto_hybrid_L3,
      data.auto_hybrid_L4,
      data.auto_hybrid_L5,
      data.auto_hybrid_L6,
      data.auto_hybrid_L7,
      data.auto_hybrid_L8,
      data.auto_hybrid_L9
    ];
    for (int value in top_nodes) {
      if (value == 1) {
        top_count++;
      }
    }
    for (int value in mid_nodes) {
      if (value == 1) {
        mid_count++;
      }
    }
    for (int value in bottom_nodes) {
      if (value == 1 || value == 2) {
        bottom_count++;
      }
    }
    return top_count * 6 +
        mid_count * 4 +
        bottom_count * 2 +
        (data.auto_charge == 1
            ? 8
            : data.auto_charge == 2
                ? 12
                : 0);
  }

  int calculatePointsTeleop() {
    int top_count = 0;
    int mid_count = 0;
    int bottom_count = 0;
    List<int> top_nodes = [
      data.teleop_cone_H1,
      data.teleop_cube_H2,
      data.teleop_cone_H3,
      data.teleop_cone_H4,
      data.teleop_cube_H5,
      data.teleop_cone_H6,
      data.teleop_cone_H7,
      data.teleop_cube_H8,
      data.teleop_cone_H9
    ];
    List<int> mid_nodes = [
      data.teleop_cone_M1,
      data.teleop_cube_M2,
      data.teleop_cone_M3,
      data.teleop_cone_M4,
      data.teleop_cube_M5,
      data.teleop_cone_M6,
      data.teleop_cone_M7,
      data.teleop_cube_M8,
      data.teleop_cone_M9
    ];
    List<int> bottom_nodes = [
      data.teleop_hybrid_L1,
      data.teleop_hybrid_L2,
      data.teleop_hybrid_L3,
      data.teleop_hybrid_L4,
      data.teleop_hybrid_L5,
      data.teleop_hybrid_L6,
      data.teleop_hybrid_L7,
      data.teleop_hybrid_L8,
      data.teleop_hybrid_L9
    ];
    for (int value in top_nodes) {
      if (value == 1) {
        top_count++;
      }
    }
    for (int value in mid_nodes) {
      if (value == 1) {
        mid_count++;
      }
    }
    for (int value in bottom_nodes) {
      if (value == 1 || value == 2) {
        bottom_count++;
      }
    }
    return top_count * 5 + mid_count * 3 + bottom_count * 2;
  }

  int calculatePointsEndgame() {
    return (data.auto_charge == 2
        ? 8
        : data.auto_charge == 3
            ? 12
            : 0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Your Data", style: TextStyle(fontSize: 30.0)),
            Container(
              margin: EdgeInsets.all(20),
              child: Table(
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Text('Auton', style: TextStyle(fontSize: 40.0))
                      ]),
                      Column(children: [
                        Text(calculatePointsAuton().toString(),
                            style: TextStyle(fontSize: 40.0))
                      ])
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text('Teleop', style: TextStyle(fontSize: 40.0))
                      ]),
                      Column(children: [
                        Text(calculatePointsTeleop().toString(),
                            style: TextStyle(fontSize: 40.0))
                      ])
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text('Charging station',
                            style: TextStyle(fontSize: 40.0))
                      ]),
                      Column(children: [
                        Text(calculatePointsEndgame().toString(),
                            style: TextStyle(fontSize: 40.0))
                      ])
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text('Total', style: TextStyle(fontSize: 40.0))
                      ]),
                      Column(children: [
                        Text(
                            (calculatePointsAuton() +
                                    calculatePointsTeleop() +
                                    calculatePointsEndgame())
                                .toString(),
                            style: TextStyle(fontSize: 40.0))
                      ])
                    ]),
                  ]),
            ),
            // TextButton(
            //   onPressed: () {
            //     if (data.match != 0 && data.team != 0) {
            //       // CsvUtil.saveMatch(data);

            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => DisplayQRcode(data: data)),
            //       );
            //     } else {
            //       // Fluttertoast.showToast(
            //       //     msg: "Team and/or Match Number is 0", // message
            //       //     toastLength: Toast.LENGTH_SHORT, // length
            //       //     gravity: ToastGravity.CENTER, // location
            //       //     timeInSecForIosWeb: 2 // duration
            //       //     );
            //     }
            //   },
            //   child: Text('Submit', style: TextStyle(fontSize: 30.0)),
            // ),
            TextButton(
              onPressed: () async {
                await insertPerformance(data);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisplayQRcode(data: data)),
                );
              },
              child: Text('Generate QR Code', style: TextStyle(fontSize: 30.0)),
            ),
          ],
        ),
      ),
    );
  }
}
