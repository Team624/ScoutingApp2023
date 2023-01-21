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

  Widget activated_cube = SvgPicture.asset('assets/cube.svg',
      semanticsLabel: 'Activated cube Node', width: 90, height: 90);
  Widget deactivated_cube = SvgPicture.asset('assets/cubeEmpty.svg',
      semanticsLabel: 'Deactivated cube Node', width: 85, height: 90);
  Widget failed_cube = SvgPicture.asset('assets/failedCube.svg',
      semanticsLabel: 'Failed cube Node', width: 90, height: 90);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: state == 0
            ? deactivated_cube
            : state == 1
                ? activated_cube
                : widget.hideFailed
                    ? deactivated_cube
                    : failed_cube,
        onTap: () {
          setState(() {
            if (widget.hideFailed) {
              state = (state + 1) % 2;
            } else {
              state = (state + 1) % 3;
            }
            widget.onChanged(state);
          });
        });
  }
}
