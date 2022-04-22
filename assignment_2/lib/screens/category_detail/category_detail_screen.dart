import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/response_category_detail.dart';
import '../../providers/favorite_provider.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/recipe_card.dart';
import 'category_detail_provider.dart';

class CategoryDetailPage extends ConsumerWidget {
  final String _index;

  const CategoryDetailPage({Key? key, required String index}) : _index = index, super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ResponseCategoryDetail> _state = ref.watch(categoryDetailProvider(_index));

    return Scaffold(
        appBar: const MyAppBar(title: "Masak Apa",),
        body: _state.when(
          loading: () => Center(child: const CircularProgressIndicator()),
          error: (exception, stackTrace) {
            return const Center(child: Text("Something went wrong"));
          },
          data: (details) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: details.results.length,
              itemBuilder: (BuildContext context, int index) {
                return RecipeCard(recipe: details.results[index],
                    inFavorites: false,
                    onFavoriteButtonPressed: () => null );
              },
            );
          },
        ));
  }
}