import 'package:flutter/material.dart';
import 'package:scouting_app_2023/widgets/checkbox.dart';
import 'package:scouting_app_2023/widgets/grid/Cone.dart';
import 'package:scouting_app_2023/widgets/grid/Cube.dart';
import '../database/database.dart';
import '../database/performance.dart';
import '../widgets/grid/BottomNode.dart';

class AutonPage extends StatefulWidget {
  Performance data;
  AutonPage({super.key, required this.data});

  @override
  State<AutonPage> createState() => _AutonPageState(data: data);
}

class _AutonPageState extends State<AutonPage> {
  Performance data;
  _AutonPageState({required this.data});
  double auton_slider = 0;
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
                  data.auto_cone_H1 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_H2 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H3 = gamepiece % 3;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H4 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_H5 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H6 = gamepiece % 3;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H7 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_H8 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H9 = gamepiece % 3;
                },
              ),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M1 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_M2 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M3 = gamepiece % 3;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M4 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_M5 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M6 = gamepiece % 3;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M7 = gamepiece % 3;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_M8 = gamepiece % 3;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M9 = gamepiece % 3;
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
                    data.auto_hybrid_L1 = gamepiece % 5;
                  },
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.auto_hybrid_L2 = gamepiece % 5;
                          },
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.auto_hybrid_L3 = gamepiece % 5;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {
                    data.auto_hybrid_L4 = gamepiece % 5;
                  },
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.auto_hybrid_L5 = gamepiece % 5;
                          },
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.auto_hybrid_L6 = gamepiece % 5;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {
                    data.auto_hybrid_L7 = gamepiece % 5;
                  },
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.auto_hybrid_L8 = gamepiece % 5;
                          },
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {
                    data.auto_hybrid_L9 = gamepiece % 5;
                  },
                ),
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Slider(
                  value: auton_slider,
                  min: 0,
                  max: 3,
                  divisions: 3,
                  label: [
                    "None",
                    "Park",
                    "Docked",
                    "Engaged"
                  ][auton_slider.toInt()],
                  onChanged: (double value) {
                    setState(() {
                      auton_slider = value;
                      data.auto_charge = auton_slider.toInt();
                    });
                  },
                ),
              ),
              CheckBox(
                text: "Lost connection",
                onChecked: (checked) {
                  // print(checked);
                  data.disconnect = checked;
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
