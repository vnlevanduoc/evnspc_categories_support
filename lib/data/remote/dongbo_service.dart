import 'package:dio/dio.dart';
import 'package:evnspc_categories_support/network/spcit_client.dart';

class DongBoService {
  Future<Response> dongBoDuLieu() async {
    return SPCIT_Client.instance.dio.get(
      '/b/5deeff75bc5ffd040096c59d/3',
    );
  }
}
