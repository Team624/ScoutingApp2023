import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNode extends StatefulWidget {
  const BottomNode({super.key});

  @override
  State<BottomNode> createState() => _BottomNodeState();
}

class _BottomNodeState extends State<BottomNode> {
  int gamepiece = 0;

  Widget activated_cube = SvgPicture.asset('assets/cube.svg',
      semanticsLabel: 'Activated cube Node', width: 90, height: 90);
  Widget activated_cone = SvgPicture.asset('assets/cone.svg',
      semanticsLabel: 'Activated cone Node', width: 90, height: 113);
  Widget nothing = SvgPicture.asset('assets/nothing.svg',
      semanticsLabel: 'Nothing', width: 90, height: 90);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: gamepiece == 0
            ? nothing
            : gamepiece == 1
                ? activated_cone
                : activated_cube,
        onTap: () {
          setState(() {
            gamepiece = (gamepiece + 1) % 3;
            print(gamepiece);
          });
        });
  }
}
