import 'package:flutter/material.dart';
import 'package:scouting_app_2023/screens/auton.dart';
import 'package:scouting_app_2023/screens/endgame.dart';
import 'package:scouting_app_2023/screens/prematch.dart';
import 'package:scouting_app_2023/screens/viewQR.dart';
import 'package:scouting_app_2023/screens/teleop.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'package:scouting_app_2023/custom_icons.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex;
  Performance data;
  BottomNavBar({required this.currentIndex, required this.data}) : super();
  @override
  _BottomNavBarState createState() =>
      _BottomNavBarState(currentIndex: currentIndex, data: data);
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex;
  Performance data;
  _BottomNavBarState({required this.currentIndex, required this.data});
  Performance getMap() {
    return data;
  }

  void setMap(Performance newData) {
    data = newData;
  }

  @override
  Widget build(BuildContext context) {
    var screens = [
      PreMatchScreen(data: data),
      AutonPage(data: data),
      Teleop(data: data),
      EndGameScreen(data: data),
      DisplayQRcode(data: data)
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 65, 192, 69),
          iconSize: 25,
          selectedIconTheme: const IconThemeData(size: 35),
          selectedFontSize: 15,
          unselectedFontSize: 10,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey[750],
          ),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.bxs_grid_alt),
              label: 'Prematch',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.bxs_bot),
              label: 'Auton',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.bxs_joystick),
              label: 'Teleop',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.bx_hourglass),
              label: 'Endgame',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.attach_file),
              label: 'QR Code',
              backgroundColor: Colors.green,
            ),
          ]),
    );
  }
}
