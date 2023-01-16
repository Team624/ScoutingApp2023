import 'package:flutter/material.dart';
import 'package:scouting_app_2023/screens/auton.dart';
import 'package:scouting_app_2023/screens/BottomNavBar.dart';
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
        title: "Scouting22",
        home: SafeArea(
          child: BottomNavBar(
            currentIndex: 0,
            data: Performance(),
          ),
        ));
  }
}
