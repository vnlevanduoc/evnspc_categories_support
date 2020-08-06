import 'package:dio/dio.dart';
import 'package:evnspc_categories_support/network/spcit_client.dart';

class DongBoService {
  Future<Response> dongBoDuLieu() async {
    return SPCIT_Client.instance.dio.get(
      '/b/5f2abdf01823333f8f1d274e',
    );
  }
}
