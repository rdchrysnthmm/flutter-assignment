import 'package:assignment_1/home.dart';
import 'package:assignment_1/list.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/detail",
      routes: <String, WidgetBuilder>{
        "/": (context) => const HomePage(),
        "/list": (context) => ListPage(),
        "/detail": (context) => const DetailPage(),
      },
    );
  }
}
