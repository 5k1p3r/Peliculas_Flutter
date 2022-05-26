import 'package:demo_movie/helpers/secure_storage.dart';

abstract class BaseService {
  final String moviesBaseUrl = "https://api.themoviedb.org";
  final String api_key = "0fcce14c4e684bd054fa448cfb1446c4";
  Future<dynamic> getResponse();
}
