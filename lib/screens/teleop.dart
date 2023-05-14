import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/widgets/Counter.dart';
import 'package:scouting_app_2023/widgets/grid/BottomNode.dart';
import 'package:scouting_app_2023/widgets/grid/Cone.dart';
import 'package:scouting_app_2023/widgets/grid/Cube.dart';

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
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_H1 = gamepiece;
                },
              ),
              Cube(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cube_H2 = gamepiece;
                },
              ),
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_H3 = gamepiece;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_H4 = gamepiece;
                },
              ),
              Cube(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cube_H5 = gamepiece;
                },
              ),
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_H6 = gamepiece;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_H7 = gamepiece;
                },
              ),
              Cube(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cube_H8 = gamepiece;
                },
              ),
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_H9 = gamepiece;
                },
              ),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_M1 = gamepiece;
                },
              ),
              Cube(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cube_M2 = gamepiece;
                },
              ),
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_M3 = gamepiece;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_M4 = gamepiece;
                },
              ),
              Cube(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cube_M5 = gamepiece;
                },
              ),
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_M6 = gamepiece;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_M7 = gamepiece;
                },
              ),
              Cube(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cube_M8 = gamepiece;
                },
              ),
              Cone(
                hideFailed: true,
                onChanged: (gamepiece) {
                  data.teleop_cone_M9 = gamepiece;
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
                    data.teleop_hybrid_L1 = gamepiece;
                  },
                  hideFailed: true,
                ),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L2 = gamepiece;
                  },
                  hideFailed: true,
                ),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L3 = gamepiece;
                  },
                  hideFailed: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L4 = gamepiece;
                  },
                  hideFailed: true,
                ),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L5 = gamepiece;
                  },
                  hideFailed: true,
                ),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L6 = gamepiece;
                  },
                  hideFailed: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L7 = gamepiece;
                  },
                  hideFailed: true,
                ),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L8 = gamepiece;
                  },
                  hideFailed: true,
                ),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.teleop_hybrid_L9 = gamepiece;
                  },
                  hideFailed: true,
                ),
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Counter(
                  onChanged: (numdrops) {
                    data.drops = numdrops;
                  },
                  text: "Drops"),
              Counter(
                  onChanged: (numFouls) {
                    data.fouls_committed = numFouls;
                  },
                  text: "Fouls Committed"),
            ],
          )
        ],
      ),
    );
  }
}
