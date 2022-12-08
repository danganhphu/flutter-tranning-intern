import 'package:flutter/material.dart';

import '../../entities/mobile.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);
  final String title = "Demo girdview";
  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  List<Mobile> mobiles = [];

  @override
  void initState() {
    super.initState();
    mobiles.add(
      Mobile(name: "Mobile 1", photo: "mobile1.jpg", description: "Description 1", price: 7.7)
    );
    mobiles.add(
        Mobile(name: "Mobile 2", photo: "mobile2.jpg", description: "Description 2", price: 8.7)
    );
    mobiles.add(
        Mobile(name: "Mobile 3", photo: "mobile3.jpg", description: "Description 3", price: 5.8)
    );
    mobiles.add(
        Mobile(name: "Mobile 4", photo: "mobile4.jpg", description: "Description 4", price: 12.3)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: mobiles.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/${mobiles[index].photo}",
                    width: 70,
                    height: 70,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  ),
                  Text(mobiles[index].name),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  ),
                  Text(mobiles[index].description),
                ],
              ),
            ),
            onTap: () {
              print(mobiles[index].name);
            },
          );

        },
      ),
    );
  }
}
