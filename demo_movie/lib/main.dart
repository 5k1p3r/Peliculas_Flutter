import 'dart:io';
import 'package:demo_movie/theme/light_theme.dart';
import 'package:demo_movie/view/screns/home/home.dart';
import 'package:demo_movie/view/screns/movie_detail/movie_detail.dart';
import 'package:demo_movie/view_model/movies_view_model.dart';
import 'package:demo_movie/view_model/movieplaynow_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviePlayNowViewModel()),
        ChangeNotifierProvider(create: (_) => MovieViewModel()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        'moviedetail': (_) => const MovieDetail()
      },
      theme: LightTheme,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
