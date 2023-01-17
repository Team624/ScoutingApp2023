import 'package:flutter/material.dart';

class CycleTimer extends StatefulWidget {
  const CycleTimer({super.key});

  @override
  State<CycleTimer> createState() => _CycleTimerState();
}

class _CycleTimerState extends State<CycleTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 75,
          width: 75,
          child: Text("0.0s"),
        )
      ],
    ));
  }
}
