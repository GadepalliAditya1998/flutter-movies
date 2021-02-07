import 'package:flutter/material.dart';
import 'package:flutterMoviesApp/models/movie_details.dart';
import 'package:flutterMoviesApp/providers/movie_details_provider.dart';
import 'package:flutterMoviesApp/widgets/image_preview.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatelessWidget {
  final String imbdId;

  MovieDetailsPage({Key key, this.imbdId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) =>
            MovieDetailsProvider(imdbId: this.imbdId)..loadMovieDetails(),
        child: SafeArea(child: Scaffold(body: Consumer<MovieDetailsProvider>(
            builder: (context, movieDetailsProvider, _) {
          if (movieDetailsProvider.isLoading) {
            return Center(
                child: Container(
                    width: 25, height: 25, child: CircularProgressIndicator()));
          } else {
            var movieDetail = movieDetailsProvider.details;
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                SliverAppBar(
                  title: Text(movieDetail.title,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18)),
                  expandedHeight: 300.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    background: InkWell(
                      onTap: () => previewImage(
                          context, movieDetail.poster, movieDetail.imdbId),
                      child: Hero(
                        tag: movieDetail.imdbId,
                        child: Image.network(
                          movieDetail.poster,
                          fit: BoxFit.cover,
                          errorBuilder: (context, _, __) => Center(
                            child: Icon(
                              Icons.movie_rounded,
                              size: 70,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
              body: this.getDetails(movieDetail),
            );
          }
        }))));
  }

  Widget getDetails(MovieDetails movieDetail) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movieDetail.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                  SizedBox(height: 10),
                  this._getGroupText('Year', movieDetail.year),
                  this._getGroupText('Released', movieDetail.released),
                  this._getGroupText('Genre', movieDetail.genre),
                  this._getGroupText('Rated', movieDetail.rated),
                  this._getGroupText('Runtime', movieDetail.runtime),
                  this._getGroupText('Director', movieDetail.director),
                  this._getGroupText('Writer', movieDetail.writer),
                  this._getGroupText('Actors', movieDetail.actors),
                  this._getGroupText('Plot', movieDetail.plot),
                  this._getGroupText('Country', movieDetail.country),
                  this._getGroupText('Awards', movieDetail.awards),
                  this._getGroupText('Imdb Rating', movieDetail.imdbRating),
                  this._getGroupText('Imdb Votes', movieDetail.imdbVotes),
                  this._getGroupText('DVD', movieDetail.dvd),
                  this._getGroupText('Box Office', movieDetail.boxOffice),
                  this._getGroupText('Production', movieDetail.production),
                  this._getGroupText('Website', movieDetail.website),
                ],
              ))
        ]));
  }

  Widget _getGroupText(String title, String value) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title + ':',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(width: 8),
            Flexible(
              child: Text(value ?? 'N/A',
                  style: TextStyle(fontSize: 16, height: 1.4), softWrap: true),
            )
          ],
        ));
  }

  void previewImage(BuildContext context, String url, String tag) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ImagePreview(
              url: url,
              tag: tag,
            ),
        fullscreenDialog: true));
  }
}
