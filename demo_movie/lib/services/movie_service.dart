import 'package:demo_movie/helpers/apis/api_helpers.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class MovieService extends BaseService {
  @override
  Future getResponse() async {
    dynamic responseJson;
    try {
      String _urlWithParameters = moviesBaseUrl + "/3/discover/movie?";
      _urlWithParameters += "api_key=" + api_key;
      _urlWithParameters += "&";
      _urlWithParameters += "language=en-US";
      _urlWithParameters += "&";
      _urlWithParameters += "page=1";
      _urlWithParameters += "&";
      _urlWithParameters += "sort_by=popularity.desc";
      _urlWithParameters += "&";
      _urlWithParameters += "include_adult=false";
      _urlWithParameters += "&";
      _urlWithParameters += "include_video=false";
      _urlWithParameters += "&";
      _urlWithParameters += "with_watch_monetization_types=flatrate";

      final response = await http.get(Uri.parse(_urlWithParameters));
      responseJson = ApiReturnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}
