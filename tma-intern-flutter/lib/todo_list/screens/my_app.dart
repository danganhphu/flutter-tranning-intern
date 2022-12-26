import 'package:flutter/material.dart';
import 'package:flutterproject/todo_list/screens/user_page.dart';

class MyAppUser extends StatelessWidget {
  const MyAppUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyUserPage(),
    );
  }
}
