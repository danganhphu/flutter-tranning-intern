import 'package:flutter/material.dart';
import 'package:flutterproject/basic_widgets/data_table/my_data_table.dart';
import 'package:flutterproject/basic_widgets/dialog/my_dialog.dart';
import 'package:flutterproject/basic_widgets/grid_view/my_grid_view.dart';
import 'package:flutterproject/basic_widgets/list_view/my_list_view.dart';
import 'package:flutterproject/basic_widgets/menu/my_menu.dart';
import 'package:flutterproject/basic_widgets/text_form_field/my_textFormField.dart';
import 'package:flutterproject/basic_widgets/toast/my_toast.dart';

import 'basic_widgets/list_view/product.dart';
import 'entities/contact.dart';
import 'main2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Section"),
          // actions: [
          //   PopupMenuButton(
          //     itemBuilder: (context) => [
          //       const PopupMenuItem(
          //         value: 1,
          //         child: ListTile(
          //           leading: Icon(Icons.save),
          //           title: Text("Menu 1"),
          //         ),
          //       ),
          //       const PopupMenuItem(
          //         child: Text("Menu 2"),
          //         value: 2,
          //       ),
          //       const PopupMenuItem(
          //         child: Text("Menu 3"),
          //         value: 3,
          //       ),
          //     ],
          //     onSelected: (int menu) {
          //       print(menu);
          //     },
          //   ),
          // ],
        ),
        body: const MyFeild(),
      ),
    );
  }
}

class Page10 extends StatelessWidget {
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
        ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {
            var contact = Contact(
                name: "dcgang",
                phone: "12345",
                address: "bd"
            );
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Main2(
                id: "phu01",
                age: 21,
                contact: contact,
              )
            ));
          },

          child: Text("Click me"),
        ),

      ],
    );
  }
}


class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("Hello World!");
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Text("Hello"),
      // padding: EdgeInsets.all(150),
      padding: EdgeInsets.only(top: 10, left: 50),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text("Hello"),
      alignment: Alignment.bottomCenter,
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("h4"),
            Text("h2"),
            Text("h3"),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 50, bottom: 100)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("h4"),
            Text("h5"),
            Text("h6"),
          ],
        )
      ],
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.tiktok, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Image.asset("assets/images/crip.jpg")
      ],
    );
  }
}

class Page6 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black87, backgroundColor: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.black87, minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {
            print("press");
          },
          child: Text('Looks like a RaisedButton'),
        ),
        TextButton(
          style: flatButtonStyle,
          onPressed: () {
            print("oke");
          },
          child: Text('Looks '),
        ),
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            print("icon");
          }
        )

      ],
    );
  }
}

class Page7 extends StatelessWidget {
  String message = "abc";
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
    return Column(
      children: [
        Text(message),
        ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {
            message = "def";
          },
          child: Text("change"),
        ),
      ],
    );
  }
}

class Page8 extends StatefulWidget {
  String username = "phu";
  @override
  State<StatefulWidget> createState() {
    return Page8Sate();
  }
}
class Page8Sate extends State<Page8> {
  String message = "abc";
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
    return Column(
      children: [
        Text(message),
        ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {
            setState(() {
              message = widget.username;
            });
          },
          child: Text("change"),
        ),
      ],
    );
  }

}

class Page9 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Page9Sate();
  }
}
class Page9Sate extends State<Page9> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87, backgroundColor: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text("+"),
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              child: Text("-"),
            ),
          ],
        ),
      ],
    );
  }

}