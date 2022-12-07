import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast extends StatelessWidget {
  const MyToast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(onSurface: Colors.lightBlue),
      onPressed: () {
        Fluttertoast.showToast(
            msg: "Short Toast",
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      },
      child: Text('Click me!!'),
    );
  }
}
