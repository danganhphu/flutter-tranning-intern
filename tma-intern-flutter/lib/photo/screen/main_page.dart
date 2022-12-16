import 'package:flutter/material.dart';
import 'package:flutterproject/photo/screen/photo_page.dart';

class PhotoMainPage extends StatelessWidget {
  const PhotoMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo REST API',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const PhotoPage(),
    );
  }
}
