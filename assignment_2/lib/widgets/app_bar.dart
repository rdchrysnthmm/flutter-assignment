import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  const MyAppBar({
    Key? key, String title = "Masak Apa"
  }) : _title = title, super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title, style: const TextStyle(fontSize: 30),),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.green,
                  Colors.blue
                ])
        ),
      ),);
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}