import 'package:assignment_2/models/response_recipe.dart';
import 'package:assignment_2/repositories/recipe_repository/i_recipe_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/recipe_repository/recipe_repository_provider.dart';

final recipeDetailProvider =
StateNotifierProvider.family.autoDispose<RecipeDetailViewModel,  AsyncValue<ResponseRecipe>,String>((ref, key) {
  var provider = RecipeDetailViewModel(const AsyncLoading(), ref.read(recipeRepositoryProvider));
  provider.getRecipeDetail(key);
  return provider;
});

class RecipeDetailViewModel extends StateNotifier<AsyncValue<ResponseRecipe>>{
  final RecipeRepository _recipeRepository;

  RecipeDetailViewModel(AsyncValue<ResponseRecipe> state, this._recipeRepository):
        super(state);

  getRecipeDetail(String key) async {
    try {
      state = const AsyncLoading();
      ResponseRecipe result = await _recipeRepository.getRecipe(key);
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}