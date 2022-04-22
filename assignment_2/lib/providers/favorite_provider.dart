/*
import 'package:assignment_2/models/response_category_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/response_recipe.dart';

List<ResponseRecipe> favorites = [];

final favoriteProvider = Provider<FavoriteDataSource>((ref){
  return FavoriteDataSourceDummy();
});

abstract class FavoriteDataSource{
  Future<ResponseRecipe> toggleFavorite(String title);
}

class FavoriteDataSourceDummy implements FavoriteDataSource{
  @override
  Future<ResponseRecipe> toggleFavorite(String title) {
    List<ResponseRecipe> temp = [...favorites];
    int length = temp.where((element) => element.results?.title?.contains(title)).length;
    int index = temp.indexOf(key);
    if(index == -1){
      temp.add(key);
    }else{
      temp.removeAt(index);
    }
    favorites = temp;
    return Future.delayed(const Duration(milliseconds: 500), () => key);
  }
}*/
