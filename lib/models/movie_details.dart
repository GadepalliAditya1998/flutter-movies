import 'package:flutterMoviesApp/models/api_response.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'movie_details.jser.dart';

class MovieDetails extends ApiResponse {
  @Field.decode(alias: 'imdbID', isNullable: false)
  String imdbId;
  @Field.decode(alias: 'Title', isNullable: false)
  String title;
  @Field.decode(alias: 'Year', isNullable: false)
  String year;
  @Field.decode(alias: 'Rated', isNullable: false)
  String rated;
  @Field.decode(alias: 'Released', isNullable: false)
  String released;
  @Field.decode(alias: 'Runtime', isNullable: false)
  String runtime;
  @Field.decode(alias: 'Genre', isNullable: false)
  String genre;
  @Field.decode(alias: 'Director', isNullable: false)
  String director;
  @Field.decode(alias: 'Writer', isNullable: false)
  String writer;
  @Field.decode(alias: 'Actors', isNullable: false)
  String actors;
  @Field.decode(alias: 'Plot', isNullable: false)
  String plot;
  @Field.decode(alias: 'Language', isNullable: false)
  String language;
  @Field.decode(alias: 'Country', isNullable: false)
  String country;
  @Field.decode(alias: 'Awards', isNullable: false)
  String awards;
  @Field.decode(alias: 'Poster', isNullable: false)
  String poster;
  @Field.decode(alias: 'Metascore', isNullable: false)
  String metascore;
  @Field.decode(alias: 'imdbRating', isNullable: false)
  String imdbRating;
  @Field.decode(alias: 'imdbVotes', isNullable: false)
  String imdbVotes;
  @Field.decode(alias: 'Type', isNullable: false)
  String type;
  @Field.decode(alias: 'DVD', isNullable: false)
  String dvd;
  @Field.decode(alias: 'BoxOffice', isNullable: false)
  String boxOffice;
  @Field.decode(alias: 'Production', isNullable: false)
  String production;
  @Field.decode(alias: 'Website', isNullable: false)
  String website;
}

@GenSerializer()
class MovieDetailsSerializer extends Serializer<MovieDetails>
    with _$MovieDetailsSerializer {}
