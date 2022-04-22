import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

final httpClientProvider = Provider<HttpClient>((ref){
  return HttpClient(http.Client());
});

class HttpClient{
  final http.Client _httpClient;

  HttpClient(this._httpClient);

  Future<T> get<T>(Uri uri, T Function (dynamic data) builder) async {
    try {
      var response = await _httpClient.get(uri);
      return builder(_responseBuilder(response));
    } on SocketException {
      throw Exception("No Internet Connection");
    }
  }

  Future<T> put<T>(Uri uri, T Function (dynamic data) builder, Map<String, dynamic> body) async {
    try {
      var response = await _httpClient.put(uri, body:body);
      return builder(_responseBuilder(response));
    } on SocketException {
      throw Exception("No Internet Connection");
    }
  }

  dynamic _responseBuilder(http.Response response){
    switch(response.statusCode){
      case 200:
        return json.decode(response.body);
      case 400:
        throw Exception("Bad Request: "+ response.body);
      case 401:
      case 403:
        throw Exception("Unauthorized: "+ response.body);
      case 404:
        throw Exception("Not Found");
      case 500:
      default:
        throw Exception("Something went wrong");
    }
  }
}