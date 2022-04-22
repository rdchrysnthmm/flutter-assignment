import 'package:assignment_2/features/category_list/category_list_view_model.dart';
import 'package:assignment_2/models/response_category.dart';
import 'package:assignment_2/repositories/category%20_repository/category_repository_provider.dart';
import 'package:assignment_2/repositories/category%20_repository/i_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock_api_response.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  final MockCategoryRepository mockCategoryRepository = MockCategoryRepository();

  setUp(() {
    when(() => mockCategoryRepository.getCategory()).thenAnswer(
        (invocation) => Future.delayed(Duration(milliseconds: 300), () => mockGetCategory));
  });
  
  test("CategoryListViewModel should have correct flow and data", () async {
    final container = ProviderContainer(
      overrides:[
        categoryRepositoryProvider.overrideWithValue(mockCategoryRepository)
      ]
    );
    
    final viewModel = container.listen(categoryListProvider, (previous, next) { });

    expect(viewModel.read(), const TypeMatcher<AsyncLoading<ResponseCategory>>());
    await Future.delayed(const Duration(milliseconds: 500));
    expect(viewModel.read(), const TypeMatcher<AsyncData<ResponseCategory>>());
    expect(viewModel.read().value!.results[1].key == mockGetCategory.results[1].key, true);
  });
}
