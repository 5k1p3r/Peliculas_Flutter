class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class NotFoundException extends AppException {
  NotFoundException([message]) : super(message, "Not found: ");
}

class InternalServerException extends AppException {
  InternalServerException([message]) : super(message, "Internal Server: ");
}

class AnUnexpectedException extends AppException {
  AnUnexpectedException([message])
      : super(message, "an unexpected error occurred");
}
