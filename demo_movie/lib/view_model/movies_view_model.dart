import 'package:demo_movie/helpers/apis/api_response.dart';
import 'package:demo_movie/model/Movies/movies.dart';
import 'package:demo_movie/model/Movies/movies_repository.dart';
import 'package:flutter/material.dart';

class MovieViewModel with ChangeNotifier {
  ApiResponse _apiStatus = ApiResponse.initial("Empty data");

  MovieViewModel() {
    fetchTopMovieData();
  }
  ApiResponse get statusAPI {
    return _apiStatus;
  }

  //Call service and gets the data o the request
  Future<void> fetchTopMovieData() async {
    _apiStatus = ApiResponse.loading("Obteniendo listado de peliculas");
    notifyListeners();
    try {
      Movies? moviesList = await MoviesRepository().fetchMovies();
      _apiStatus = ApiResponse.completed(moviesList);
    } catch (e) {
      _apiStatus = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
