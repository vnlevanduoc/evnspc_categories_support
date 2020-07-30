import 'dart:async';

import 'package:evnspc_categories_support/data/remote/dongbo_service.dart';
import 'package:flutter/material.dart';

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
}
