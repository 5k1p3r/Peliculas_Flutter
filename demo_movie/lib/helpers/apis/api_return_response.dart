import 'package:demo_movie/helpers/apis/app_exception.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
dynamic ApiReturnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return response.body;
    case 201:
      return response.body;
    case 400:
      throw BadRequestException(
          'Oh no!, Ocurrio un error con su peticion'); //(responseJson['err']['message']);
    case 401:
      throw UnauthorizedException('La Session a caducado!!');
    case 403:
      throw UnauthorizedException(
          'Acceso no autorizado!!'); //(responseJson['err']['message']);
    case 404:
      throw NotFoundException("Recurso no encontrado!");
    case 500:
      throw InternalServerException('Oh no!, Ocurrio un error inesperado');
    case 20201:
      throw InvalidInputException('Oh no!, ocurrio un error inesperado!');
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
