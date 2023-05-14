import 'package:flutter/material.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/widgets/checkbox.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 80,
              ),
              Text(
                "Charging Station",
                style: TextStyle(fontSize: 25),
              ),
              Container(height: 26),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 5,
                child: ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _selectedChargeEndgame.length; i++) {
                        _selectedChargeEndgame[i] = i == index;
                      }
                      widget.data.charge_endgame =
                          _selectedChargeEndgame.indexOf(true);
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Color.fromARGB(255, 65, 192, 69),
                  selectedColor: Colors.black,
                  fillColor: Color.fromARGB(255, 65, 192, 69),
                  color: Color.fromARGB(255, 65, 192, 69),
                  constraints: const BoxConstraints(
                    minHeight: 80.0,
                    minWidth: 120.0,
                  ),
                  isSelected: _selectedChargeEndgame,
                  children: charge_endgame_options,
                ),
              ),
            ],
          ),
          Column(
            children: [
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
              ]),
              Container(height: 20)
            ],
          )
        ],
      ),
    );
  }
}
