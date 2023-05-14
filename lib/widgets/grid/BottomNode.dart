import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNode extends StatefulWidget {
  final onChanged;
  var hideFailed = false;
  BottomNode({super.key, required this.onChanged, this.hideFailed = false});

  @override
  State<BottomNode> createState() => _BottomNodeState();
}

class _BottomNodeState extends State<BottomNode> {
  int gamepiece = 0;

  @override
  Widget build(BuildContext context) {
    Widget activated_cube = SvgPicture.asset(
      'assets/cube.svg',
      semanticsLabel: 'Activated cube Node',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.15,
    );
    Widget activated_cone = SvgPicture.asset(
      'assets/cone.svg',
      semanticsLabel: 'Activated cone Node',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.15,
    );
    Widget cube_2 = SvgPicture.asset(
      'assets/cube2.svg',
      semanticsLabel: 'Supercharged Cube Node',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget cone_2 = SvgPicture.asset(
      'assets/cone2.svg',
      semanticsLabel: 'Supercharged Cone Node',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget cone_cube = SvgPicture.asset(
      'assets/multi.svg',
      semanticsLabel: 'Cube and Cone',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget nothing = SvgPicture.asset(
      'assets/nothing.svg',
      semanticsLabel: 'Nothing',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.15,
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.188,
      child: GestureDetector(
          child: gamepiece == 0
              ? nothing
              : gamepiece == 1
                  ? activated_cube
                  : gamepiece == 2
                      ? activated_cone
                      : gamepiece == 3
                          ? cube_2
                          : gamepiece == 4
                              ? cone_2
                              : gamepiece == 5
                                  ? cone_cube
                                  : nothing,
          onTap: () {
            setState(() {
              gamepiece = (gamepiece + 1) % 6;
              widget.onChanged(gamepiece);
            });
          }),
    );
  }
}
