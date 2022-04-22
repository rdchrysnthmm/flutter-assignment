import 'package:assignment_2/models/response_recipe.dart';
import 'package:assignment_2/providers/recipe_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recipeDetailProvider =
StateNotifierProvider.family.autoDispose<RecipeDetail,  AsyncValue<ResponseRecipe>,String>((ref, key) {
  var provider = RecipeDetail(const AsyncLoading(), ref.read(recipeDataSourceProvider));
  provider.getRecipeDetail(key);
  return provider;
});

class RecipeDetail extends StateNotifier<AsyncValue<ResponseRecipe>>{
  final RecipeDataSource _recipeDataSource;

  RecipeDetail(AsyncValue<ResponseRecipe> state, RecipeDataSource recipeDataSource)
      : _recipeDataSource = recipeDataSource,
        super(state);

  getRecipeDetail(String key) async {
    try {
      state = const AsyncLoading();
      ResponseRecipe result = await _recipeDataSource.getRecipe(key);
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}