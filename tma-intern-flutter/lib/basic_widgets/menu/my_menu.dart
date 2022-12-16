import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Menu"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              var menus = <PopupMenuEntry<Object>>[];
              menus.add(
                const PopupMenuItem(
                  value: 1,
                  child: Text("Menu 1"),
                ),
              );
              menus.add(
                  const PopupMenuDivider(
                    height: 10,
                  )
              );
              menus.add(
                PopupMenuItem(
                  value: 2,
                  child: ListTile(
                    leading: Icon(Icons.save),
                    title: Text("Menu 2"),
                    onTap: () {
                      print("tesst");
                    },
                  ),
                ),
              );
              menus.add(
                  const PopupMenuDivider(
                    height: 10,
                  )
              );
              menus.add(
                PopupMenuItem(
                  value: 3,
                  child: PopupMenuButton(
                    child: Text("Menu 3"),
                    itemBuilder: (context) {
                      var subMenus = <PopupMenuEntry<Object>>[];

                      subMenus.add(
                        PopupMenuItem(
                          value: 4,
                          child: Text("Menu 3.1"),
                        ),
                      );
                      subMenus.add(
                        PopupMenuItem(
                          value: 5,
                          child: Text("Menu 3.2"),
                        ),
                      );

                      return subMenus;
                    },
                  ),
                ),
              );

              return menus;
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
