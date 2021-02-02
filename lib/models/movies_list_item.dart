import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'movies_list_item.jser.dart';

class MovieListItem {
  String title;
  int year;
  String imdbId;
  String type;
  String poster;
}

@GenSerializer()
class MovieListItemSerializer extends Serializer<MovieListItem>
    with _$MovieListItemSerializer {}
