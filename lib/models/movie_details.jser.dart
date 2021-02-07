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
    setMapValue(ret, 'response', model.response);
    setMapValue(ret, 'error', model.error);
    return ret;
  }

  @override
  MovieDetails fromMap(Map map) {
    if (map == null) return null;
    final obj = MovieDetails();
    obj.imdbId =
        map['imdbID'] as String ?? getJserDefault('imdbId') ?? obj.imdbId;
    obj.title = map['Title'] as String ?? getJserDefault('title') ?? obj.title;
    obj.year = map['Year'] as String ?? getJserDefault('year') ?? obj.year;
    obj.rated = map['Rated'] as String ?? getJserDefault('rated') ?? obj.rated;
    obj.released =
        map['Released'] as String ?? getJserDefault('released') ?? obj.released;
    obj.runtime =
        map['Runtime'] as String ?? getJserDefault('runtime') ?? obj.runtime;
    obj.genre = map['Genre'] as String ?? getJserDefault('genre') ?? obj.genre;
    obj.director =
        map['Director'] as String ?? getJserDefault('director') ?? obj.director;
    obj.writer =
        map['Writer'] as String ?? getJserDefault('writer') ?? obj.writer;
    obj.actors =
        map['Actors'] as String ?? getJserDefault('actors') ?? obj.actors;
    obj.plot = map['Plot'] as String ?? getJserDefault('plot') ?? obj.plot;
    obj.language =
        map['Language'] as String ?? getJserDefault('language') ?? obj.language;
    obj.country =
        map['Country'] as String ?? getJserDefault('country') ?? obj.country;
    obj.awards =
        map['Awards'] as String ?? getJserDefault('awards') ?? obj.awards;
    obj.poster =
        map['Poster'] as String ?? getJserDefault('poster') ?? obj.poster;
    obj.metascore = map['Metascore'] as String ??
        getJserDefault('metascore') ??
        obj.metascore;
    obj.imdbRating = map['imdbRating'] as String ??
        getJserDefault('imdbRating') ??
        obj.imdbRating;
    obj.imdbVotes = map['imdbVotes'] as String ??
        getJserDefault('imdbVotes') ??
        obj.imdbVotes;
    obj.type = map['Type'] as String ?? getJserDefault('type') ?? obj.type;
    obj.dvd = map['DVD'] as String ?? getJserDefault('dvd') ?? obj.dvd;
    obj.boxOffice = map['BoxOffice'] as String ??
        getJserDefault('boxOffice') ??
        obj.boxOffice;
    obj.production = map['Production'] as String ??
        getJserDefault('production') ??
        obj.production;
    obj.website =
        map['Website'] as String ?? getJserDefault('website') ?? obj.website;
    obj.response = map['response'] as bool;
    obj.error = map['error'] as String;
    return obj;
  }
}
