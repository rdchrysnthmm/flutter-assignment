import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/response_category_detail.dart';
import '../../providers/category_provider.dart';

final categoryDetailProvider =
StateNotifierProvider.family.autoDispose<CategoryDetail,  AsyncValue<ResponseCategoryDetail>,String>((ref, key) {
  var provider = CategoryDetail(const AsyncLoading(), ref.read(categoryDataSourceProvider));
  provider.getCategoryDetail(key);
  return provider;
});

class CategoryDetail extends StateNotifier<AsyncValue<ResponseCategoryDetail>> {
  final CategoryDataSource _categoryDataSource;

  CategoryDetail(AsyncValue<ResponseCategoryDetail> state, CategoryDataSource categoryDataSource)
      : _categoryDataSource = categoryDataSource,
        super(state);

  getCategoryDetail(String key) async {
    try {
      state = const AsyncLoading();
      ResponseCategoryDetail result = await _categoryDataSource.getCategoryDetail(key);
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}