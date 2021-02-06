import 'package:flutter/material.dart';
import 'package:flutterMoviesApp/models/movies_list_item.dart';
import 'package:flutterMoviesApp/providers/movie_list_provider.dart';
import 'package:provider/provider.dart';

class MoviesListPage extends StatefulWidget {
  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  List<MovieListItem> movies;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListProvider>(builder: (context, moviesProvider, _) {
      if (moviesProvider.isLoading && moviesProvider.movies.isEmpty)
        return Center(
            child: Container(
                height: 30, width: 30, child: CircularProgressIndicator()));
      else if (moviesProvider.movies != null &&
          moviesProvider.movies.length > 0) {
        this.movies = moviesProvider.movies;
        return NotificationListener(
          onNotification: onScroll,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: moviesProvider.movies.length,
                  itemBuilder: _buildItem,
                ),
              ),
              moviesProvider.isLoading
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator())
                  : SizedBox.shrink(),
            ],
          ),
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search),
                SizedBox(width: 10),
                Text(
                  'Looks like you haven\'t searched anything',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                moviesProvider.setSearchMode(true);
              },
              child: Text('Search'),
            )
          ],
        );
      }
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    var movie = movies[index];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                child: Image.network(
                  movie.poster,
                  errorBuilder: (context, _, __) => Icon(
                      Icons.movie_creation_outlined,
                      size: 60,
                      color: Colors.grey),
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Center(child: CircularProgressIndicator());
                  },
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(4),
                child: Text(
                  movie.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              alignment: Alignment.center,
              color: Colors.yellowAccent,
              width: 60,
              height: 25,
              child: Text('${movie.year ?? 'N/A'}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
        ]),
      ),
    );
  }

  bool onScroll(Notification notification) {
    var movieProvider = Provider.of<MovieListProvider>(context, listen: false);
    bool isScreenEnd = _scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels;

    if (notification is ScrollEndNotification && isScreenEnd) {
      movieProvider.loadNextPage();
    }
    return true;
  }
}
