import 'package:assignment_2/providers/http_client_provider.dart';
import 'package:assignment_2/repositories/category%20_repository/http_category_repository.dart';
import 'package:assignment_2/repositories/category%20_repository/i_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

 final categoryRepositoryProvider = Provider<CategoryRepository>((ref){
  return HttpCategoryRepository(ref.read(httpClientProvider));
});