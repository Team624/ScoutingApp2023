import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scouting_app_2023/screens/BottomNavBar.dart';
import 'package:scouting_app_2023/database/performance.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Scouting23",
        home: SafeArea(
          child: BottomNavBar(
            currentIndex: 0,
            data: Performance(),
          ),
        ));
  }
}
