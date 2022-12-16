import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyDialog"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Information"),
                      content: Text("Done"),
                      actions: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Oke'),
                        ),
                      ],
                    );
                  }
              );
            },
            child: Text("Info dialog"),

          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirm"),
                      content: Text("Are you sure?"),
                      actions: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Oke'),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  }
              );
            },
            child: Text("confirm dialog"),

          ),
        ],
      ),
    );
  }
}
