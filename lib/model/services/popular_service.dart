import 'dart:convert';
import 'dart:io';

import 'package:movie_app/core/app_exception.dart';
import 'package:movie_app/core/base_service.dart';
import 'package:http/http.dart' as http;

class PopularService extends BaseService {
  dynamic responseJson;
  @override
  Future getResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url + apiKey));
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("Internet Error");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 401:
        throw BadRequestException(response.statusCode.toString());

      default:
        throw Exception(response.statusCode.toString());
    }
  }
}
