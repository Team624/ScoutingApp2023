import 'package:flutter/material.dart';
import 'package:scouting_app_2023/screens/viewQR.dart';
import 'package:scouting_app_2023/widgets/auton/chargerSwitch.dart';
import 'package:scouting_app_2023/widgets/checkbox.dart';
import 'package:scouting_app_2023/widgets/grid/Cone.dart';
import 'package:scouting_app_2023/widgets/grid/Cube.dart';
import 'package:scouting_app_2023/widgets/teleop/Counter.dart';

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
                  print(gamepiece);
                },
              ),
              Cube(
                onChanged: (gamepiece) {
                  print(gamepiece);
                },
              ),
              Cone(
                onChanged: (gamepiece) {},
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {},
              ),
              Cube(
                onChanged: (gamepiece) {},
              ),
              Cone(
                onChanged: (gamepiece) {},
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {},
              ),
              Cube(
                onChanged: (gamepiece) {},
              ),
              Cone(
                onChanged: (gamepiece) {},
              ),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {},
              ),
              Cube(
                onChanged: (gamepiece) {},
              ),
              Cone(
                onChanged: (gamepiece) {},
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {},
              ),
              Cube(
                onChanged: (gamepiece) {},
              ),
              Cone(
                onChanged: (gamepiece) {},
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Cone(
                onChanged: (gamepiece) {
                  print(gamepiece);
                },
              ),
              Cube(
                onChanged: (gamepiece) {},
              ),
              Cone(
                onChanged: (gamepiece) {},
              ),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {},
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {},
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {},
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {},
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNode(
                  onChanged: (gamepiece) {},
                ),
                SizedBox(
                    child: Container(
                        width: 90,
                        child: BottomNode(
                          onChanged: (gamepiece) {},
                        ))),
                BottomNode(
                  onChanged: (gamepiece) {},
                ),
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChargerSwitch(),
              CheckBox(
                text: "Lost connection",
                onChecked: (checked) {
                  print(
                      "The checkbox is currently ${checked ? "checked" : "unchecked"}");
                },
              ),
              TextButton(
                onPressed: () async {
                  await insertPerformance(data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayQRcode(data: data)),
                  );
                },
                child: Text('Save', style: TextStyle(fontSize: 30.0)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
