import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SpcitDatabase {
  static const DB_NAME = "evnspc_categories_support.db";
  static const DB_VERSION = 1; //đơn vị đang là 5
  static Database _database;

  //Tạo single instance
  SpcitDatabase._internal();
  static final SpcitDatabase instance = SpcitDatabase._internal();

  Database get database => _database;

  static const createTable = '''
    CREATE TABLE DATA_JSON (
      DATA    TEXT,
      PRIMARY KEY(DATA)
    );
  ''';

  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        onCreate: (db, version) {
      db.execute(createTable);
    }, onUpgrade: (db, oldVersion, newVersion) {}, version: DB_VERSION);
  }
}
