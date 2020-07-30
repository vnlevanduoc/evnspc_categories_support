import 'dart:async';

import 'package:evnspc_categories_support/data/remote/dongbo_service.dart';
import 'package:evnspc_categories_support/db/spcit_db.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DongBoRepo {
  DongBoService _service;

  DongBoRepo({@required DongBoService service}) : _service = service;

  Future<dynamic> get_dulieu() async {
    var c = Completer<dynamic>();
    var result;
    try {
      var response = await _service.dongBoDuLieu();
      if (response.statusCode == 200) {
        result = response.data;
      }
      c.complete(result);
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<int> saveData(String data) async {
    final Database db = SpcitDatabase.instance.database;
    final res = await db.rawUpdate("""
      INSERT OR REPLACE INTO DATA_JSON (DATA) VALUES ('$data')
    """);
    return res;
  }

  Future<dynamic> selectData() async {
    final Database db = SpcitDatabase.instance.database;
    final result = await db.rawQuery("SELECT * FROM DATA_JSON");

    return result.map((item) => item["DATA"]).first;
  }
}
