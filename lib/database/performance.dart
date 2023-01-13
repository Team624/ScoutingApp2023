import 'dart:ffi';

class Performance implements Comparable<Performance> {
  final int match;
  final int team;
  final String nickname;

  // TODO: make these variables not final
  // TODO: check if datatypes are correct;

  // Auton
  final Char auton;
  final bool preload;
  final bool move;
  final Char exit_path;
  final bool auto_cone_L1;
  final bool auto_hybrid_l2;
  final bool auto_cone_L3;
  final bool auto_cone_L4;
  final bool auto_hybrid_l5;
  final bool auto_cone_L6;
  final bool auto_cone_L7;
  final bool auto_hybrid_L8;
  final bool auto_cone_L9;
  final bool auto_cone_M1;
  final bool auto_cube_M2;
  final bool auto_cone_M3;
  final bool auto_cone_M4;
  final bool auto_cube_M5;
  final bool auto_cone_M6;
  final bool auto_cone_M7;
  final bool auto_cube_M8;
  final bool auto_cone_M9;
  final bool auto_cone_H1;
  final bool auto_cube_H2;
  final bool auto_cone_H3;
  final bool auto_cone_H4;
  final bool auto_cube_H5;
  final bool auto_cone_H6;
  final bool auto_cone_H7;
  final bool auto_cube_H8;
  final bool auto_cone_H9;
  final bool auto_charge;

  // Teleop
  final int teleop_cube_L_made;
  final int teleop_cube_M_made;
  final int teleop_cube_H_made;
  final int teleop_cone_L_made;
  final int teleop_cone_M_made;
  final int teleop_cone_H_made;
  final int teleop_cube_L_missed;
  final int teleop_cube_M_missed;
  final int teleop_cube_H_missed;
  final int teleop_cone_L_missed;
  final int teleop_cone_M_missed;
  final int teleop_cone_H_missed;
  final int fouls_comitted;

  // Endgame
  final int charging_station_time;
  final bool charging_station_endgame;
  final bool disconnect;

  // TODO: add variables
  const Performance({
    required this.match,
    required this.team,
    required this.nickname,
    required this.auton,
    required this.preload,
    required this.move,
    required this.exit_path,
    required this.auto_cone_L1,
    required this.auto_hybrid_l2,
    required this.auto_cone_L3,
    required this.auto_cone_L4,
    required this.auto_hybrid_l5,
    required this.auto_cone_L6,
    required this.auto_cone_L7,
    required this.auto_hybrid_L8,
    required this.auto_cone_L9,
    required this.auto_cone_M1,
    required this.auto_cube_M2,
    required this.auto_cone_M3,
    required this.auto_cone_M4,
    required this.auto_cube_M5,
    required this.auto_cone_M6,
    required this.auto_cone_M7,
    required this.auto_cube_M8,
    required this.auto_cone_M9,
    required this.auto_cone_H1,
    required this.auto_cube_H2,
    required this.auto_cone_H3,
    required this.auto_cone_H4,
    required this.auto_cube_H5,
    required this.auto_cone_H6,
    required this.auto_cone_H7,
    required this.auto_cube_H8,
    required this.auto_cone_H9,
    required this.auto_charge,
    required this.teleop_cube_L_made,
    required this.teleop_cube_M_made,
    required this.teleop_cube_H_made,
    required this.teleop_cone_L_made,
    required this.teleop_cone_M_made,
    required this.teleop_cone_H_made,
    required this.teleop_cube_L_missed,
    required this.teleop_cube_M_missed,
    required this.teleop_cube_H_missed,
    required this.teleop_cone_L_missed,
    required this.teleop_cone_M_missed,
    required this.teleop_cone_H_missed,
    required this.fouls_comitted,
    required this.charging_station_time,
    required this.charging_station_endgame,
    required this.disconnect,
  });

  Map<String, dynamic> toMap() {
    return {"match": match, "team": team, "nickname": nickname};
  }

  @override
  String toString() {
    return 'Performance{match:$match, team:$team, nickname:$nickname}';
  }

  @override
  int compareTo(Performance other) {
    if (other.match > match) {
      return -1;
    } else if (other.match < match) {
      return 1;
    }
    return 0; //same match
  }
}
