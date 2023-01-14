import 'package:flutter/material.dart';
import 'package:scouting_app_2023/widgets/grid/Cone.dart';
import 'package:scouting_app_2023/widgets/grid/Cube.dart';

import '../widgets/grid/BottomNode.dart';

class AutonPage extends StatefulWidget {
  const AutonPage({super.key});

  @override
  State<AutonPage> createState() => _AutonPageState();
}

class _AutonPageState extends State<AutonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Cone(),
              Cube(),
              Cone(),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Cone(),
              Cube(),
              Cone(),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Cone(),
              Cube(),
              Cone(),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Cone(),
              Cube(),
              Cone(),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Cone(),
              Cube(),
              Cone(),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Cone(),
              Cube(),
              Cone(),
            ]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(
              children: const [BottomNode(), BottomNode(), BottomNode()],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: const [BottomNode(), BottomNode(), BottomNode()],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: const [BottomNode(), BottomNode(), BottomNode()],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ]),
          Row()
        ],
      ),
    );
  }
}
