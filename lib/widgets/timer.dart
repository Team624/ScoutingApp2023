/*

This should probably be deleted soon

*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../database/performance.dart';

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
          height: 75,
          width: 75,
          child: Center(
            child: Text(
                stopwatch.elapsed.inSeconds.toString() +
                    "." +
                    (stopwatch.elapsed.inMilliseconds % 1000).toString(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
          child: const Text('Start/Stop'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              stopwatch.stop();
              stopwatch.reset();
              widget.data.charging_station_time = 0;
            });
          },
          child: const Text('I messed up button'),
        ),
      ],
    ));
  }
}
