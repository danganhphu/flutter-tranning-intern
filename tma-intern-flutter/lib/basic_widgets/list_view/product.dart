import 'package:flutter/material.dart';

import '../../entities/news.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({Key? key}) : super(key: key);
  final String title = "Product";
  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<News> news = [];
  @override
  void initState() {
    super.initState();
    news.add(
      News(
        title: "title 1",
        photo: "thumb1.png",
        description: "Description 1"
      )
    );
    news.add(
        News(
            title: "title 2",
            photo: "thumb2.png",
            description: "Description 2"
        )
    );
    news.add(
        News(
            title: "title 3",
            photo: "thumb3.png",
            description: "Description 3"
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child:  ListView.separated(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.asset("assets/images/${news[index].photo}"),
                title: Text(news[index].title),
                subtitle: Text(news[index].description),
                onTap: () {
                  print(news[index].title);
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: news.length,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         leading: Image.asset("assets/images/${news[index].photo}"),
  //         title: Text(news[index].title),
  //         subtitle: Text(news[index].description),
  //         onTap: () {
  //           print(news[index].title);
  //         },
  //       );
  //     },
  //
  //   );
  // }
}
