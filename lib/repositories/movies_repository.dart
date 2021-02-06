import 'package:flutterMoviesApp/models/index.dart';
import 'package:flutterMoviesApp/services/movies_service.dart';

class MovieRepository {
  List<MovieListItem> _movies;
  int searchResults;

  MoviesService _moviesApiService;

  MovieRepository() {
    this._movies = [];
    this._moviesApiService = MoviesService();
  }

  Future<List<MovieListItem>> getMovies(
      {String movieName, int pageIndex, String type}) async {
    if (movieName == null || movieName.trim().isEmpty) {
      return this._movies;
    } else {
      var query = Map<String, String>()
        ..putIfAbsent('s', () => movieName)
        ..putIfAbsent('page', () => '$pageIndex')
        ..putIfAbsent('type', () => type);

      var searchList = await this._moviesApiService.searchMovies(query);
      if (searchList != null) {
        this._movies.removeWhere((movie) =>
            searchList.movies.firstWhere(
                (searchedMovie) =>
                    searchedMovie.imdbId.toLowerCase() == movie.imdbId,
                orElse: () => null) !=
            null);
        this._movies.addAll(searchList.movies);
        this.searchResults = searchList.totalResults;
      }
      return this._movies;
    }
  }
}
