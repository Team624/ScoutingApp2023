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

  Widget activated_cube = SvgPicture.asset('assets/cube.svg',
      semanticsLabel: 'Activated cube Node', width: 90, height: 90);
  Widget activated_cone = SvgPicture.asset('assets/cone.svg',
      semanticsLabel: 'Activated cone Node', width: 90, height: 113);
  Widget failed_cube = SvgPicture.asset('assets/failedCube.svg',
      semanticsLabel: 'Failed cube Node', width: 90, height: 90);
  Widget failed_cone = SvgPicture.asset('assets/failedCone.svg',
      semanticsLabel: 'Failed cone Node', width: 90, height: 113);
  Widget supercharged = SvgPicture.asset('assets/supercharged.svg',
      semanticsLabel: 'Supercharged Bottom Node', width: 90, height: 113);
  Widget nothing = SvgPicture.asset('assets/nothing.svg',
      semanticsLabel: 'Nothing', width: 90, height: 90);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: gamepiece == 0
            ? nothing
            : gamepiece == 1
                ? activated_cube
                : gamepiece == 2
                    ? activated_cone
                    : gamepiece == 3
                        ? widget.hideFailed
                            ? supercharged
                            : failed_cube
                        : failed_cone,
        onTap: () {
          setState(() {
            if (widget.hideFailed) {
              gamepiece = (gamepiece + 1) % 4;
            } else {
              gamepiece = (gamepiece + 1) % 5;
            }
            widget.onChanged(gamepiece);
          });
        });
  }
}
