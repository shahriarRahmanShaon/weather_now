class AppExceptions implements Exception {
  final String? _prefix;
  final String? _message;

  AppExceptions([this._prefix, this._message]);

  @override
  String toString() {
    return '$_prefix: $_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message])
      : super('Internet Error Issues', message);
}

class RequestTimeoutException extends AppExceptions {
  RequestTimeoutException([String? message])
      : super('Request Timeout', message ?? 'The request has timed out');
}

class ServerErrorException extends AppExceptions {
  ServerErrorException([String? message])
      : super('Server Error', message ?? 'An internal server error occurred');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message])
      : super('serverError', message ?? 'The URL provided in invalid');
}

class FetchExceptionError extends AppExceptions {
  FetchExceptionError([String? message])
      : super('fetchError', message ?? "Failed to fetch data from the server");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super('Request time out', message ?? "Operation took too long");
}