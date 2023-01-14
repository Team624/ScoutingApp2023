import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scouting_app_2023/widgets/Counter.dart';
import 'package:scouting_app_2023/widgets/checkbox.dart';
// import 'package:counter_button/counter_button.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class TeleOpPage extends StatefulWidget {
  const TeleOpPage({Key? key}) : super(key: key);

  @override
  State<TeleOpPage> createState() => _TeleOpPageState();
}

class _TeleOpPageState extends State<TeleOpPage> {
  int counter = 0;

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
            )
          ],
        ),
      ],
    );
  }
}
