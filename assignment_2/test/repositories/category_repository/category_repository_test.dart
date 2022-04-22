import 'dart:convert';
import 'package:assignment_2/models/response_category.dart';
import 'package:assignment_2/providers/http_client_provider.dart';
import 'package:assignment_2/repositories/category%20_repository/category_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../mock/mock_api_response.dart';

class MockHttpClient extends Mock implements http.Client {

}

void main(){
  final MockHttpClient mockHttpClient = MockHttpClient();
  const String baseUrl ="https://masak-apa.tomorisakura.vercel.app/api/categorys/recipes/";

  setUp(() {
    when(() => mockHttpClient.get(Uri.parse(baseUrl))).thenAnswer(
        (invocation) => Future.delayed(const Duration(milliseconds: 500),
            () => http.Response(mockApiCategoryListResponseStr,200)));
  });
  
  test("get category list response should return correct object",() async {
    var container =ProviderContainer(overrides: [
      httpClientProvider.overrideWithValue(HttpClient(mockHttpClient))
    ]);

    ResponseCategory result = await container.read(categoryRepositoryProvider).getCategory();
    if (kDebugMode) {
      print(result);
      print(result.results.length);
      print(mockApiCategoryListResponse);
    }
    expect(result.results.length == ResponseCategory.fromJson(mockApiCategoryListResponse).results.length, true);
    expect(result.results[1].key == ResponseCategory.fromJson(mockApiCategoryListResponse).results[1].key, true);
    expect(result.results[3].category == ResponseCategory.fromJson(mockApiCategoryListResponse).results[3].category, true);
  });
}
