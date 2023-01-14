import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key, onPressed}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
