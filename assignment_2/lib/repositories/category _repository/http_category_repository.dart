import 'package:assignment_2/models/response_category.dart';
import 'package:assignment_2/models/response_category_detail.dart';
import 'package:assignment_2/providers/http_client_provider.dart';
import 'i_category_repository.dart';

class HttpCategoryRepository implements CategoryRepository{
  final HttpClient _httpClient;
  final String baseUrl = "https://masak-apa.tomorisakura.vercel.app/api/categorys/recipes/";

  HttpCategoryRepository(this._httpClient);

  @override
  Future<ResponseCategory> getCategory()  async {
    var result = _httpClient.get(Uri.parse(baseUrl),(data){
      ResponseCategory rc = ResponseCategory.fromJson(data);
      return rc;
    });
    return result;
  }

  @override
  Future<ResponseCategoryDetail> getCategoryDetail(String key) {
    var result = _httpClient.get(Uri.parse("$baseUrl$key"),(data){
      ResponseCategoryDetail rcd = ResponseCategoryDetail.fromJson(data);
      return rcd;
    });
    return result;
  }
}