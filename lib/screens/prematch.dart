import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/utils/teams.dart';

class PreMatchScreen extends StatefulWidget {
  Performance data;
  PreMatchScreen({super.key, required this.data});

  @override
  State<PreMatchScreen> createState() => _PreMatchScreenState();
}

class _PreMatchScreenState extends State<PreMatchScreen> {
  final List<Widget> starting_poses = <Widget>[
    Text('Left'),
    Text('Center'),
    Text('Right')
  ];

  final List<Widget> preloadables = <Widget>[
    Text('None'),
    Text('Cone'),
    Text('Cube')
  ];

  final List<bool> _selectedPreloadedGamepiece = <bool>[true, false, false];
  final List<bool> _selectedStartingPosition = <bool>[false, true, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    onChanged: (newText) {
                      try {
                        widget.data.match = int.parse(newText);
                      } catch (e) {}
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(
                        text: widget.data.match.toString()),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Match #',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: CustomTextField(
                      data: widget.data,
                      textEditingController: new TextEditingController(
                          text: widget.data.team.toString()),
                    )),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller:
                        TextEditingController(text: widget.data.initials),
                    onChanged: (newValue) {
                      widget.data.initials = newValue;
                    },
                    inputFormatters: [LengthLimitingTextInputFormatter(2)],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Scouter Initials',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Starting Position:  "),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0;
                          i < _selectedStartingPosition.length;
                          i++) {
                        _selectedStartingPosition[i] = i == index;
                      }
                      widget.data.position =
                          _selectedStartingPosition.indexOf(true);
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
                  isSelected: _selectedStartingPosition,
                  children: starting_poses,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 6,
              ),
              Text("Preload:       "),
              ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0;
                        i < _selectedPreloadedGamepiece.length;
                        i++) {
                      _selectedPreloadedGamepiece[i] = i == index;
                    }
                    widget.data.preload =
                        _selectedPreloadedGamepiece.indexOf(true);
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
                isSelected: _selectedPreloadedGamepiece,
                children: preloadables,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  @override
  TextEditingController textEditingController;
  Performance data;
  CustomTextField(
      {super.key, required this.textEditingController, required this.data});
  _CustomTextFieldState createState() => _CustomTextFieldState(
      textEditingController: textEditingController, data: data);
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController textEditingController;
  Performance data;
  _CustomTextFieldState(
      {required this.textEditingController, required this.data});
  IconData _icon = Icons.close;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: Icon(_icon),
        border: OutlineInputBorder(),
        hintText: 'Team #',
      ),
      controller: textEditingController,
      onChanged: (text) {
        try {
          data.team = int.parse(text);
        } catch (e) {}
        setState(() {
          if (getTeamsList().contains(data.team.toString())) {
            _icon = Icons.check_box;
          } else {
            _icon = Icons.close;
          }
        });
      },
    );
  }
}
