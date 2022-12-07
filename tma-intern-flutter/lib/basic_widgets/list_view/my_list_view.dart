import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset("assets/images/thumb1.png"),
          title: Text("Title 1"),
          subtitle: Text("Description 1"),
          onTap: () {
            print("List title 1");
          },
        ),
        ListTile(
          leading: Image.asset("assets/images/thumb2.png"),
          title: Text("Title 2"),
          subtitle: Text("Description 2"),
        ),
        ListTile(
          leading: Image.asset("assets/images/thumb3.png"),
          title: Text("Title 3"),
          subtitle: Text("Description 3"),
        ),
      ],
    );
  }
}
