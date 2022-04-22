import '../../models/response_category.dart';
import '../../models/response_category_detail.dart';

abstract class CategoryRepository{
  Future<ResponseCategory> getCategory();
  Future<ResponseCategoryDetail> getCategoryDetail(String key);
}