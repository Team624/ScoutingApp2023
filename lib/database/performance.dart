// ignore_for_file: non_constant_identifier_names

import 'package:scouting_app_2023/utils/baseConverter.dart';

class Performance implements Comparable<Performance> {
  //Pre Match
  String initials = "N/A";
  int match = 1;
  int team = 0;

  // Auton
  int position = 0;
  int preload = 0;
  bool move = false;
  int auto_hybrid_L1 = 0;
  int auto_hybrid_L2 = 0;
  int auto_hybrid_L3 = 0;
  int auto_hybrid_L4 = 0;
  int auto_hybrid_L5 = 0;
  int auto_hybrid_L6 = 0;
  int auto_hybrid_L7 = 0;
  int auto_hybrid_L8 = 0;
  int auto_hybrid_L9 = 0;
  int auto_cone_M1 = 0;
  int auto_cube_M2 = 0;
  int auto_cone_M3 = 0;
  int auto_cone_M4 = 0;
  int auto_cube_M5 = 0;
  int auto_cone_M6 = 0;
  int auto_cone_M7 = 0;
  int auto_cube_M8 = 0;
  int auto_cone_M9 = 0;
  int auto_cone_H1 = 0;
  int auto_cube_H2 = 0;
  int auto_cone_H3 = 0;
  int auto_cone_H4 = 0;
  int auto_cube_H5 = 0;
  int auto_cone_H6 = 0;
  int auto_cone_H7 = 0;
  int auto_cube_H8 = 0;
  int auto_cone_H9 = 0;
  int auto_charge = 0;

  // Teleop
  int teleop_hybrid_L1 = 0;
  int teleop_hybrid_L2 = 0;
  int teleop_hybrid_L3 = 0;
  int teleop_hybrid_L4 = 0;
  int teleop_hybrid_L5 = 0;
  int teleop_hybrid_L6 = 0;
  int teleop_hybrid_L7 = 0;
  int teleop_hybrid_L8 = 0;
  int teleop_hybrid_L9 = 0;
  int teleop_cone_M1 = 0;
  int teleop_cube_M2 = 0;
  int teleop_cone_M3 = 0;
  int teleop_cone_M4 = 0;
  int teleop_cube_M5 = 0;
  int teleop_cone_M6 = 0;
  int teleop_cone_M7 = 0;
  int teleop_cube_M8 = 0;
  int teleop_cone_M9 = 0;
  int teleop_cone_H1 = 0;
  int teleop_cube_H2 = 0;
  int teleop_cone_H3 = 0;
  int teleop_cone_H4 = 0;
  int teleop_cube_H5 = 0;
  int teleop_cone_H6 = 0;
  int teleop_cone_H7 = 0;
  int teleop_cube_H8 = 0;
  int teleop_cone_H9 = 0;
  int cycles = 0;
  int fouls_committed = 0;

  // Endgame
  int charging_station_time = 0;
  int charge_endgame = 0;
  bool triple_balance = false;
  bool disconnect = false;

  //constructors

  Performance();

  Performance.next(this.initials, this.match);

  Performance.complete(
      {required this.initials,
      required this.match,
      required this.team,
      required this.position,
      required this.preload,
      required this.move,
      required this.auto_hybrid_L1,
      required this.auto_hybrid_L2,
      required this.auto_hybrid_L3,
      required this.auto_hybrid_L4,
      required this.auto_hybrid_L5,
      required this.auto_hybrid_L6,
      required this.auto_hybrid_L7,
      required this.auto_hybrid_L8,
      required this.auto_hybrid_L9,
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
      required this.teleop_hybrid_L1,
      required this.teleop_hybrid_L2,
      required this.teleop_hybrid_L3,
      required this.teleop_hybrid_L4,
      required this.teleop_hybrid_L5,
      required this.teleop_hybrid_L6,
      required this.teleop_hybrid_L7,
      required this.teleop_hybrid_L8,
      required this.teleop_hybrid_L9,
      required this.teleop_cone_M1,
      required this.teleop_cube_M2,
      required this.teleop_cone_M3,
      required this.teleop_cone_M4,
      required this.teleop_cube_M5,
      required this.teleop_cone_M6,
      required this.teleop_cone_M7,
      required this.teleop_cube_M8,
      required this.teleop_cone_M9,
      required this.teleop_cone_H1,
      required this.teleop_cube_H2,
      required this.teleop_cone_H3,
      required this.teleop_cone_H4,
      required this.teleop_cube_H5,
      required this.teleop_cone_H6,
      required this.teleop_cone_H7,
      required this.teleop_cube_H8,
      required this.teleop_cone_H9,
      required this.cycles,
      required this.fouls_committed,
      required this.charging_station_time,
      required this.charge_endgame,
      required this.triple_balance,
      required this.disconnect});

  Map<String, dynamic> toMap() {
    return {
      "initials": initials,
      "match": match,
      "team": team,
      "position": position,
      "preload": preload,
      "move": toInteger(move),
      "auto_hybrid_L1": auto_hybrid_L1,
      "auto_hybrid_L2": auto_hybrid_L2,
      "auto_hybrid_L3": auto_hybrid_L3,
      "auto_hybrid_L4": auto_hybrid_L4,
      "auto_hybrid_L5": auto_hybrid_L5,
      "auto_hybrid_L6": auto_hybrid_L6,
      "auto_hybrid_L7": auto_hybrid_L7,
      "auto_hybrid_L8": auto_hybrid_L8,
      "auto_hybrid_L9": auto_hybrid_L9,
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
      "teleop_hybrid_L1": teleop_hybrid_L1,
      "teleop_hybrid_L2": teleop_hybrid_L2,
      "teleop_hybrid_L3": teleop_hybrid_L3,
      "teleop_hybrid_L4": teleop_hybrid_L4,
      "teleop_hybrid_L5": teleop_hybrid_L5,
      "teleop_hybrid_L6": teleop_hybrid_L6,
      "teleop_hybrid_L7": teleop_hybrid_L7,
      "teleop_hybrid_L8": teleop_hybrid_L8,
      "teleop_hybrid_L9": teleop_hybrid_L9,
      "teleop_cone_M1": teleop_cone_M1,
      "teleop_cube_M2": teleop_cube_M2,
      "teleop_cone_M3": teleop_cone_M3,
      "teleop_cone_M4": teleop_cone_M4,
      "teleop_cube_M5": teleop_cube_M5,
      "teleop_cone_M6": teleop_cone_M6,
      "teleop_cone_M7": teleop_cone_M7,
      "teleop_cube_M8": teleop_cube_M8,
      "teleop_cone_M9": teleop_cone_M9,
      "teleop_cone_H1": teleop_cone_H1,
      "teleop_cube_H2": teleop_cube_H2,
      "teleop_cone_H3": teleop_cone_H3,
      "teleop_cone_H4": teleop_cone_H4,
      "teleop_cube_H5": teleop_cube_H5,
      "teleop_cone_H6": teleop_cone_H6,
      "teleop_cone_H7": teleop_cone_H7,
      "teleop_cube_H8": teleop_cube_H8,
      "teleop_cone_H9": teleop_cone_H9,
      "cycles": cycles,
      "fouls_committed": fouls_committed,
      "charging_station_time": charging_station_time,
      "charge_endgame": charge_endgame,
      "triple_balance": toInteger(triple_balance),
      "disconnect": toInteger(disconnect)
    };
  }

  @override
  String toString() {
    List<int> first = [
      auto_hybrid_L1,
      auto_hybrid_L2,
      auto_hybrid_L3,
      auto_hybrid_L4,
      auto_hybrid_L5,
      auto_hybrid_L6,
      auto_hybrid_L7,
      auto_hybrid_L8,
      auto_hybrid_L9
    ];
    List<int> second = [
      auto_cone_M1,
      auto_cube_M2,
      auto_cone_M3,
      auto_cone_M4,
      auto_cube_M5,
      auto_cone_M6,
      auto_cone_M7,
      auto_cube_M8,
      auto_cone_M9,
      auto_cone_H1,
      auto_cube_H2,
      auto_cone_H3,
      auto_cone_H4,
      auto_cube_H5,
      auto_cone_H6,
      auto_cone_H7,
      auto_cube_H8,
      auto_cone_H9,
      teleop_hybrid_L1,
      teleop_hybrid_L2,
      teleop_hybrid_L3,
      teleop_hybrid_L4,
      teleop_hybrid_L5,
      teleop_hybrid_L6,
      teleop_hybrid_L7,
      teleop_hybrid_L8,
      teleop_hybrid_L9
    ];
    List<int> third = [
      teleop_cone_M1,
      teleop_cube_M2,
      teleop_cone_M3,
      teleop_cone_M4,
      teleop_cube_M5,
      teleop_cone_M6,
      teleop_cone_M7,
      teleop_cube_M8,
      teleop_cone_M9,
      teleop_cone_H1,
      teleop_cube_H2,
      teleop_cone_H3,
      teleop_cone_H4,
      teleop_cube_H5,
      teleop_cone_H6,
      teleop_cone_H7,
      teleop_cube_H8,
      teleop_cone_H9
    ];
    List output = [
      initials,
      match,
      team,
      position,
      preload,
      toInteger(move),
      auto_charge,
      convertBaseAto32(first, 5),
      convertBaseAto32(second, 3),
      convertBaseAto32(third, 2),
      cycles,
      fouls_committed,
      charging_station_time,
      charge_endgame,
      toInteger(triple_balance),
      toInteger(disconnect)
    ];
    String outputStr = "";
    for (dynamic item in output) {
      outputStr += "${item.toString()},";
    }
    return outputStr.substring(0, outputStr.length - 1);
  }

  int toInteger(bool boolean) {
    if (boolean) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  int compareTo(Performance other) {
    if (other.match > match) {
      return -1;
    } else if (other.match < match) {
      return 1;
    }
    return 0;
  }

  int shortenString(String string, List options) {
    return options.indexOf(string);
  }
}
