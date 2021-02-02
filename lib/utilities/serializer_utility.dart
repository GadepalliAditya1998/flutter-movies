import 'dart:convert';

import 'package:flutterMoviesApp/models/index.dart';
import 'package:flutterMoviesApp/models/movie_details.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

class SerializerUtility {
  JsonRepo _repo;
  static SerializerUtility _utility;
  SerializerUtility._() {
    _repo = new JsonRepo();
    _repo.add(MovieDetailsSerializer());
    _repo.add(MovieListItemSerializer());
  }

  static SerializerUtility getInstance() {
    if (_utility == null) {
      _utility = SerializerUtility._();
    }
    return _utility;
  }

  String toJson<T>(T object) {
    return jsonEncode(this._repo.getByType(T).toMap(object));
  }

  T fromJson<T extends Serializer>(String json) {
    var serializer = this._repo.getByType(T);
    return serializer.fromMap(jsonDecode(json));
  }

  List<T> fromJsonArray<T>(String json) {
    var serializer = this._repo.getByType(T);
    return serializer.fromList(jsonDecode(json));
  }
}
