import 'package:flutter/material.dart';
import 'package:flutterproject/basic_widgets/data_table/my_data_table.dart';
import 'package:flutterproject/basic_widgets/list_view/product.dart';
import 'package:flutterproject/basic_widgets/menu/my_menu.dart';
import 'package:flutterproject/basic_widgets/text_form_field/my_textFormField.dart';
import 'package:flutterproject/basic_widgets/toast/my_toast.dart';
import 'package:flutterproject/provider_state/main_page.dart';
import '../basic_widgets/dialog/my_dialog.dart';
import '../basic_widgets/grid_view/my_grid_view.dart';
import '../album/album_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget builButton(BuildContext context, {required String title, required Widget description}) =>  SizedBox(
    width: 250,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6.0),
          backgroundColor: Colors.teal,
        textStyle: const TextStyle(fontSize: 24)
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => description));
      }, child: Text(title),
    ),

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Exercisess Flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 5),
            builButton(context, title: "Dialog", description: const MyDialog()),
            const SizedBox(height: 5),
            builButton(context, title: "TextFormField", description: const MyFeild()),
            const SizedBox(height: 5),
            builButton(context, title: "DataTable", description: const MyDataTable()),
            const SizedBox(height: 5),
            builButton(context, title: "MyMenu", description: const MyMenu()),
            const SizedBox(height: 5),
            builButton(context, title: "Toast", description: const MyToast()),
            const SizedBox(height: 5),
            builButton(context, title: "ListView Product", description: const MyProduct()),
            const SizedBox(height: 5),
            builButton(context, title: "GridView", description: const MyGridView()),
            const SizedBox(height: 5),
            builButton(context, title: "Product CRUD", description: const MainPageProduct()),
            const SizedBox(height: 5),
            builButton(context, title: "REST API", description: const AlbumPage())
          ],
        ),
      ),
    );
  }
}
