import 'package:flutter/material.dart';
import '../database/performance.dart';
import '../widgets/checkbox.dart';
import '../widgets/timer.dart';

class EndGameScreen extends StatefulWidget {
  Performance data;
  EndGameScreen({super.key, required this.data});

  @override
  State<EndGameScreen> createState() => _EndGameScreenState();
}

class _EndGameScreenState extends State<EndGameScreen> {
  final List<Widget> charge_endgame_options = <Widget>[
    Text('None'),
    Text('Parked'),
    Text('Docked'),
    Text('Engaged')
  ];

  final List<bool> _selectedChargeEndgame = <bool>[true, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChargeTimer(data: widget.data),
          Container(height: MediaQuery.of(context).size.height / 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Charger State: "),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedChargeEndgame.length; i++) {
                        _selectedChargeEndgame[i] = i == index;
                        widget.data.charge_endgame =
                            _selectedChargeEndgame[0] == true
                                ? "None"
                                : _selectedChargeEndgame[1] == true
                                    ? "Parked"
                                    : _selectedChargeEndgame[2] == true
                                        ? "Docked"
                                        : _selectedChargeEndgame[3] == true
                                            ? "Engaged"
                                            : "";
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Color.fromARGB(255, 65, 192, 69),
                  selectedColor: Colors.black,
                  fillColor: Color.fromARGB(255, 65, 192, 69),
                  color: Color.fromARGB(255, 65, 192, 69),
                  constraints: const BoxConstraints(
                    minHeight: 50.0,
                    minWidth: 80.0,
                  ),
                  isSelected: _selectedChargeEndgame,
                  children: charge_endgame_options,
                ),
              ),
            ],
          ),
          Container(height: MediaQuery.of(context).size.height / 5),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CheckBox(
                text: "Lost connection",
                onChecked: (checked) {
                  widget.data.disconnect = checked;
                }),
            Container(width: MediaQuery.of(context).size.width / 4),
            CheckBox(
              text: "Triple Balance",
              onChecked: (checked) {
                widget.data.triple_balance = checked;
              },
            )
          ])
        ],
      ),
    );
  }
}
