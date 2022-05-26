import 'package:demo_movie/helpers/apis/api_response.dart';
import 'package:demo_movie/helpers/responsive.dart';
import 'package:demo_movie/view_model/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyHomeMovies extends StatelessWidget {
  const BodyHomeMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topMoviesResponse = Provider.of<MovieViewModel>(context);
    final Responsive responsive = Responsive.of(context);

    switch (topMoviesResponse.statusAPI.status) {
      case Status.LOADING:
      case Status.INITIAL:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: responsive.hp(4)),
              child: Text(
                "Peliculas",
                style: TextStyle(
                    fontSize: responsive.dp(3), fontWeight: FontWeight.bold),
              ),
            ),
            Center(
                child: Container(
              padding: EdgeInsets.only(
                  top: responsive.hp(2),
                  left: responsive.wp(1),
                  right: responsive.wp(1)),
              child: GridView.count(
                  crossAxisCount:
                      responsive.orientation == Orientation.portrait ? 2 : 3,
                  crossAxisSpacing:
                      responsive.orientation == Orientation.portrait ? 1 : 10,
                  mainAxisSpacing: responsive.hp(1),
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    topMoviesResponse.statusAPI.data.results.length,
                    (index) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, 'moviedetail',
                                arguments: topMoviesResponse
                                    .statusAPI.data.results[index]),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: FadeInImage(
                                    image: NetworkImage(topMoviesResponse
                                                .statusAPI
                                                .data
                                                .results[index]
                                                .posterPath ==
                                            ""
                                        ? "https://commons.wikimedia.org/wiki/File:No_Image_Available.jpg"
                                        : "https://image.tmdb.org/t/p/w500" +
                                            topMoviesResponse.statusAPI.data
                                                .results[index].posterPath),
                                    placeholder: const AssetImage(
                                        'assets/images/No_Image_Available.jpg'),
                                    fit: BoxFit.fill,
                                    height: responsive.hp(
                                        responsive.orientation ==
                                                Orientation.portrait
                                            ? 24
                                            : 45),
                                    width: responsive.wp(
                                        responsive.orientation ==
                                                Orientation.portrait
                                            ? 45
                                            : 40),
                                  ),
                                ),
                                Text(
                                  topMoviesResponse
                                      .statusAPI.data.results[index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                )
                              ],
                            ),
                          ));
                    },
                  )),
            )),
          ],
        );
      case Status.ERROR:
        return const Center(
          child:
              Text('Ocurrio un error al obtener los datos!, intente mas tarde'),
        );

      default:
        return const Center(
          child: Text(''),
        );
    }
  }
}
