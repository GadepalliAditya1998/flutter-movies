// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_item.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MovieListItemSerializer implements Serializer<MovieListItem> {
  final _numToStringProcessor = const NumToStringProcessor();
  @override
  Map<String, dynamic> toMap(MovieListItem model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'title', model.title);
    setMapValueIfNotNull(
        ret, 'year', _numToStringProcessor.serialize(model.year));
    setMapValueIfNotNull(ret, 'imdbId', model.imdbId);
    setMapValueIfNotNull(ret, 'type', model.type);
    setMapValueIfNotNull(ret, 'poster', model.poster);
    setMapValue(ret, 'response', model.response);
    setMapValue(ret, 'error', model.error);
    return ret;
  }

  @override
  MovieListItem fromMap(Map map) {
    if (map == null) return null;
    final obj = MovieListItem();
    obj.title = map['Title'] as String ?? getJserDefault('title') ?? obj.title;
    obj.year =
        _numToStringProcessor.deserialize(map['Year'] as String) as int ??
            getJserDefault('year') ??
            obj.year;
    obj.imdbId =
        map['imdbID'] as String ?? getJserDefault('imdbId') ?? obj.imdbId;
    obj.type = map['Type'] as String ?? getJserDefault('type') ?? obj.type;
    obj.poster =
        map['Poster'] as String ?? getJserDefault('poster') ?? obj.poster;
    obj.response = map['response'] as bool;
    obj.error = map['error'] as String;
    return obj;
  }
}
