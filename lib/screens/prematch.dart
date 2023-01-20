import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../database/performance.dart';

class PreMatchScreen extends StatefulWidget {
  Performance data;
  PreMatchScreen({super.key, required this.data});

  @override
  State<PreMatchScreen> createState() => _PreMatchScreenState();
}

class _PreMatchScreenState extends State<PreMatchScreen> {
  double startingLocation = 0;

  List startingPoses = [
    "Left",
    "Center",
    "Right",
  ];

  final List<Widget> preloadables = <Widget>[
    Text('None'),
    Text('Cone'),
    Text('Cube')
  ];

  final List<bool> _selectedPreloadedGamepiece = <bool>[true, false, false];
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
                      widget.data.match = int.parse(newText);
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      widget.data.team = int.parse(newText);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Team #',
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Scouter Initials',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Slider(
                  value: startingLocation,
                  min: 0,
                  max: 2,
                  divisions: 2,
                  label: startingPoses[startingLocation.toInt()],
                  onChanged: (double value) {
                    setState(() {
                      startingLocation = value;
                      widget.data.position =
                          (startingPoses[value.toInt()] as String)
                              .substring(0, 1);
                    });
                  },
                ),
              ),
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
                selectedBorderColor: Colors.red[700],
                selectedColor: Colors.white,
                fillColor: Colors.red[200],
                color: Colors.red[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
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
