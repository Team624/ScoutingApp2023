import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/performance.dart';

class ChargeTimer extends StatefulWidget {
  Performance data;

  ChargeTimer({super.key, required this.data});

  @override
  State<ChargeTimer> createState() => _ChargeTimerState();
}

class _ChargeTimerState extends State<ChargeTimer> {
  final stopwatch = Stopwatch();
  @override
  Widget build(BuildContext context) {
    var repeat = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      setState(() {});
    });
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
          height: 100,
          width: 100,
          child: Center(
            child: Text(
                stopwatch.elapsed.inSeconds.toString() +
                    "." +
                    (stopwatch.elapsed.inMilliseconds % 1000).toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              stopwatch.isRunning ? stopwatch.stop() : stopwatch.start();
              if (!stopwatch.isRunning) {
                widget.data.charging_station_time =
                    (stopwatch.elapsed.inMilliseconds / 100).round();
              }
            });
          },
          child: const Text('Start/Stop', style: TextStyle(fontSize: 20)),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              stopwatch.stop();
              stopwatch.reset();
              widget.data.charging_station_time = 0;
            });
          },
          child: const Text('Reset', style: TextStyle(fontSize: 20)),
        ),
      ],
    ));
  }
}
