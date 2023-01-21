import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/screens/viewQR.dart';
import 'package:scouting_app_2023/widgets/Counter.dart';
import 'package:scouting_app_2023/database/database.dart';

import '../widgets/grid/BottomNode.dart';
import '../widgets/grid/Cone.dart';
import '../widgets/grid/Cube.dart';

class Teleop extends StatefulWidget {
  Performance data;
  Teleop({required this.data}) : super();
  @override
  _TeleopState createState() => _TeleopState(data: data);
}

class _TeleopState extends State<Teleop> {
  Performance data;
  _TeleopState({required this.data});
  //connected to fouls committed
  int counter = 0;
  //only 1 counter in the code
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_H1 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.teleop_cube_H2 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_H3 = gamepiece % 3;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_H4 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.teleop_cube_H5 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_H6 = gamepiece % 3;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_H7 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.teleop_cube_H8 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_H9 = gamepiece % 3;
                },
              ),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_M1 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.teleop_cube_M2 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_M3 = gamepiece % 3;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_M4 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.teleop_cube_M5 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_M6 = gamepiece % 3;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_M7 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.teleop_cube_M8 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.teleop_cone_M9 = gamepiece % 3;
                },
              ),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L1 = gamepiece % 5;
                  },
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.teleop_hybrid_L2 = gamepiece % 5;
                          },
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L3 = gamepiece % 5;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L4 = gamepiece % 5;
                  },
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.teleop_hybrid_L5 = gamepiece % 5;
                          },
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L6 = gamepiece % 5;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L7 = gamepiece % 5;
                  },
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.teleop_hybrid_L8 = gamepiece % 5;
                          },
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L9 = gamepiece % 5;
                  },
                ),
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Counter(
                  onChanged: (numCycles) {
                    data.cycles = numCycles;
                  },
                  text: "Cycles"),
              Counter(
                  onChanged: (numFouls) {
                    data.fouls_committed = numFouls;
                  },
                  text: "Fouls Committed"),
              // TextButton(
              //   onPressed: () async {
              //     await insertPerformance(data);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => DisplayQRcode(data: data)),
              //     );
              //   },
              //   child: Text('Save', style: TextStyle(fontSize: 30.0)),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
