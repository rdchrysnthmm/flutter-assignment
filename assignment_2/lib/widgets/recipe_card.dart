import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../commons/routes.dart';
import '../models/response_category_detail.dart';

class RecipeCard extends StatelessWidget {
  final CategoryDetail recipe;
  final bool inFavorites;
  final Function onFavoriteButtonPressed;

  const RecipeCard(
      {required this.recipe,
        required this.inFavorites,
        required this.onFavoriteButtonPressed});

  @override
  Widget build(BuildContext context) {

    RawMaterialButton _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => onFavoriteButtonPressed(recipe.key),
        child: Icon(
          inFavorites == true ? Icons.favorite : Icons.favorite_border,
        ),
        elevation: 2.0,
        fillColor: Colors.white,
        shape: const CircleBorder(),
      );
    }

    Padding _buildTitleSection() {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              recipe.title,
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(Icons.timer, size: 20.0),
                const SizedBox(width: 5.0),
                Text(
                  recipe.times.toString(),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, MyRoutes.RECIPE_DETAIL,
           arguments: recipe.key)},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: Image.network(
                      recipe.thumb,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: _buildFavoriteButton(),
                    top: 2.0,
                    right: 2.0,
                  ),
                ],
              ),
              _buildTitleSection(),
            ],
          ),
        ),
      ),
    );
  }
}