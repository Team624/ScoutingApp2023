import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'performance.dart';

const databaseName = "database.db";

Future<Database> createdDB() async {
  return openDatabase(
    join(await getDatabasesPath(), databaseName),
    onCreate: (db, version) {
      return db.execute(getCreateStatement());
    },
    version: 1,
  );
}

final database = createdDB();

String getCreateStatement() {
  Map<String, List<String>> myData = {
    'TEXT': [
      'initials',
      'position',
      'preload',
      'exit_path',
      'auto_cone_L1',
      'auto_hybrid_L2',
      'auto_cone_L3',
      'auto_cone_L4',
      'auto_hybrid_l5',
      'auto_cone_L6',
      'auto_cone_L7',
      'auto_hybrid_L8',
      'auto_cone_L9',
      'auto_cone_M1',
      'auto_cube_M2',
      'auto_cone_M3',
      'auto_cone_M4',
      'auto_cube_M5',
      'auto_cone_M6',
      'auto_cone_M7',
      'auto_cube_M8',
      'auto_cone_M9',
      'auto_cone_H1',
      'auto_cube_H2',
      'auto_cone_H3',
      'auto_cone_H4',
      'auto_cube_H5',
      'auto_cone_H6',
      'auto_cone_H7',
      'auto_cube_H8',
      'auto_cone_H9',
      'auto_charge',
      'teleop_hybrid_L2',
      'teleop_hybrid_l5',
      'teleop_hybrid_L8',
      'charging_station_endgame'
    ],
    'INTEGER': [
      'match',
      'team',
      'move',
      'teleop_cone_L1',
      'teleop_cone_L3',
      'teleop_cone_L4',
      'teleop_cone_L6',
      'teleop_cone_L7',
      'teleop_cone_L9',
      'teleop_cone_M1',
      'teleop_cube_M2',
      'teleop_cone_M3',
      'teleop_cone_M4',
      'teleop_cube_M5',
      'teleop_cone_M6',
      'teleop_cone_M7',
      'teleop_cube_M8',
      'teleop_cone_M9',
      'teleop_cone_H1',
      'teleop_cube_H2',
      'teleop_cone_H3',
      'teleop_cone_H4',
      'teleop_cube_H5',
      'teleop_cone_H6',
      'teleop_cone_H7',
      'teleop_cube_H8',
      'teleop_cone_H9',
      'cycles',
      'fouls_committed',
      'charging_station_time',
      'triple_balance',
      'disconnect'
    ]
  };
  String output = "CREATE TABLE IF NOT EXISTS performances(";
  for (String datatype in myData.keys) {
    for (String variable in myData[datatype]!) {
      output += "$variable $datatype, ";
    }
  }
  return "${output.substring(0, output.length - 2)});";
}

Future<void> insertPerformance(Performance performance) async {
  final db = await database;
  await db.insert(
    'performances',
    performance.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  print(await viewDB());
}

Future<List<Performance>> performance() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('performances');
  return List.generate(maps.length, (i) {
    return Performance.complete(
        initials: maps[i]["initials"],
        match: maps[i]["match"],
        team: maps[i]["team"],
        position: maps[i]["position"],
        preload: maps[i]["preload"],
        move: toBool(maps[i]["move"]),
        exit_path: maps[i]["exit_path"],
        auto_cone_L1: maps[i]["auto_cone_L1"],
        auto_hybrid_L2: maps[i]["auto_hybrid_L2"],
        auto_cone_L3: maps[i]["auto_cone_L3"],
        auto_cone_L4: maps[i]["auto_cone_L4"],
        auto_hybrid_l5: maps[i]["auto_hybrid_l5"],
        auto_cone_L6: maps[i]["auto_cone_L6"],
        auto_cone_L7: maps[i]["auto_cone_L7"],
        auto_hybrid_L8: maps[i]["auto_hybrid_L8"],
        auto_cone_L9: maps[i]["auto_cone_L9"],
        auto_cone_M1: maps[i]["auto_cone_M1"],
        auto_cube_M2: maps[i]["auto_cube_M2"],
        auto_cone_M3: maps[i]["auto_cone_M3"],
        auto_cone_M4: maps[i]["auto_cone_M4"],
        auto_cube_M5: maps[i]["auto_cube_M5"],
        auto_cone_M6: maps[i]["auto_cone_M6"],
        auto_cone_M7: maps[i]["auto_cone_M7"],
        auto_cube_M8: maps[i]["auto_cube_M8"],
        auto_cone_M9: maps[i]["auto_cone_M9"],
        auto_cone_H1: maps[i]["auto_cone_H1"],
        auto_cube_H2: maps[i]["auto_cube_H2"],
        auto_cone_H3: maps[i]["auto_cone_H3"],
        auto_cone_H4: maps[i]["auto_cone_H4"],
        auto_cube_H5: maps[i]["auto_cube_H5"],
        auto_cone_H6: maps[i]["auto_cone_H6"],
        auto_cone_H7: maps[i]["auto_cone_H7"],
        auto_cube_H8: maps[i]["auto_cube_H8"],
        auto_cone_H9: maps[i]["auto_cone_H9"],
        auto_charge: maps[i]["auto_charge"],
        teleop_cone_L1: toBool(maps[i]["teleop_cone_L1"]),
        teleop_hybrid_L2: maps[i]["teleop_hybrid_L2"],
        teleop_cone_L3: toBool(maps[i]["teleop_cone_L3"]),
        teleop_cone_L4: toBool(maps[i]["teleop_cone_L4"]),
        teleop_hybrid_l5: maps[i]["teleop_hybrid_l5"],
        teleop_cone_L6: toBool(maps[i]["teleop_cone_L6"]),
        teleop_cone_L7: toBool(maps[i]["teleop_cone_L7"]),
        teleop_hybrid_L8: maps[i]["teleop_hybrid_L8"],
        teleop_cone_L9: toBool(maps[i]["teleop_cone_L9"]),
        teleop_cone_M1: toBool(maps[i]["teleop_cone_M1"]),
        teleop_cube_M2: toBool(maps[i]["teleop_cube_M2"]),
        teleop_cone_M3: toBool(maps[i]["teleop_cone_M3"]),
        teleop_cone_M4: toBool(maps[i]["teleop_cone_M4"]),
        teleop_cube_M5: toBool(maps[i]["teleop_cube_M5"]),
        teleop_cone_M6: toBool(maps[i]["teleop_cone_M6"]),
        teleop_cone_M7: toBool(maps[i]["teleop_cone_M7"]),
        teleop_cube_M8: toBool(maps[i]["teleop_cube_M8"]),
        teleop_cone_M9: toBool(maps[i]["teleop_cone_M9"]),
        teleop_cone_H1: toBool(maps[i]["teleop_cone_H1"]),
        teleop_cube_H2: toBool(maps[i]["teleop_cube_H2"]),
        teleop_cone_H3: toBool(maps[i]["teleop_cone_H3"]),
        teleop_cone_H4: toBool(maps[i]["teleop_cone_H4"]),
        teleop_cube_H5: toBool(maps[i]["teleop_cube_H5"]),
        teleop_cone_H6: toBool(maps[i]["teleop_cone_H6"]),
        teleop_cone_H7: toBool(maps[i]["teleop_cone_H7"]),
        teleop_cube_H8: toBool(maps[i]["teleop_cube_H8"]),
        teleop_cone_H9: toBool(maps[i]["teleop_cone_H9"]),
        cycles: maps[i]["cycles"],
        fouls_committed: maps[i]["fouls_committed"],
        charging_station_time: maps[i]["charging_station_time"],
        charging_station_endgame: maps[i]["charging_station_endgame"],
        triple_balance: toBool(maps[i]["triple_balance"]),
        disconnect: toBool(maps[i]["disconnect"]));
  });
}

Future<List<String>> viewDB() async {
  List<Performance> performances = await performance();
  List<String> output = [];
  for (Performance performance in performances) {
    output.add(performance.toString());
  }
  return output;
}

Future<String?> lastPerformance() async {
  List<Performance> allPerformances = await performance();
  if (allPerformances.isEmpty) {
    return null;
  }
  allPerformances.sort();
  return allPerformances[allPerformances.length - 1].toString();
}

Future<void> deletePerformance(int match, int team) async {
  final db = await database;
  await db.delete(
    'performances',
    where: 'match = ? and team = ?',
    whereArgs: [match, team],
  );
}

Future<void> deleteDatabase() async {
  try {
    databaseFactory
        .deleteDatabase(join(await getDatabasesPath(), databaseName));
  } catch (e) {}
}

bool toBool(int integer) {
  if (integer == 0) {
    return true;
  } else {
    return false;
  }
}
