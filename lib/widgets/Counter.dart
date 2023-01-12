import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                color: Colors.red[500],
                height: 75,
                width: 75,
                child: Icon(Icons.remove),
              ),
              onTap: (() {
                setState(() {
                  if (counter > 0) {
                    counter--;
                  }
                });
              }),
            ),
            Container(
              color: Colors.grey[300],
              height: 50,
              width: 50,
              child: Center(
                child: Text("$counter"),
              ),
            ),
            GestureDetector(
              child: Container(
                  color: Colors.green[600],
                  height: 75,
                  width: 75,
                  child: Icon(Icons.add)),
              onTap: () {
                setState(() {
                  counter++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
