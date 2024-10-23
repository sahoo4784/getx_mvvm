class AppExceptions implements Exception {
  final _message, _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message $_prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, 'Please check your internet connection');
}

class UnAuthorisedException extends AppExceptions {
  UnAuthorisedException([String? message])
      : super(message, 'Unauthorised! please contact admin');
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super(message, 'Oops! Request timed out');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Oops! Error while fetching data from server');
}
