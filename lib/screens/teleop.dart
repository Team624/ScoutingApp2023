import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/screens/viewQR.dart';
import 'package:scouting_app_2023/widgets/teleop/Counter.dart';
import 'package:scouting_app_2023/widgets/checkbox.dart';
// import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';
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
              CheckBox(
                text: "Lost connection",
                onChecked: (checked) {
                  print(
                      "The checkbox is currently ${checked ? "checked" : "unchecked"}");
                },
              ),
              Counter(onChanged: (numFouls) {}, text: "Fouls Committed"),
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
