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
    "INTEGER": ["match", "team"],
    "TEXT": ["nickname"]
  };
  String output = "CREATE TABLE performances(";
  for (String datatype in myData.keys) {
    for (String variable in myData[datatype]!) {
      output += "$variable $datatype, ";
    }
  }
  return "${output.substring(0, output.length - 2)})";
}

Future<void> insertPerformance(Performance performance) async {
  final db = await database;
  await db.insert(
    'performances',
    performance.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Performance>> performance() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('performances');
  return List.generate(maps.length, (i) {
    return Performance(
      match: maps[i]["match"],
      team: maps[i]["team"],
      // nickname: maps[i]["nickname"],
    );
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
  } catch (e) {
    print("DELETE FAILED");
  }
}
