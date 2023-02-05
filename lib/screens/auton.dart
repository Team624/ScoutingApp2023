import 'package:flutter/material.dart';
import 'package:scouting_app_2023/widgets/checkbox.dart';
import 'package:scouting_app_2023/widgets/grid/Cone.dart';
import 'package:scouting_app_2023/widgets/grid/Cube.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/widgets/grid/BottomNode.dart';

class AutonPage extends StatefulWidget {
  Performance data;
  AutonPage({super.key, required this.data});

  @override
  State<AutonPage> createState() => _AutonPageState(data: data);
}

class _AutonPageState extends State<AutonPage> {
  final List<Widget> charge_auto_options = <Widget>[
    Text('None'),
    Text('Docked'),
    Text('Engaged')
  ];

  final List<bool> _selectedChargeAuton = <bool>[true, false, false];
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
                  data.auto_cone_H1 = gamepiece;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_H2 = gamepiece;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H3 = gamepiece;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H4 = gamepiece;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_H5 = gamepiece;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H6 = gamepiece;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H7 = gamepiece;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_H8 = gamepiece;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_H9 = gamepiece;
                },
              ),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M1 = gamepiece;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_M2 = gamepiece;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M3 = gamepiece;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M4 = gamepiece;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_M5 = gamepiece;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M6 = gamepiece;
                },
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M7 = gamepiece;
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  data.auto_cube_M8 = gamepiece;
                },
              ),
              Cone(
                onChanged: (gamepiece) {
                  data.auto_cone_M9 = gamepiece;
                },
              ),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 90,
                  child: BottomNode(
                    onChanged: (gamepiece) {
                      data.auto_hybrid_L1 = gamepiece;
                    },
                  ),
                ),
                SizedBox(
                    height: 113,
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.auto_hybrid_L2 = gamepiece;
                          },
                        ))),
                SizedBox(
                  width: 90,
                  child: BottomNode(
                    onChanged: (gamepiece) {
                      data.auto_hybrid_L3 = gamepiece;
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 90,
                  child: BottomNode(
                    onChanged: (gamepiece) {
                      data.auto_hybrid_L4 = gamepiece;
                    },
                  ),
                ),
                SizedBox(
                    height: 113,
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.auto_hybrid_L5 = gamepiece;
                          },
                        ))),
                SizedBox(
                  width: 90,
                  child: BottomNode(
                    onChanged: (gamepiece) {
                      data.auto_hybrid_L6 = gamepiece;
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 90,
                  height: 113,
                  child: BottomNode(
                    onChanged: (gamepiece) {
                      data.auto_hybrid_L7 = gamepiece;
                    },
                  ),
                ),
                SizedBox(
                    child: Container(
                        height: 113,
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {
                            data.auto_hybrid_L8 = gamepiece;
                          },
                        ))),
                SizedBox(
                  width: 90,
                  height: 113,
                  child: BottomNode(
                    onChanged: (gamepiece) {
                      data.auto_hybrid_L9 = gamepiece;
                    },
                  ),
                ),
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  CheckBox(
                    text: "Left Community",
                    onChecked: (checked) {
                      widget.data.move = checked;
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  Text("Auton charge station:  "),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0;
                              i < _selectedChargeAuton.length;
                              i++) {
                            _selectedChargeAuton[i] = i == index;
                          }
                          widget.data.auto_charge =
                              _selectedChargeAuton.indexOf(true);
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Color.fromARGB(255, 65, 192, 69),
                      selectedColor: Colors.black,
                      fillColor: Color.fromARGB(255, 65, 192, 69),
                      color: Color.fromARGB(255, 65, 192, 69),
                      constraints: const BoxConstraints(
                        minHeight: 50.0,
                        minWidth: 80.0,
                      ),
                      isSelected: _selectedChargeAuton,
                      children: charge_auto_options,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
