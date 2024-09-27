import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_now/Data/app_exceptions.dart';
import 'base_api_services.dart';

class ApiServices implements BaseAPIServices {
  ApiServices._privateConstructor();
  static final ApiServices _instance = ApiServices._privateConstructor();
  factory ApiServices() => _instance;

  dynamic _jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        return jsonDecode(response.body);
      default:
      throw FetchExceptionError();
    }
  }

  @override
  Future getApi (String url) async {
    var jsonData;
    try {
      var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 200));
      jsonData = _jsonResponse(response);
    } on RequestTimeOutException {
      throw RequestTimeOutException();
    } on SocketException {
      throw InternetException();
    }
    print(jsonData);
    return jsonData;
  }
}
