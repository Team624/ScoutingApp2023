import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class Cone extends StatefulWidget {
  const Cone({super.key});

  @override
  State<Cone> createState() => _ConeState();
}

class _ConeState extends State<Cone> {
  bool activated = false;

  Widget activated_cone = SvgPicture.asset('assets/cone.svg',
      semanticsLabel: 'Activated Cone Node', width: 45, height: 105);
  Widget deactivated_cone = SvgPicture.asset('assets/coneEmpty.svg',
      semanticsLabel: 'Deactivated Cone Node', width: 45, height: 105);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: activated ? activated_cone : deactivated_cone,
        onTap: () {
          setState(() {
            activated = !activated;
          });
        });
  }
}
