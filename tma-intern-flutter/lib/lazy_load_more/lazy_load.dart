import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LazyLoadMorePage extends StatelessWidget {
  const LazyLoadMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LazyLoadMore',
      debugShowCheckedModeBanner: false,
      home: LazyLoadMore(),
    );
  }
}


class LazyLoadMore extends StatefulWidget {
  const LazyLoadMore({Key? key}) : super(key: key);

  @override
  State<LazyLoadMore> createState() => _LazyLoadMoreState();
}

class _LazyLoadMoreState extends State<LazyLoadMore> {
  late List list;
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 15;
  @override
  void initState() {
    super.initState();
    list = List.generate(_currentMax, (index) => "Item: ${index + 1}");
    //lắng nghe sự kiện load
    _scrollController.addListener(() async {
      //load đến item cuối cùng
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print('Load more data');
        for (int i = _currentMax; i < _currentMax + 15; i++) {
          list.add('Item: ${i + 1}');
        }
      }
    });
    _currentMax = _currentMax + 15;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example lazy load more"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: list.length + 1,
        itemBuilder: (context,index) {
          if  (index == list.length) {
            return const CupertinoActivityIndicator();
          }
          return ListTile(
            title: Text(list[index]),
          );
        },
      ),
    );
  }
}
