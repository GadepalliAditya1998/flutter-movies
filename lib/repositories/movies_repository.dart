import 'package:flutterMoviesApp/models/index.dart';
import 'package:flutterMoviesApp/services/movies_service.dart';

class MovieRepository {
  List<MovieListItem> _movies;
  int searchResults;

  List<MovieDetails> _movieDetails;

  MoviesService _moviesApiService;

  MovieRepository() {
    this._movies = [];
    this._movieDetails = [];
    this._moviesApiService = MoviesService();
  }

  Future<List<MovieListItem>> getMovies(
      {String movieName, int pageIndex, String type, int year}) async {
    if (movieName == null || movieName.trim().isEmpty) {
      return this._movies;
    } else {
      var query = Map<String, String>()
        ..putIfAbsent('s', () => movieName)
        ..putIfAbsent('page', () => '$pageIndex')
        ..putIfAbsent('y', () => '$year')
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

  Future<MovieDetails> getMovieDetails(String imdbId) async {
    var movie = this._movieDetails.firstWhere(
        (movie) => movie.imdbId.toLowerCase() == imdbId.toLowerCase(),
        orElse: () => null);
    if (movie != null) {
      return movie;
    } else {
      var query = Map<String, String>()..putIfAbsent('i', () => imdbId);
      var details = await this._moviesApiService.getMovieDetails(query);
      if (details != null) {
        this._movieDetails.add(details);
      }
      return details;
    }
  }
}
