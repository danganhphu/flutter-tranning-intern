import 'package:flutter/material.dart';

import '../../entities/mobile.dart';
import '../../entities/news.dart';

class MyDataTable extends StatefulWidget {
  const MyDataTable({Key? key}) : super(key: key);

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
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
    return DataTable(
      columns: const [
        DataColumn(
          label: Text("Name"),
        ),
        DataColumn(
          label: Text("photo"),
        ),
        DataColumn(
          label: Text("Description"),
        ),
        DataColumn(
          label: Text("Price"),
        ),
      ],
      rows: mobiles.map((mobile) => DataRow(
        cells: [
          DataCell(
              Text(mobile.name),
            onTap: () {
                print(mobile.name);
            }
          ),
          DataCell(
              Image.asset(
                "assets/images/${mobile.photo}",
                width: 40,
                height: 40,
              ),
              onTap: () {
                print(mobile.photo);
              }
          ),
          DataCell(
              Text(mobile.description),
              onTap: () {
                print(mobile.description);
              }
          ),
          DataCell(
              Text(mobile.price.toString()),
              onTap: () {
                print(mobile.price );
              }
          ),
        ]
      )).toList(),
    );
  }
}
