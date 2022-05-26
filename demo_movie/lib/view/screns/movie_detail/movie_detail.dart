import 'package:demo_movie/helpers/responsive.dart';
import 'package:demo_movie/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final Object? movie = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _movieDetailAppbar(context, movie as Result, responsive),
        SliverList(
          delegate: SliverChildListDelegate([
            _movieLikes(context, movie, responsive),
            SizedBox(height: responsive.hp(2)),
            _moviewDetailOverview(movie, responsive)
          ]),
        )
      ],
    ));
  }

  Widget _movieLikes(
      BuildContext context, Result movie, Responsive responsive) {
    return Padding(
      padding: EdgeInsets.only(
          right: responsive.wp(10),
          left: responsive.wp(2),
          top: responsive.hp(1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: responsive.wp(1),
              ),
              Text(movie.voteCount.toString()),
            ],
          ),
          Text("Fecha de estreno: " +
              DateFormat('dd/MM/yyyy').format(movie.releaseDate)),
        ],
      ),
    );
  }

  Widget _movieDetailAppbar(
      BuildContext context, Result movie, Responsive responsive) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: responsive.dp(2.8)),
        ),
        background: FadeInImage(
          image: NetworkImage(movie.backdropPath == null
              ? "https://commons.wikimedia.org/wiki/File:No_Image_Available.jpg"
              : "https://image.tmdb.org/t/p/w500" +
                  movie.backdropPath.toString()),
          placeholder: const AssetImage('assets/images/No_Image_Available.jpg'),
          fadeInDuration: const Duration(milliseconds: 15),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _moviewDetailOverview(Result movie, Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(3), vertical: responsive.hp(5)),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
