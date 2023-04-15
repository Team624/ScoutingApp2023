import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Cone extends StatefulWidget {
  final onChanged;
  final hideFailed;
  const Cone({super.key, required this.onChanged, this.hideFailed = false});

  @override
  State<Cone> createState() => _ConeState();
}

class _ConeState extends State<Cone> {
  int state = 0;

  Widget activated_cone = SvgPicture.asset('assets/cone.svg',
      semanticsLabel: 'Activated Cone Node', width: 90, height: 113);
  Widget deactivated_cone = SvgPicture.asset('assets/coneEmpty.svg',
      semanticsLabel: 'Deactivated Cone Node', width: 90, height: 113);
  Widget supercharged = SvgPicture.asset('assets/cone2.svg',
      semanticsLabel: 'Supercharged Cone', width: 90, height: 113);
  Widget failed_cone = SvgPicture.asset('assets/failedCone.svg',
      semanticsLabel: 'Failed cone Node', width: 90, height: 113);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: state == 0
            ? deactivated_cone
            : state == 1
                ? activated_cone
                : state == 2 && widget.hideFailed
                    ? supercharged
                    : state == 2 && !widget.hideFailed
                        ? failed_cone
                        : deactivated_cone,
        onTap: () {
          setState(() {
            state = (state + 1) % 3;
            widget.onChanged(state);
          });
        });
  }
}
