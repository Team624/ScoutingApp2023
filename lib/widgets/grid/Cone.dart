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

  @override
  Widget build(BuildContext context) {
    Widget activated_cone = SvgPicture.asset(
      'assets/cone.svg',
      semanticsLabel: 'Activated Cone Node',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget deactivated_cone = SvgPicture.asset(
      'assets/coneEmpty.svg',
      semanticsLabel: 'Deactivated Cone Node',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget supercharged = SvgPicture.asset(
      'assets/cone2.svg',
      semanticsLabel: 'Supercharged Cone',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.188,
    );
    Widget failed_cone = SvgPicture.asset(
      'assets/failedCone.svg',
      semanticsLabel: 'Failed cone Node',
      width: MediaQuery.of(context).size.width * 0.083,
      height: MediaQuery.of(context).size.height * 0.188,
    );
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
