import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scouting_app_2023/widgets/Counter.dart';
import 'package:scouting_app_2023/widgets/checkbox.dart';
import 'package:counter_button/counter_button.dart';

class TeleOpPage extends StatefulWidget {
  const TeleOpPage({Key? key}) : super(key: key);

  @override
  State<TeleOpPage> createState() => _TeleOpPageState();
}

class _TeleOpPageState extends State<TeleOpPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text("Top"), Text("Mid"), Text("Bot.")],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                child: CounterButton(
                    count: 1, onChange: (int num) {}, loading: false),
                width: 175,
                height: 60),
            CounterButton(count: 1, onChange: (int num) {}, loading: false),
            CounterButton(count: 1, onChange: (int num) {}, loading: false),
            Checkbox(text: "sussy amogus checkmark")
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CounterButton(count: 1, onChange: (int num) {}, loading: false),
            CounterButton(count: 1, onChange: (int num) {}, loading: false),
            CounterButton(count: 1, onChange: (int num) {}, loading: false),
            Checkbox(text: "amogus checkmark 2")
          ],
        ),
      ],
    );
  }
}
