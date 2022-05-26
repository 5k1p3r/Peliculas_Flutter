import 'package:demo_movie/helpers/apis/app_exception.dart';
import 'package:demo_movie/model/movies_play_now/movies_now_playing.dart';
import 'package:demo_movie/services/base_service.dart';
import 'package:demo_movie/services/movie_play_now_service.dart';

class MoviesPlayNowRepository {
  final BaseService _service = MoviesPlayNowService();

  Future<MoviesPlayNow?> fetchMoviePlayNowList() async {
    dynamic response = await _service.getResponse();
    MoviesPlayNow? topMoviesLst;
    try {
      topMoviesLst = moviesPlayNowFromJson(response);
    } on Exception catch (exception) {
      throw AnUnexpectedException('an unexpected error occurred');
    } catch (error) {
      throw AnUnexpectedException('an unexpected error occurred');
    }
    return topMoviesLst;
  }
}
