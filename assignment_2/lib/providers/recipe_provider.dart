import 'package:assignment_2/providers/http_client_provider.dart';
import 'package:riverpod/riverpod.dart';
import '../models/response_recipe.dart';

final recipeDataSourceProvider = Provider<RecipeDataSource>((ref){
  return HttpRecipeDataSource(ref.read(httpClientProvider));
});

abstract class RecipeDataSource{
  Future<ResponseRecipe> getRecipe(String key);
}

class HttpRecipeDataSource implements RecipeDataSource{
  final HttpClient _httpClient;
  final String baseUrl = "https://masak-apa.tomorisakura.vercel.app/api/recipe/";

  HttpRecipeDataSource(this._httpClient);

  @override
  Future<ResponseRecipe> getRecipe(String key) {
    var result = _httpClient.get(Uri.parse("$baseUrl$key"),(data){
      ResponseRecipe rr =ResponseRecipe.fromJson(data);
      return rr;
    });
    return result;
  }

}