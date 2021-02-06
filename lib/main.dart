import 'package:flutter/material.dart';
import 'package:flutterMoviesApp/pages/home.dart';
import 'package:flutterMoviesApp/providers/movie_list_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieListProvider(),
      child: MaterialApp(
        title: 'Movies App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
