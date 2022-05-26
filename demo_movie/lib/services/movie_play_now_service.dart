import 'package:demo_movie/helpers/apis/api_helpers.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class MoviesPlayNowService extends BaseService {
  @override
  Future getResponse() async {
    dynamic responseJson;
    try {
      String _urlWithParameters = moviesBaseUrl + "/3/movie/now_playing?";
      _urlWithParameters += "api_key=" + api_key;
      _urlWithParameters += "&";
      _urlWithParameters += "language=en-US";
      _urlWithParameters += "&";
      _urlWithParameters += "page=1";

      final response = await http.get(Uri.parse(_urlWithParameters));
      responseJson = ApiReturnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}
