import 'package:flutter/material.dart';

Future<String> showMyDialog(BuildContext context) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.warning,
              color: Colors.yellow,
              size: 80
            ),
            Text('Cảnh báo'),
          ],
        ),
        content: const Text(
          'Bạn có chắc muốn xóa?',
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('ok');
                },
                child: const Text('Ok'),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('cancle');
                },
                child: const Text('Cancle'),
              ),
            ],
          ),
        ],
      );
    }
  );
}