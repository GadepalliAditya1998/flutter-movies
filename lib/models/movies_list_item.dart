import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'api_response.dart';
part 'movies_list_item.jser.dart';

class MovieListItem extends ApiResponse {
  @Field(
      isNullable: false,
      dontDecode: false,
      decodeFrom: 'Title',
      dontEncode: false)
  String title;
  @Field(
      processor: NumToStringProcessor(),
      isNullable: false,
      dontDecode: false,
      decodeFrom: 'Year',
      dontEncode: false)
  int year;
  @Field(
      isNullable: false,
      dontDecode: false,
      decodeFrom: 'imdbID',
      dontEncode: false)
  String imdbId;
  @Field(
      isNullable: false,
      dontDecode: false,
      decodeFrom: 'Type',
      dontEncode: false)
  String type;
  @Field(
      isNullable: false,
      dontDecode: false,
      decodeFrom: 'Poster',
      dontEncode: false)
  String poster;
}

@GenSerializer()
class MovieListItemSerializer extends Serializer<MovieListItem>
    with _$MovieListItemSerializer {}
