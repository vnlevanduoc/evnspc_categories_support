import 'dart:convert';
import 'dart:io';
import 'package:evnspc_categories_support/base/base_bloc.dart';
import 'package:evnspc_categories_support/base/base_event.dart';
import 'package:evnspc_categories_support/data/repo/dongbo_repo.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TrangChuBloc extends BaseBloc {
  final DongBoRepo _repo;
  TrangChuBloc({@required DongBoRepo repo}) : _repo = repo;

  final _data = BehaviorSubject<String>();
  Stream<String> get dataStream => _data.stream;
  Sink<String> get dataSink => _data.sink;

  initData() async {
    //Lấy dữ liệu từ internet nếu lấy đc thì insert vào database
    //Nếu không lấy đc hoặc lỗi thì lấy dữ liệu trước đó
    try {
      var result = await _repo.get_dulieu();
      //Save data
      _repo.saveData(jsonEncode(result));
      dataSink.add(jsonEncode(result));
    } catch (e) {
      var oldResult = await _repo.selectData();
      dataSink.add(oldResult);
    }
  }

  Future<String> readFile(String path) {
    return new File(path).readAsString();
  }

  Future<File> writeToFile(String data, String path) {
    return new File(path).writeAsString(data);
  }

  @override
  void dispatchEvent(BaseEvent event) {}

  @override
  void dispose() {
    super.dispose();
    _data.close();
  }
}
