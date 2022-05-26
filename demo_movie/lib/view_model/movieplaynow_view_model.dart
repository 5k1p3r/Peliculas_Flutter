import 'package:demo_movie/helpers/apis/api_response.dart';
import 'package:demo_movie/model/movies_play_now/movies_now_playing.dart';
import 'package:demo_movie/model/movies_play_now/movies_now_playing_repository.dart';
import 'package:flutter/cupertino.dart';

class MoviePlayNowViewModel with ChangeNotifier {
  ApiResponse _apiStatus = ApiResponse.initial("Empty data");

  MoviePlayNowViewModel() {
    fetchMoviePlayNowData();
  }
  ApiResponse get statusAPI {
    return _apiStatus;
  }

  //Call service and gets the data o the request
  Future<void> fetchMoviePlayNowData() async {
    _apiStatus = ApiResponse.loading("Obteniendo top de peliculas");
    notifyListeners();
    try {
      MoviesPlayNow? moviesPlayNowList =
          await MoviesPlayNowRepository().fetchMoviePlayNowList();
      _apiStatus = ApiResponse.completed(moviesPlayNowList);
    } catch (e) {
      _apiStatus = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
