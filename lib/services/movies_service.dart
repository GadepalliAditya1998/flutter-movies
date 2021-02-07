import 'package:flutterMoviesApp/http/http.service.dart';
import 'package:flutterMoviesApp/models/index.dart';

class MoviesService extends HttpService {
  Future<MovieSearchList> searchMovies(Map<String, String> query) async {
    return this.get<MovieSearchList>('', params: query);
  }

  Future<MovieDetails> getMovieDetails(Map<String, String> query) async {
    return this.get<MovieDetails>('', params: query);
  }
}
