import 'package:assignment_2/commons/routes.dart';
import 'package:assignment_2/models/response_category.dart';
import 'package:assignment_2/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'category_list_view_model.dart';

class CategoriesPage extends ConsumerWidget{
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ResponseCategory> _state = ref.watch(categoryListProvider);

    return Scaffold(
      appBar: MyAppBar(title: "Masak Apa",),
      body: _state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (exception, stackTrace) {
          return const Center(child: Text("Something went wrong"));
        },
        data: (categories){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: categories.results.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 62,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.only(
                    bottom: 15,
                    left: 5,
                    right: 5,
                    top: index == 0 ? 10 : 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFFFFBFE),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.pushNamed(context, MyRoutes.CATEGORY_DETAIL,
                        arguments: categories.results[index].key)
                        .then((value) =>
                        ref.read(categoryListProvider.notifier).loadData())
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categories.results[index].category,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              );
            });
        },
      ),
    );
  }
}