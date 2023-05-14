import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cube extends StatefulWidget {
  final onChanged;
  final hideFailed;
  const Cube({super.key, required this.onChanged, this.hideFailed = false});

  @override
  State<Cube> createState() => _CubeState();
}

class _CubeState extends State<Cube> {
  int state = 0;

  @override
  Widget build(BuildContext context) {
    Widget activated_cube = SvgPicture.asset(
      'assets/cube.svg',
      semanticsLabel: 'Activated cube Node',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.15,
    );
    Widget deactivated_cube = SvgPicture.asset(
      'assets/cubeEmpty.svg',
      semanticsLabel: 'Deactivated cube Node',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.15,
    );
    Widget supercharged = SvgPicture.asset(
      'assets/cube2.svg',
      semanticsLabel: 'Supercharged Bottom Node',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.15,
    );
    Widget failed_cube = SvgPicture.asset(
      'assets/failedCube.svg',
      semanticsLabel: 'Failed cube Node',
      width: MediaQuery.of(context).size.width * 0.088,
      height: MediaQuery.of(context).size.height * 0.15,
    );

    return GestureDetector(
      child: state == 0
          ? deactivated_cube
          : state == 1
              ? activated_cube
              : state == 2 && widget.hideFailed
                  ? supercharged
                  : state == 2 && !widget.hideFailed
                      ? failed_cube
                      : deactivated_cube,
      onTap: () {
        setState(() {
          state = (state + 1) % 3;
          widget.onChanged(state);
        });
      },
    );
  }
}
