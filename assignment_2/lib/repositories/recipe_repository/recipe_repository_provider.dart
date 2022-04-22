import 'package:assignment_2/providers/http_client_provider.dart';
import 'package:assignment_2/repositories/recipe_repository/i_recipe_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'http_recipe_repository.dart';

final recipeRepositoryProvider = Provider<RecipeRepository>((ref){
  return HttpRecipeDataRepository(ref.read(httpClientProvider));
});