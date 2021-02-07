import 'package:flutter/material.dart';
import 'package:flutterMoviesApp/pages/list_page.dart';
import 'package:flutterMoviesApp/providers/movie_list_provider.dart';
import 'package:flutterMoviesApp/widgets/search_appbar.dart';
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

  Map<String, Widget> _tabs = {};

  @override
  void initState() {
    super.initState();
    this.initializeTabs();
    this._tabController =
        TabController(initialIndex: 0, vsync: this, length: this._tabs.length)
          ..addListener(() => onTabChange(this._tabController.index));
  }

  void initializeTabs() {
    this._tabs = {'Movies': MoviesListPage(), 'Series': MoviesListPage()};
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListProvider>(
      builder: (context, movieProvider, _) => WillPopScope(
        onWillPop: this.onBackPress,
        child: Scaffold(
          appBar: !movieProvider.isSearchMode
              ? AppBar(
                  leading: Icon(Icons.movie_creation_rounded),
                  title: Text('Movies App'),
                  actions: [
                    IconButton(
                      icon: Icon(movieProvider.isSearchMode
                          ? Icons.close
                          : Icons.search),
                      onPressed: () {
                        movieProvider.setSearchMode(true);
                      },
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          controller: _tabController,
                          labelPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: true,
                          tabs: this._tabs.keys.map((t) => Text(t)).toList()),
                    ),
                  ),
                )
              : _search,
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: this._tabs.values.toList()),
        ),
      ),
    );
  }

  Widget get _search {
    var provider = Provider.of<MovieListProvider>(context, listen: false);
    return SearchAppBar(
      onBackPress: () {
        provider.setSearchMode(false);
      },
      onClearTap: () {
        if (provider.searchText?.isEmpty ?? true) {
          provider.setSearchMode(false);
        } else {
          this._controller.clear();
          provider.setSearchText('');
        }
      },
      onSearch: provider.setSearchText,
    );
  }

  onTabChange(int index) {
    var movieProvider = Provider.of<MovieListProvider>(context, listen: false);
    movieProvider.setActiveTab(index);
  }

  Future<bool> onBackPress() async {
    var movieProvider = Provider.of<MovieListProvider>(context, listen: false);
    if (movieProvider.isSearchMode) {
      _controller.clear();
      movieProvider.setSearchMode(false);
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    this._tabController.dispose();
    super.dispose();
  }
}
