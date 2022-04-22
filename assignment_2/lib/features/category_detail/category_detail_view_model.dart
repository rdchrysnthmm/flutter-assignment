import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/response_category_detail.dart';
import '../../repositories/category _repository/category_repository_provider.dart';
import '../../repositories/category _repository/i_category_repository.dart';

final categoryDetailProvider =
StateNotifierProvider.family.autoDispose<CategoryDetailViewModel,  AsyncValue<ResponseCategoryDetail>,String>((ref, key) {
  var provider = CategoryDetailViewModel(const AsyncLoading(), ref.read(categoryRepositoryProvider));
  provider.getCategoryDetail(key);
  return provider;
});

class CategoryDetailViewModel extends StateNotifier<AsyncValue<ResponseCategoryDetail>> {
  final CategoryRepository _categoryRepository;

  CategoryDetailViewModel(AsyncValue<ResponseCategoryDetail> state, this._categoryRepository)
        : super(state);

  getCategoryDetail(String key) async {
    try {
      state = const AsyncLoading();
      ResponseCategoryDetail result = await _categoryRepository.getCategoryDetail(key);
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}