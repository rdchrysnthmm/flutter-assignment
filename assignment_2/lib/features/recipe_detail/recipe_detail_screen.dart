import 'package:assignment_2/models/response_recipe.dart';
import 'package:assignment_2/features/recipe_detail/recipe_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/app_bar.dart';

class RecipeDetailPage extends ConsumerWidget {
  final String _keyRecipe;

  const RecipeDetailPage({Key? key, required String keyRecipe})
      : _keyRecipe = keyRecipe,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ResponseRecipe> _state =
        ref.watch(recipeDetailProvider(_keyRecipe));

    return Scaffold(
      appBar: const MyAppBar(
        title: "Masak Apa",
      ),
      body: _state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (exception, stackTrace) {
          return const Center(child: Text("Something went wrong"));
        },
        data: (recipe) {
          return Container(
            width: 500,
            padding: const EdgeInsets.only(bottom: 20),
            margin:
                const EdgeInsets.only(bottom: 15, left: 5, right: 5, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFFFFFBFE),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.network(
                    recipe.results.thumb,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(recipe.results.title,
                        style: const TextStyle(fontSize: 25)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                        recipe.results.servings +
                            " | " +
                            recipe.results.dificulty + " | " +recipe.results.times,
                        style: const TextStyle(fontSize: 18)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 5,left: 10, right: 10),
                    child: Text(
                        recipe.results.desc,
                        style: const TextStyle(fontSize: 18)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Bahan",
                        style: const TextStyle(fontSize: 25)),
                  ),
                  Container(
                    margin:const EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFFFFBFE),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recipe.results.ingredient.length,
                      itemBuilder: (context, index) => Row(
                        children: [Expanded(child:
                          Text(recipe.results.ingredient[index],
                          style: const TextStyle(fontSize: 20),),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text("Cara Membuat",
                        style: const TextStyle(fontSize: 25)),
                  ),
                  Container(
                    margin:
                    const EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFFFFBFE),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recipe.results.step.length,
                      itemBuilder: (context, index) => Row(
                        children: [ Expanded(child: Text(recipe.results.step[index],
                          style: TextStyle(fontSize: 20),))
                          ,
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
