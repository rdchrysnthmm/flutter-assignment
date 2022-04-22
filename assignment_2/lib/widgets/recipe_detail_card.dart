import 'package:assignment_2/models/response_category_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/response_recipe.dart';

class RecipeDetailCard extends StatelessWidget {
  final Results recipe;
  final CategoryDetail detail;
  final bool inFavorites;
  final Function onFavoriteButtonPressed;

  const RecipeDetailCard({
    required this.recipe,
    required this.inFavorites,
    required this.onFavoriteButtonPressed,
    required this.detail});

  @override
  Widget build(BuildContext context) {
    RawMaterialButton _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => null,
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
              recipe.title
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
      onTap: () => print("Tapped!"),
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