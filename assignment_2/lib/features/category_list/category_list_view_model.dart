import 'package:assignment_2/models/response_category.dart';
import 'package:assignment_2/repositories/category%20_repository/category_repository_provider.dart';
import 'package:assignment_2/repositories/category%20_repository/i_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryListProvider =
StateNotifierProvider<CategoryListViewModel, AsyncValue<ResponseCategory>>((ref) {
  var provider = CategoryListViewModel(const AsyncLoading(), ref.read(categoryRepositoryProvider));
  provider.loadData();
  return provider;
});

class CategoryListViewModel extends StateNotifier<AsyncValue<ResponseCategory>> {
  final CategoryRepository _categoryRepository;

  CategoryListViewModel(AsyncValue<ResponseCategory> state, this._categoryRepository):
        super(state);

  loadData() async {
    try {
      state = const AsyncLoading();
      ResponseCategory result = await _categoryRepository.getCategory();
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}