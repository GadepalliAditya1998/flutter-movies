// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_item.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MovieListItemSerializer implements Serializer<MovieListItem> {
  @override
  Map<String, dynamic> toMap(MovieListItem model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'year', model.year);
    setMapValue(ret, 'imdbId', model.imdbId);
    setMapValue(ret, 'type', model.type);
    setMapValue(ret, 'poster', model.poster);
    return ret;
  }

  @override
  MovieListItem fromMap(Map map) {
    if (map == null) return null;
    final obj = MovieListItem();
    obj.title = map['title'] as String;
    obj.year = map['year'] as int;
    obj.imdbId = map['imdbId'] as String;
    obj.type = map['type'] as String;
    obj.poster = map['poster'] as String;
    return obj;
  }
}
