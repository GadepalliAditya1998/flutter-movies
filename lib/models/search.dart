import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:flutterMoviesApp/models/movies_list_item.dart';

import 'api_response.dart';
part 'search.jser.dart';

class MovieSearchList extends ApiResponse {
  @Field.decode(alias: 'Search', isNullable: false)
  List<MovieListItem> movies;
  @Field(
      processor: NumToStringProcessor(),
      isNullable: false,
      dontDecode: false,
      decodeFrom: 'TotalResults',
      dontEncode: false)
  int totalResults;

  MovieSearchList({
    this.movies,
    this.totalResults,
  });
}

@GenSerializer()
class MovieSearchListSerializer extends Serializer<MovieSearchList>
    with _$MovieSearchListSerializer {}
