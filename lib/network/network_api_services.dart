import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../exceptions/exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices implements BaseApiServices {
  @override
  Future getApi({required String? url}) async {
    try {
      dynamic responseJson;
      var response =
          await http.get(Uri.parse(url!)).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    }
  }

  @override
  Future postApi({required String? url, data}) async {
    try {
      dynamic responseJson;
      var response = await http
          .post(body: data, Uri.parse(url!))
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    }
  }

  ///handle status code
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw UnAuthorisedException();
      case 500:
        throw FetchDataException();
      default:
        throw UnAuthorisedException();
    }
  }
}
