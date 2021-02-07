import 'package:flutter/widgets.dart';
import 'package:flutterMoviesApp/models/index.dart';
import 'package:flutterMoviesApp/repositories/movies_repository.dart';

class MovieDetailsProvider extends ChangeNotifier {
  String imdbId;
  MovieRepository _movieRepository;
  MovieDetailsProvider({this.imdbId}) {
    this._movieRepository = MovieRepository();
  }

  MovieDetails _details;
  MovieDetails get details => this._details;

  bool _isLoading;
  bool get isLoading => this._isLoading;

  void setLoading(bool isLoading) {
    this._isLoading = isLoading;
    notifyListeners();
  }

  void loadMovieDetails() async {
    this.setLoading(true);
    this._details = await this._movieRepository.getMovieDetails(this.imdbId);
    this.setLoading(false);
  }
}
