import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../database/performance.dart';

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
  final List<bool> _selectedPStartingPosition = <bool>[false, true, false];
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
                      } catch (e) {
                        widget.data.match = 0;
                        //piss
                      }
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Match #',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                      onChanged: (newText) {
                        try {
                          widget.data.team = int.parse(newText);
                        } catch (e) {
                          widget.data.team = 0;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Team #',
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
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
                          i < _selectedPStartingPosition.length;
                          i++) {
                        _selectedPStartingPosition[i] = i == index;
                        // TODO: fix this weird code, it works but is weird
                        widget.data.position =
                            _selectedPStartingPosition[0] == true
                                ? "Left"
                                : _selectedPStartingPosition[1] == true
                                    ? "Center"
                                    : _selectedPStartingPosition[2] == true
                                        ? "Right"
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
                  isSelected: _selectedPStartingPosition,
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
                      // TODO: fix this weird code, it works but is weird
                      widget.data.preload =
                          _selectedPreloadedGamepiece[0] == true
                              ? "None"
                              : _selectedPreloadedGamepiece[1] == true
                                  ? "Cone"
                                  : _selectedPreloadedGamepiece[2] == true
                                      ? "Cube"
                                      : "";
                      print(widget.data.preload);
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
