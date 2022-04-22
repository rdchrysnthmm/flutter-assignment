import '../../models/response_recipe.dart';

abstract class RecipeRepository{
  Future<ResponseRecipe> getRecipe(String key);
}