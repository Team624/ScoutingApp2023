import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:scouting_app_2023/screens/teleop.dart';
import 'package:scouting_app_2023/database/performance.dart';
import 'database/database.dart';
import 'custom_icons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '624 Scouting App 2023',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '624 Scouting App 2023'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    // generate a list of icons for a FRC scouting app
    Icons.home,
    Icons.settings,
    Icons.info,
  ];

  final pages = <Widget>[
    const Center(child: Text('Game select')),
    const Center(child: Text('Auton')),
    TeleOpPage(),
    const Center(child: Text('Endgame')),
    const Center(child: Text('Review')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          currentIndex: _bottomNavIndex,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.bxs_grid_alt),
              label: 'Game Select',
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
              label: 'Review',
              backgroundColor: Colors.green,
            ),
          ]),

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[_bottomNavIndex],
      // render a body based on the navbar index
    );
  }
}
