import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckBox extends StatefulWidget {
  final String text;
  const CheckBox({super.key, required this.text});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 40,
              width: 40,
              color: Colors.grey[300],
              child: isChecked
                  ? null
                  : Icon(
                      Icons.check,
                      size: 37,
                    )),
          SizedBox(width: 15),
          Text(widget.text, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
