
import 'package:assignment_2/models/response_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/category_provider.dart';

final categoryListProvider =
StateNotifierProvider<CategoryList, AsyncValue<ResponseCategory>>((ref) {
  var provider = CategoryList(const AsyncLoading(), ref.read(categoryDataSourceProvider));
  provider.loadData();
  return provider;
});

class CategoryList extends StateNotifier<AsyncValue<ResponseCategory>> {
  final CategoryDataSource _categoryDataSource;

  CategoryList(AsyncValue<ResponseCategory> state, CategoryDataSource categoryDataSource)
      : _categoryDataSource = categoryDataSource,
        super(state);

  loadData() async {
    try {
      state = const AsyncLoading();
      ResponseCategory result = await _categoryDataSource.getCategory();
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}