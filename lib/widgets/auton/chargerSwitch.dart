import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChargerSwitch extends StatefulWidget {
  const ChargerSwitch({super.key});

  @override
  State<ChargerSwitch> createState() => _ChargerSwitchState();
}

class _ChargerSwitchState extends State<ChargerSwitch> {
  int chargerStatus = 0;
  // 0 = not attempted, 1 = docked, 2 = engaged

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("Charge Station", style: TextStyle(fontSize: 20)),
      SizedBox(width: 10),
      GestureDetector(
        onTap: () {
          setState(() {
            chargerStatus = (chargerStatus + 1) % 3;
          });
        },
        child: Container(
            width: 90,
            height: 50,
            color: Colors.grey[400],
            child: Center(
              child: Text(chargerStatus == 0
                  ? "None"
                  : chargerStatus == 1
                      ? "Docked"
                      : "Engaged"),
            )),
      ),
    ]);
  }
}
