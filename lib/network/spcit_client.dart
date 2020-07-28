import 'package:dio/dio.dart';

class SPCIT_Client {
  static BaseOptions _options = new BaseOptions(
    baseUrl: "https://api.jsonbin.io",
    connectTimeout: 60000,
    receiveTimeout: 10 * 60000, //5phut
    contentType: 'application/json; charset=utf-8',
  );
  static Dio _dio = Dio(_options);

  SPCIT_Client._internal() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (Options myOption) async {
          var token =
              "\$2b\$10\$hsealu8aM.nCgqOA.Zd/weBpFGPIsVSq.lNhWTeAgxVoANx6H1q7K";
          if (token != null) {
            myOption.headers["secret-key"] = token;
          }

          return myOption;
        },
      ),
    );
  }
  static final SPCIT_Client instance = SPCIT_Client._internal();

  Dio get dio => _dio;
}
