import 'package:flutter/material.dart';
import '../features//category_detail/category_detail_screen.dart';
import '../features//category_list/category_list_screen.dart';
import '../features//recipe_detail/recipe_detail_screen.dart';

class MyRoutes {
  static const String HOME_SCREEN = "/";
  static const String CATEGORY_LIST = "/categoryList";
  static const String CATEGORY_DETAIL = "/categoryDetail";
  static const String RECIPE_DETAIL = "/recipeDetail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => CategoriesPage(), settings: settings);
      case CATEGORY_LIST:
        return MaterialPageRoute(builder: (_) => CategoriesPage(), settings: settings);
      case CATEGORY_DETAIL:
        String index = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CategoryDetailPage(index: index));
      case RECIPE_DETAIL:
        String index = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => RecipeDetailPage(keyRecipe: index));
      default:
        return MaterialPageRoute(builder: (_) => CategoriesPage(), settings: settings);
    }
  }
}