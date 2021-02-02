import 'package:dio/dio.dart';

class HttpService {
  final String _baseUrl = 'http://www.omdbapi.com/?apikey45af497c';
  Dio dio;

  HttpService() {
    var options = new BaseOptions(
      baseUrl: this._baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    this.dio = new Dio(options);
  }

  Future<T> get<T>(String path, {Map<String, String> params}) async {
    try {
      var response = await this.dio.get(path, queryParameters: params);
      if (response != null) {
        var data = response.data;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      } else if (e.type == DioErrorType.RESPONSE) {
      } else if (e.type == DioErrorType.CONNECT_TIMEOUT) {}
    }
  }
}
