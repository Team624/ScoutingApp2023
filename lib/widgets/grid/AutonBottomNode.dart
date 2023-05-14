import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AutonBottomNode extends StatefulWidget {
  final onChanged;
  var hideFailed = false;
  AutonBottomNode(
      {super.key, required this.onChanged, this.hideFailed = false});

  @override
  State<AutonBottomNode> createState() => _AutonBottomNodeState();
}

class _AutonBottomNodeState extends State<AutonBottomNode> {
  int gamepiece = 0;

  @override
  Widget build(BuildContext context) {
    Widget activated_cube = SvgPicture.asset(
      'assets/cube.svg',
      semanticsLabel: 'Activated cube Node',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.15,
    );
    Widget activated_cone = SvgPicture.asset(
      'assets/cone.svg',
      semanticsLabel: 'Activated cone Node',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget failed_cube = SvgPicture.asset(
      'assets/failedCube.svg',
      semanticsLabel: 'Failed cube Node',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget failed_cone = SvgPicture.asset(
      'assets/failedCone.svg',
      semanticsLabel: 'Failed cone Node',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget nothing = SvgPicture.asset(
      'assets/nothing.svg',
      semanticsLabel: 'Nothing',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.15,
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.188,
      child: GestureDetector(
          child: gamepiece == 0
              ? nothing
              : gamepiece == 1
                  ? activated_cube
                  : gamepiece == 2
                      ? activated_cone
                      : widget.hideFailed
                          ? nothing
                          : gamepiece == 3
                              ? failed_cube
                              : failed_cone,
          onTap: () {
            setState(() {
              if (widget.hideFailed) {
                gamepiece = (gamepiece + 1) % 3;
              } else {
                gamepiece = (gamepiece + 1) % 5;
              }
              widget.onChanged(gamepiece);
            });
          }),
    );
  }
}
