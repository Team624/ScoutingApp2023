import 'dart:ffi';

class Performance implements Comparable<Performance> {
  final int match;
  final int team;

  // Auton
  static String position = 'A';
  static String preload = 'N';
  static bool move = false;
  String exit_path = 'N';
  int auto_cone_L1 = 1;
  int auto_hybrid_L2 = 1;
  int auto_cone_L3 = 1;
  int auto_cone_L4 = 1;
  int auto_hybrid_l5 = 1;
  int auto_cone_L6 = 1;
  int auto_cone_L7 = 1;
  int auto_hybrid_L8 = 1;
  int auto_cone_L9 = 1;
  int auto_cone_M1 = 1;
  int auto_cube_M2 = 1;
  int auto_cone_M3 = 1;
  int auto_cone_M4 = 1;
  int auto_cube_M5 = 1;
  int auto_cone_M6 = 1;
  int auto_cone_M7 = 1;
  int auto_cube_M8 = 1;
  int auto_cone_M9 = 1;
  int auto_cone_H1 = 1;
  int auto_cube_H2 = 1;
  int auto_cone_H3 = 1;
  int auto_cone_H4 = 1;
  int auto_cube_H5 = 1;
  int auto_cone_H6 = 1;
  int auto_cone_H7 = 1;
  int auto_cube_H8 = 1;
  int auto_cone_H9 = 1;
  String auto_charge = "Not Attempted";

  // Teleop
  int teleop_cube_L_made = 0;
  int teleop_cube_M_made = 0;
  int teleop_cube_H_made = 0;
  int teleop_cone_L_made = 0;
  int teleop_cone_M_made = 0;
  int teleop_cone_H_made = 0;
  int teleop_cube_L_missed = 0;
  int teleop_cube_M_missed = 0;
  int teleop_cube_H_missed = 0;
  int teleop_cone_L_missed = 0;
  int teleop_cone_M_missed = 0;
  int teleop_cone_H_missed = 0;
  int fouls_comitted = 0;

  // Endgame
  double charging_station_time = 0;
  String charging_station_endgame = "Not Attempted";
  bool disconnect = false;

  Performance({
    required this.match,
    required this.team,
  });

  Map<String, dynamic> toMap() {
    // FYI this is written with GH copilot so it might be buggy/have errors

    // return {"match": match, "team": team};

    // retern a map in this format {"variable_name":variable_value, "variable_name":variable_value, ...}
    return {
      "match": match,
      "team": team,
      "position": position,
      "preload": preload,
      "move": move,
      "exit_path": exit_path,
      "auto_cone_L1": auto_cone_L1,
      "auto_hybrid_L2": auto_hybrid_L2,
      "auto_cone_L3": auto_cone_L3,
      "auto_cone_L4": auto_cone_L4,
      "auto_hybrid_l5": auto_hybrid_l5,
      "auto_cone_L6": auto_cone_L6,
      "auto_cone_L7": auto_cone_L7,
      "auto_hybrid_L8": auto_hybrid_L8,
      "auto_cone_L9": auto_cone_L9,
      "auto_cone_M1": auto_cone_M1,
      "auto_cube_M2": auto_cube_M2,
      "auto_cone_M3": auto_cone_M3,
      "auto_cone_M4": auto_cone_M4,
      "auto_cube_M5": auto_cube_M5,
      "auto_cone_M6": auto_cone_M6,
      "auto_cone_M7": auto_cone_M7,
      "auto_cube_M8": auto_cube_M8,
      "auto_cone_M9": auto_cone_M9,
      "auto_cone_H1": auto_cone_H1,
      "auto_cube_H2": auto_cube_H2,
      "auto_cone_H3": auto_cone_H3,
      "auto_cone_H4": auto_cone_H4,
      "auto_cube_H5": auto_cube_H5,
      "auto_cone_H6": auto_cone_H6,
      "auto_cone_H7": auto_cone_H7,
      "auto_cube_H8": auto_cube_H8,
      "auto_cone_H9": auto_cone_H9,
      "auto_charge": auto_charge,
      "teleop_cube_L_made": teleop_cube_L_made,
      "teleop_cube_M_made": teleop_cube_M_made,
      "teleop_cube_H_made": teleop_cube_H_made,
      "teleop_cone_L_made": teleop_cone_L_made,
      "teleop_cone_M_made": teleop_cone_M_made,
      "teleop_cone_H_made": teleop_cone_H_made,
      "teleop_cube_L_missed": teleop_cube_L_missed,
      "teleop_cube_M_missed": teleop_cube_M_missed,
      "teleop_cube_H_missed": teleop_cube_H_missed,
      "teleop_cone_L_missed": teleop_cone_L_missed,
      "teleop_cone_M_missed": teleop_cone_M_missed,
      "teleop_cone_H_missed": teleop_cone_H_missed,
      "fouls_comitted": fouls_comitted,
      "charging_station_time": charging_station_time,
      "charging_station_endgame": charging_station_endgame,
      "disconnect": disconnect,
    };
  }

  @override
  String toString() {
    // This is also written with copilot

    // TODO: Make this more efficient and compressed

    // return all the variables in the format Performance{variable_name:variable_value, variable_name:variable_value, ...}
    return 'Performance{match:$match, team:$team, position:$position, preload:$preload, move:$move, exit_path:$exit_path, auto_cone_L1:$auto_cone_L1, auto_hybrid_L2:$auto_hybrid_L2, auto_cone_L3:$auto_cone_L3, auto_cone_L4:$auto_cone_L4, auto_hybrid_l5:$auto_hybrid_l5, auto_cone_L6:$auto_cone_L6, auto_cone_L7:$auto_cone_L7, auto_hybrid_L8:$auto_hybrid_L8, auto_cone_L9:$auto_cone_L9, auto_cone_M1:$auto_cone_M1, auto_cube_M2:$auto_cube_M2, auto_cone_M3:$auto_cone_M3, auto_cone_M4:$auto_cone_M4, auto_cube_M5:$auto_cube_M5, auto_cone_M6:$auto_cone_M6, auto_cone_M7:$auto_cone_M7, auto_cube_M8:$auto_cube_M8, auto_cone_M9:$auto_cone_M9, auto_cone_H1:$auto_cone_H1, auto_cube_H2:$auto_cube_H2, auto_cone_H3:$auto_cone_H3, auto_cone_H4:$auto_cone_H4, auto_cube_H5:$auto_cube_H5, auto_cone_H6:$auto_cone_H6, auto_cone_H7:$auto_cone_H7, auto_cube_H8:$auto_cube_H8, auto_cone_H9:$auto_cone_H9, auto_charge:$auto_charge, teleop_cube_L_made:$teleop_cube_L_made, teleop_cube_M_made:$teleop_cube_M_made, teleop_cube_H_made:$teleop_cube_H_made, teleop_cone_L_made:$teleop_cone_L_made, teleop_cone_M_made:$teleop_cone_M_made, teleop_cone_H_made:$teleop_cone_H_made, teleop_cube_L_missed:$teleop_cube_L_missed, teleop_cube_M_missed:$teleop_cube_M_missed, teleop_cube_H_missed:$teleop_cube_H_missed, teleop_cone_L_missed:$teleop_cone_L_missed, teleop_cone_M_missed:$teleop_cone_M_missed, teleop_cone_H_missed:$teleop_cone_H_missed, fouls_comitted:$fouls_comitted, charging_station_time:$charging_station_time, charging_station_endgame:$charging_station_endgame, disconnect:$disconnect}';
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
