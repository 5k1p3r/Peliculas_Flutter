import 'package:demo_movie/helpers/apis/app_exception.dart';
import 'package:demo_movie/model/Movies/movies.dart';
import 'package:demo_movie/services/base_service.dart';
import 'package:demo_movie/services/movie_service.dart';

class MoviesRepository {
  final BaseService _service = MovieService();

  Future<Movies?> fetchMovies() async {
    dynamic response = await _service.getResponse();

    Movies? MoviesLst;
    try {
      MoviesLst = moviesFromJson(response);
    } on Exception catch (exception) {
      print(exception);

      throw AnUnexpectedException('an unexpected error occurred');
    } catch (error) {
      throw AnUnexpectedException('an unexpected error occurred');
    }
    return MoviesLst;
  }
}
