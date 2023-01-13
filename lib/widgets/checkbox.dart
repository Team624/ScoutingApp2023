import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Checkbox extends StatefulWidget {
  final String text;
  const Checkbox({super.key, required this.text});

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Container(
              height: 40,
              width: 40,
              color: Colors.grey[300],
              child: isChecked
                  ? null
                  : Icon(
                      Icons.check,
                      size: 37,
                    )),
        ),
        SizedBox(width: 15),
        Text(widget.text, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
