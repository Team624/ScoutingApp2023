import 'dart:async';
import 'package:path/path.dart';
import 'package:scouting_app_2023/database/entry.dart';
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
      'content',
    ],
    'INTEGER': ['match', 'team']
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
    performance.toEntry().toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Entry>> entry() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('performances');
  return List.generate(maps.length, (i) {
    return Entry.complete(
        match: maps[i]["match"],
        team: maps[i]["team"],
        content: maps[i]["content"]);
  });
}

Future<List<String>> viewDB() async {
  List<Entry> entries = await entry();
  List<String> output = [];
  for (Entry entry in entries) {
    output.add(entry.toString());
  }
  return output;
}

Future<String?> lastPerformance() async {
  List<Entry> allEntries = await entry();
  if (allEntries.isEmpty) {
    return null;
  }
  allEntries.sort();
  return allEntries[allEntries.length - 1].toString();
}

Future<void> deletePerformance(String match, String team) async {
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
