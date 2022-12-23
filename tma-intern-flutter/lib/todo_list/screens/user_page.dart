import 'package:flutter/material.dart';
import 'package:flutterproject/todo_list/bloc/user_bloc.dart';
import 'package:flutterproject/todo_list/screens/user_header.dart';
import 'package:flutterproject/todo_list/screens/user_list.dart';
import 'package:provider/provider.dart';

class MyUserPage extends StatelessWidget {
  const MyUserPage({Key? key}) : super(key: key);
  final String title = 'SQLite demo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
      ),
      body: Provider<UserBloc>.value(
        value: UserBloc(),
        child: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                UserHeader(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                UserList()
              ],
            ),
          ),
        )
      ),
    );
  }
}
