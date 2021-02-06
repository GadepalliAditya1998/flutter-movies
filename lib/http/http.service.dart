import 'package:dio/dio.dart';
import 'package:flutterMoviesApp/utilities/serializer_utility.dart';

class HttpService {
  final String _baseUrl = 'http://www.omdbapi.com/';
  SerializerUtility _serializerUtility;
  Dio dio;

  HttpService() {
    var options = new BaseOptions(
      baseUrl: this._baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    this.dio = new Dio(options);
    this._serializerUtility = SerializerUtility.getInstance();
  }

  Map<String, String> get _params => {'apikey': '45af497c'};

  Future<T> get<T>(String path, {Map<String, String> params}) async {
    try {
      params.addAll(this._params);
      var response = await this.dio.get(path, queryParameters: params);

      if (response != null) {
        var data = response.data;
        return this._serializerUtility.fromJson<T>(data);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      } else if (e.type == DioErrorType.RESPONSE) {
      } else if (e.type == DioErrorType.CONNECT_TIMEOUT) {}
    }
    return null;
  }

  Future<List<T>> getList<T>(String path, {Map<String, String> params}) async {
    try {
      params.addAll(this._params);
      var response = await this.dio.get(path, queryParameters: this._params);
      if (response != null) {
        var data = response.data;
        return this._serializerUtility.fromJsonArray<T>(data);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      } else if (e.type == DioErrorType.RESPONSE) {
      } else if (e.type == DioErrorType.CONNECT_TIMEOUT) {}
    }
    return null;
  }
}
