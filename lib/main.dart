import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterMoviesApp/pages/home.dart';
import 'package:flutterMoviesApp/pages/login_page.dart';
import 'package:flutterMoviesApp/pages/splash_screen.dart';
import 'package:flutterMoviesApp/providers/login_provider.dart';
import 'package:flutterMoviesApp/providers/movie_list_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieListProvider>(
            create: (_) => MovieListProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        title: 'Movies App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StreamBuilder<User>(
            stream: auth.userChanges(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return SplashScreen();
                case ConnectionState.active:
                case ConnectionState.done:
                default:
                  return snapshot.data == null ? LoginPage() : Home();
                  break;
              }
            }),
      ),
    );
  }
}
