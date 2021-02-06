// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MovieSearchListSerializer
    implements Serializer<MovieSearchList> {
  final _numToStringProcessor = const NumToStringProcessor();
  Serializer<MovieListItem> __movieListItemSerializer;
  Serializer<MovieListItem> get _movieListItemSerializer =>
      __movieListItemSerializer ??= MovieListItemSerializer();
  @override
  Map<String, dynamic> toMap(MovieSearchList model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'totalResults',
        _numToStringProcessor.serialize(model.totalResults));
    setMapValue(ret, 'response', model.response);
    setMapValue(ret, 'error', model.error);
    return ret;
  }

  @override
  MovieSearchList fromMap(Map map) {
    if (map == null) return null;
    final obj = MovieSearchList();
    obj.movies = codeNonNullIterable<MovieListItem>(
            map['Search'] as Iterable,
            (val) => _movieListItemSerializer.fromMap(val as Map),
            <MovieListItem>[]) ??
        getJserDefault('movies') ??
        obj.movies;
    obj.totalResults = _numToStringProcessor
            .deserialize(map['TotalResults'] as String) as int ??
        getJserDefault('totalResults') ??
        obj.totalResults;
    obj.response = map['response'] as bool;
    obj.error = map['error'] as String;
    return obj;
  }
}
