import 'package:assignment_2/features/category_list/category_list_screen.dart';
import 'package:assignment_2/features/category_list/category_list_view_model.dart';
import 'package:assignment_2/models/response_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../view_model/category_list_view_model_test.dart';

void main() {
  final MockCategoryRepository mockCategoryRepository =
      MockCategoryRepository();

  testWidgets("initial load category list screen", (tester) async {
    await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
      home: CategoriesPage(),
    )));
    expect(find.byType(CategoriesPage), findsOneWidget);
  });

  testWidgets("category list screen correct data flow", (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          categoryListProvider.overrideWithProvider(StateNotifierProvider<
                CategoryListViewModel, AsyncValue<ResponseCategory>>((ref) {
            var viewModel =  CategoryListViewModel( const AsyncLoading(), mockCategoryRepository);
            viewModel.loadData();
            return viewModel;
          }))
        ],
        child: const MaterialApp(
          home: CategoriesPage(),
        ),
      ));
    });

    //to do
    await tester.pump(const Duration(milliseconds: 500));
  });
}
