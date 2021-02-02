import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'movie_details.jser.dart';

class MovieDetails {
  String imdbId;
  String title;
  String year;
  String rated;
  DateTime released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String type;
  String dvd;
  String boxOffice;
  String production;
  String website;
}

@GenSerializer()
class MovieDetailsSerializer extends Serializer<MovieDetails>
    with _$MovieDetailsSerializer {}
