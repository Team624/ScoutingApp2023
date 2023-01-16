import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/screens/viewQR.dart';
import 'package:scouting_app_2023/widgets/Counter.dart';
import 'package:scouting_app_2023/widgets/checkbox.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';
import 'package:scouting_app_2023/database/database.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text("Top"), Text("Mid"), Text("Bot.")],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue[300],
              ),
              child: StepperSwipe(
                stepperValue: counter,
                initialValue: 0,
                speedTransitionLimitCount: 3, //Trigger count for fast counting
                onChanged: (int value) {
                  setState(() {
                    counter = value;
                    //update values for the match
                    data.fouls_committed = counter;
                  });
                },
                firstIncrementDuration: Duration(
                    milliseconds: 250), //Unit time before fast counting
                secondIncrementDuration: Duration(
                    milliseconds: 100), //Unit time during fast counting
                direction: Axis.horizontal,
                dragButtonColor: Colors.blueAccent,
                maxValue: 9,
                minValue: 0,
              ),
              height: 90,
              width: 200,
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
              child: Text('Submit', style: TextStyle(fontSize: 30.0)),
            ),
          ],
        ),
      ],
    );
  }
}
