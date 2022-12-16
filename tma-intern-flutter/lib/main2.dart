import 'package:flutter/material.dart';

import 'entities/contact.dart';
import 'main.dart';

class Main2 extends StatelessWidget {
  String? id;
  int? age;
  Contact? contact;
  Main2({Key? key, this.id, this.age, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("id: ${this.id}");
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Main 2"),
        ),
        body: Page11(
          id: id,
          age: age,
          contact: contact
        ),
      ),
    );
  }
}

class Page11 extends StatelessWidget {
  String? id;
  int? age;
  Contact? contact;
  Page11({Key? key, this.id, this.age, this.contact}) : super(key: key);
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87, backgroundColor: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(this.id.toString()),
        Text(this.age.toString()),
        Text(this.contact!.name),
        ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => MyApp()
            ));
          },

          child: Text("Back"),
        ),

      ],
    );
  }
}