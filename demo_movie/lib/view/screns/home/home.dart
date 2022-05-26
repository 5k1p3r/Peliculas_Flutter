import 'package:demo_movie/view/screns/home/widgets/body_home_movies.dart';
import 'package:demo_movie/view/screns/home/widgets/swippper_movies_play_now.dart';
import 'package:demo_movie/view/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[SwipperMoviesPlayNow(), BodyHomeMovies()],
        ),
      ),
    );
  }
}
