import 'package:flutter/material.dart';

void main() => runApp(const MyPopupMenuApp());

enum ItemMenu {menu1, menu2, menu3, menu4, menu5, menu6}

class MyPopupMenuApp extends StatelessWidget {
  const MyPopupMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PopupMenuExample(),
    );
  }
}


class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({Key? key}) : super(key: key);
  final String title = 'Example Popup Menu';
  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  ItemMenu? selectedItemMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: PopupMenuButton<ItemMenu>(
          initialValue: selectedItemMenu,
          onSelected: (ItemMenu item){
            setState(() {
              selectedItemMenu = item;
              print(item);
            });
          },
          itemBuilder: (context) => <PopupMenuEntry<ItemMenu>>[
            const PopupMenuItem<ItemMenu>(
              value: ItemMenu.menu1,
              child: Text('Item 1'),
            ),
            const PopupMenuItem<ItemMenu>(
              value: ItemMenu.menu2,
              child: Text('Item 2'),
            ),
            const PopupMenuItem<ItemMenu>(
              value: ItemMenu.menu3,
              child: Text('Item 3'),
            ),
            const PopupMenuItem<ItemMenu>(
              value: ItemMenu.menu4,
              child: Text('Item 4'),
            ),
            const PopupMenuItem<ItemMenu>(
              value: ItemMenu.menu5,
              child: Text('Item 5'),
            ),
            const PopupMenuItem<ItemMenu>(
              value: ItemMenu.menu6,
              child: Text('Item 6'),
            ),
          ],
        ),
      ),
    );
  }
}
