import 'package:flutter/material.dart';
import 'package:flutterproject/todo_list/screens/screens.dart';

import 'package:flutterproject/todo_list/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initDb();
  runApp(
      const MyAppUser()
  );
}