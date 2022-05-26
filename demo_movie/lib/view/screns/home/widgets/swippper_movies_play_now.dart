import 'package:demo_movie/helpers/apis/api_response.dart';
import 'package:demo_movie/helpers/responsive.dart';
import 'package:demo_movie/view_model/movieplaynow_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';

class SwipperMoviesPlayNow extends StatelessWidget {
  const SwipperMoviesPlayNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesPlayNowResponse = Provider.of<MoviePlayNowViewModel>(context);
    final Responsive responsive = Responsive.of(context);

    switch (moviesPlayNowResponse.statusAPI.status) {
      case Status.LOADING:
      case Status.INITIAL:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        if (moviesPlayNowResponse.statusAPI.data == null) {
          return const Center(
            child: Text('No se han encontrado Películas en cines'),
          );
        } else {
          return Column(
            children: [
              Text(
                "Peliculas en cines",
                style: TextStyle(
                    fontSize: responsive.dp(3), fontWeight: FontWeight.bold),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                      top: responsive.hp(2), left: responsive.wp(10)),
                  child: Swiper(
                    layout: SwiperLayout.STACK,
                    itemWidth: responsive.wp(60),
                    itemHeight: responsive.hp(50),
                    itemBuilder: (BuildContext context, int index) {
                      moviesPlayNowResponse
                              .statusAPI.data.results[index].uniqueId =
                          '${moviesPlayNowResponse.statusAPI.data.results[index].id}-tarjeta';
                      return Hero(
                        tag: moviesPlayNowResponse
                            .statusAPI.data.results[index].uniqueId
                            .toString(),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, 'moviedetail',
                                  arguments: moviesPlayNowResponse
                                      .statusAPI.data.results[index]),
                              child: FadeInImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500" +
                                        moviesPlayNowResponse.statusAPI.data
                                            .results[index].posterPath),
                                placeholder: const AssetImage(
                                    'assets/images/No_Image_Available.jpg'),
                                fit: BoxFit.cover,
                              ),
                            )),
                      );
                    },
                    itemCount:
                        moviesPlayNowResponse.statusAPI.data.results.length,
                  ),
                ),
              )
            ],
          );
        }

      case Status.ERROR:
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
                'Ocurrio un error al obtener las peliculas en cines!, intente mas tarde'),
          ),
        );

      default:
        return const Center(
          child: Text(''),
        );
    }
  }
}
