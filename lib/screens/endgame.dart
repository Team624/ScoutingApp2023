import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../database/performance.dart';
import '../widgets/timer.dart';

class EndGameScreen extends StatefulWidget {
  Performance data;
  EndGameScreen({super.key, required this.data});

  @override
  State<EndGameScreen> createState() => _EndGameScreenState();
}

class _EndGameScreenState extends State<EndGameScreen> {
  double charger_state = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChargeTimer(data: widget.data),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: Slider(
              value: charger_state,
              min: 0,
              max: 3,
              divisions: 3,
              label: [
                "None",
                "Park",
                "Docked",
                "Engaged"
              ][charger_state.toInt()],
              onChanged: (double value) {
                setState(() {
                  charger_state = value;
                  widget.data.auto_charge = charger_state.toInt();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
