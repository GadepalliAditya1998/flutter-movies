// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MovieDetailsSerializer implements Serializer<MovieDetails> {
  @override
  Map<String, dynamic> toMap(MovieDetails model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'imdbId', model.imdbId);
    setMapValueIfNotNull(ret, 'title', model.title);
    setMapValue(ret, 'year', model.year);
    setMapValue(ret, 'rated', model.rated);
    setMapValue(
        ret, 'released', dateTimeUtcProcessor.serialize(model.released));
    setMapValue(ret, 'runtime', model.runtime);
    setMapValue(ret, 'genre', model.genre);
    setMapValue(ret, 'director', model.director);
    setMapValue(ret, 'writer', model.writer);
    setMapValue(ret, 'actors', model.actors);
    setMapValue(ret, 'plot', model.plot);
    setMapValue(ret, 'language', model.language);
    setMapValue(ret, 'country', model.country);
    setMapValue(ret, 'awards', model.awards);
    setMapValue(ret, 'poster', model.poster);
    setMapValue(ret, 'metascore', model.metascore);
    setMapValue(ret, 'imdbRating', model.imdbRating);
    setMapValue(ret, 'imdbVotes', model.imdbVotes);
    setMapValue(ret, 'type', model.type);
    setMapValue(ret, 'dvd', model.dvd);
    setMapValue(ret, 'boxOffice', model.boxOffice);
    setMapValue(ret, 'production', model.production);
    setMapValue(ret, 'website', model.website);
    setMapValue(ret, 'response', model.response);
    setMapValue(ret, 'error', model.error);
    return ret;
  }

  @override
  MovieDetails fromMap(Map map) {
    if (map == null) return null;
    final obj = MovieDetails();
    obj.imdbId =
        map['ImdbId'] as String ?? getJserDefault('imdbId') ?? obj.imdbId;
    obj.title = map['Title'] as String ?? getJserDefault('title') ?? obj.title;
    obj.year = map['year'] as String;
    obj.rated = map['rated'] as String;
    obj.released = dateTimeUtcProcessor.deserialize(map['released'] as String);
    obj.runtime = map['runtime'] as String;
    obj.genre = map['genre'] as String;
    obj.director = map['director'] as String;
    obj.writer = map['writer'] as String;
    obj.actors = map['actors'] as String;
    obj.plot = map['plot'] as String;
    obj.language = map['language'] as String;
    obj.country = map['country'] as String;
    obj.awards = map['awards'] as String;
    obj.poster = map['poster'] as String;
    obj.metascore = map['metascore'] as String;
    obj.imdbRating = map['imdbRating'] as String;
    obj.imdbVotes = map['imdbVotes'] as String;
    obj.type = map['type'] as String;
    obj.dvd = map['dvd'] as String;
    obj.boxOffice = map['boxOffice'] as String;
    obj.production = map['production'] as String;
    obj.website = map['website'] as String;
    obj.response = map['response'] as bool;
    obj.error = map['error'] as String;
    return obj;
  }
}
