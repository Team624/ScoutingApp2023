import 'package:flutter/material.dart';

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
