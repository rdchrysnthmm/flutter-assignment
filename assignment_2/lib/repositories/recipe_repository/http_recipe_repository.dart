import 'package:assignment_2/providers/http_client_provider.dart';
import '../../models/response_recipe.dart';
import 'i_recipe_repository.dart';

class HttpRecipeDataRepository implements RecipeRepository{
  final HttpClient _httpClient;
  final String baseUrl = "https://masak-apa.tomorisakura.vercel.app/api/recipe/";

  HttpRecipeDataRepository(this._httpClient);

  @override
  Future<ResponseRecipe> getRecipe(String key) {
    var result = _httpClient.get(Uri.parse("$baseUrl$key"),(data){
      ResponseRecipe rr =ResponseRecipe.fromJson(data);
      return rr;
    });
    return result;
  }

}