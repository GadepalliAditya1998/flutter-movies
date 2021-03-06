import 'package:flutter/widgets.dart';
import 'package:flutterMoviesApp/models/movies_list_item.dart';
import 'package:flutterMoviesApp/repositories/movies_repository.dart';

enum MoviesQueryType { movies, series, episode }

class MovieListProvider extends ChangeNotifier {
  List<MovieListItem> _movieList = [];
  MovieRepository _movieRepository;

  bool isSearchMode = false;
  bool isLoading = false;
  String searchText;
  MoviesQueryType activeTab = MoviesQueryType.movies;

  int pageIndex = 1;
  int selectedYear;

  MovieListProvider() {
    this._movieRepository = MovieRepository();
  }

  setSearchMode(bool isSearchMode) {
    this.isSearchMode = isSearchMode;
    notifyListeners();
  }

  void setSearchText(String searchText) {
    this.searchText = searchText;
  }

  void setYear(int year) {
    this.selectedYear = year;
  }

  void fetchMovies() async {
    this.isLoading = true;
    notifyListeners();

    var result = await this._movieRepository.getMovies(
          movieName: searchText,
          pageIndex: this.pageIndex,
          type: _movieTypeMap[this.activeTab],
          year: selectedYear,
        );
    this.isLoading = false;
    if (result != null) {
      this._movieList = result;
    }
    notifyListeners();
  }

  void setActiveTab(int position) {
    this.activeTab = MoviesQueryType.values.elementAt(position);
  }

  void setLoading(bool isloading) {
    this.isLoading = isloading;
    notifyListeners();
  }

  void loadNextPage() {
    this.pageIndex++;
    this.fetchMovies();
  }

  List<MovieListItem> get movies {
    if (this.searchText != null && this.searchText.isNotEmpty)
      return this
          ._movieList
          .where((movie) =>
              movie.type.toLowerCase() ==
                  _movieTypeMap[this.activeTab].toLowerCase() &&
              movie.title.toLowerCase().contains(this.searchText.toLowerCase()))
          .toList();
    else {
      return this
          ._movieList
          .where((movie) =>
              movie.type.toLowerCase() ==
              _movieTypeMap[this.activeTab].toLowerCase())
          .toList();
    }
  }

  Map<MoviesQueryType, String> get _movieTypeMap => {
        MoviesQueryType.movies: 'movie',
        MoviesQueryType.series: 'series',
        MoviesQueryType.episode: 'episode',
      };
}
