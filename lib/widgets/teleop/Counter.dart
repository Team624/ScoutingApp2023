import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Counter extends StatefulWidget {
  final String text;
  final onChanged;
  const Counter({Key? key, required this.onChanged, required this.text})
      : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.blueAccent),
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text, style: const TextStyle(fontSize: 17.5)),
          GestureDetector(
            child: const Icon(Icons.remove, size: 50),
            onTap: () {
              setState(() {
                counter--;
                widget.onChanged(counter);
              });
            },
          ),
          Text(counter.toString(), style: const TextStyle(fontSize: 25)),
          GestureDetector(
            child: const Icon(Icons.add, size: 50),
            onTap: () {
              setState(() {
                counter++;
                widget.onChanged(counter);
              });
            },
          ),
        ],
      ),
    );
  }
}
