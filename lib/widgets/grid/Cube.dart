import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cube extends StatefulWidget {
  const Cube({super.key});

  @override
  State<Cube> createState() => _CubeState();
}

class _CubeState extends State<Cube> {
  bool activated = false;

  Widget activated_cube = SvgPicture.asset('assets/cube.svg',
      semanticsLabel: 'Activated cube Node', width: 90, height: 90);
  Widget deactivated_cube = SvgPicture.asset('assets/cubeEmpty.svg',
      semanticsLabel: 'Deactivated cube Node', width: 85, height: 90);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: activated ? activated_cube : deactivated_cube,
        onTap: () {
          setState(() {
            activated = !activated;
          });
        });
  }
}
