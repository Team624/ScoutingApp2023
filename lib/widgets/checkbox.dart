import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final String text;
  final onChecked;
  const CheckBox({super.key, required this.text, required this.onChecked});

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
          widget.onChecked(isChecked);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 50,
              width: 50,
              color: Colors.grey[300],
              child: !isChecked
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
