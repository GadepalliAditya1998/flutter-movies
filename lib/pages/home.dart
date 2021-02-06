import 'package:flutter/material.dart';
import 'package:flutterMoviesApp/pages/list_page.dart';
import 'package:flutterMoviesApp/providers/movie_list_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  TabController _tabController;
  List<int> years;

  @override
  void initState() {
    super.initState();
    this._tabController = TabController(initialIndex: 0, vsync: this, length: 3)
      ..addListener(() => onTabChange(this._tabController.index));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListProvider>(
      builder: (context, movieProvider, _) => WillPopScope(
        onWillPop: () async {
          if (movieProvider.isSearchMode) {
            _controller.clear();
            movieProvider.setSearchMode(false);
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: movieProvider.isSearchMode
                ? Colors.white
                : Theme.of(context).appBarTheme.color,
            leading: Icon(Icons.movie_creation_rounded),
            title: movieProvider.isSearchMode ? _search : Text('Movies App'),
            actions: !movieProvider.isSearchMode
                ? [
                    IconButton(
                      icon: Icon(movieProvider.isSearchMode
                          ? Icons.close
                          : Icons.search),
                      onPressed: () {
                        movieProvider.setSearchMode(true);
                      },
                    ),
                  ]
                : null,
            bottom: !movieProvider.isSearchMode
                ? PreferredSize(
                    preferredSize: Size.fromHeight(30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          controller: _tabController,
                          labelPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: true,
                          tabs: [
                            Text('Movies'),
                            Text('Series'),
                            Text('Episodes')
                          ]),
                    ),
                  )
                : null,
          ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                MoviesListPage(),
                MoviesListPage(),
                MoviesListPage(),
              ]),
        ),
      ),
    );
  }

  TextFormField get _search {
    var provider = Provider.of<MovieListProvider>(context, listen: false);
    return TextFormField(
      controller: _controller,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: provider.setSearchText,
      decoration: InputDecoration(
          hintText: 'Search',
          isCollapsed: true,
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          suffixIcon: IconButton(
              onPressed: () {
                if (provider.searchText?.isEmpty ?? true) {
                  provider.setSearchMode(false);
                } else {
                  this._controller.clear();
                  provider.setSearchText('');
                }
              },
              icon: Icon(Icons.close, color: Colors.black))),
    );
  }

  onTabChange(int index) {
    var provider = Provider.of<MovieListProvider>(context, listen: false);
    provider.setActiveTab(index);
  }

  @override
  void dispose() {
    this._tabController.dispose();
    super.dispose();
  }
}
