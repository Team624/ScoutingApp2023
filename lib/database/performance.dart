import 'dart:ffi';

class Performance implements Comparable<Performance> {
  //Pre Match
  String initials = "N/A";
  int match = 0;
  int team = 0;

  // Auton
  String position = "None";
  String preload = "None";
  bool move = true;
  String exit_path = "None";
  String auto_cone_L1 = "N/A";
  String auto_hybrid_L2 = "N/A";
  String auto_cone_L3 = "N/A";
  String auto_cone_L4 = "N/A";
  String auto_hybrid_l5 = "N/A";
  String auto_cone_L6 = "N/A";
  String auto_cone_L7 = "N/A";
  String auto_hybrid_L8 = "N/A";
  String auto_cone_L9 = "N/A";
  String auto_cone_M1 = "N/A";
  String auto_cube_M2 = "N/A";
  String auto_cone_M3 = "N/A";
  String auto_cone_M4 = "N/A";
  String auto_cube_M5 = "N/A";
  String auto_cone_M6 = "N/A";
  String auto_cone_M7 = "N/A";
  String auto_cube_M8 = "N/A";
  String auto_cone_M9 = "N/A";
  String auto_cone_H1 = "N/A";
  String auto_cube_H2 = "N/A";
  String auto_cone_H3 = "N/A";
  String auto_cone_H4 = "N/A";
  String auto_cube_H5 = "N/A";
  String auto_cone_H6 = "N/A";
  String auto_cone_H7 = "N/A";
  String auto_cube_H8 = "N/A";
  String auto_cone_H9 = "N/A";
  String auto_charge = "N/A";

  // Teleop
  bool teleop_cone_L1 = false;
  String teleop_hybrid_L2 = "None";
  bool teleop_cone_L3 = false;
  bool teleop_cone_L4 = false;
  String teleop_hybrid_l5 = "None";
  bool teleop_cone_L6 = false;
  bool teleop_cone_L7 = false;
  String teleop_hybrid_L8 = "None";
  bool teleop_cone_L9 = false;
  bool teleop_cone_M1 = false;
  bool teleop_cube_M2 = false;
  bool teleop_cone_M3 = false;
  bool teleop_cone_M4 = false;
  bool teleop_cube_M5 = false;
  bool teleop_cone_M6 = false;
  bool teleop_cone_M7 = false;
  bool teleop_cube_M8 = false;
  bool teleop_cone_M9 = false;
  bool teleop_cone_H1 = false;
  bool teleop_cube_H2 = false;
  bool teleop_cone_H3 = false;
  bool teleop_cone_H4 = false;
  bool teleop_cube_H5 = false;
  bool teleop_cone_H6 = false;
  bool teleop_cone_H7 = false;
  bool teleop_cube_H8 = false;
  bool teleop_cone_H9 = false;
  int cycles = 0;
  int fouls_committed = 0;

  // Endgame
  int charging_station_time = 0;
  String charging_station_endgame = "None";
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
      required this.exit_path,
      required this.auto_cone_L1,
      required this.auto_hybrid_L2,
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
      required this.teleop_cone_L1,
      required this.teleop_hybrid_L2,
      required this.teleop_cone_L3,
      required this.teleop_cone_L4,
      required this.teleop_hybrid_l5,
      required this.teleop_cone_L6,
      required this.teleop_cone_L7,
      required this.teleop_hybrid_L8,
      required this.teleop_cone_L9,
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
      required this.charging_station_endgame,
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
      "teleop_cone_L1": toInteger(teleop_cone_L1),
      "teleop_hybrid_L2": teleop_hybrid_L2,
      "teleop_cone_L3": toInteger(teleop_cone_L3),
      "teleop_cone_L4": toInteger(teleop_cone_L4),
      "teleop_hybrid_l5": teleop_hybrid_l5,
      "teleop_cone_L6": toInteger(teleop_cone_L6),
      "teleop_cone_L7": toInteger(teleop_cone_L7),
      "teleop_hybrid_L8": teleop_hybrid_L8,
      "teleop_cone_L9": toInteger(teleop_cone_L9),
      "teleop_cone_M1": toInteger(teleop_cone_M1),
      "teleop_cube_M2": toInteger(teleop_cube_M2),
      "teleop_cone_M3": toInteger(teleop_cone_M3),
      "teleop_cone_M4": toInteger(teleop_cone_M4),
      "teleop_cube_M5": toInteger(teleop_cube_M5),
      "teleop_cone_M6": toInteger(teleop_cone_M6),
      "teleop_cone_M7": toInteger(teleop_cone_M7),
      "teleop_cube_M8": toInteger(teleop_cube_M8),
      "teleop_cone_M9": toInteger(teleop_cone_M9),
      "teleop_cone_H1": toInteger(teleop_cone_H1),
      "teleop_cube_H2": toInteger(teleop_cube_H2),
      "teleop_cone_H3": toInteger(teleop_cone_H3),
      "teleop_cone_H4": toInteger(teleop_cone_H4),
      "teleop_cube_H5": toInteger(teleop_cube_H5),
      "teleop_cone_H6": toInteger(teleop_cone_H6),
      "teleop_cone_H7": toInteger(teleop_cone_H7),
      "teleop_cube_H8": toInteger(teleop_cube_H8),
      "teleop_cone_H9": toInteger(teleop_cone_H9),
      "cycles": cycles,
      "fouls_committed": fouls_committed,
      "charging_station_time": charging_station_time,
      "charging_station_endgame": charging_station_endgame,
      "triple_balance": toInteger(triple_balance),
      "disconnect": toInteger(disconnect)
    };
  }

  @override
  String toString() {
    return fouls_committed.toString();
    //change this. it is just for testing purposes
  }

  //store booleans as integers
  int toInteger(bool boolean) {
    if (boolean) {
      return 1;
    } else {
      return 0;
    }
  }

  //display database in order(sorted by math number)
  @override
  int compareTo(Performance other) {
    if (other.match > match) {
      return -1;
    } else if (other.match < match) {
      return 1;
    }
    return 0;
  }

  //shorten the qr code contents
  //Will be handled with the desktop app
  String toBinary(List<int> list) {
    String decimal = "";
    for (int string in list) {
      decimal += string.toString();
    }
    return int.parse(decimal).toRadixString(2);
  }
}
