import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../entities/album.dart';
class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);
  final String title = "REST API Demo";
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //widget future
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            print(snapshot.error);
          return snapshot.hasData ? AlbumList(albums: snapshot.data) : Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}

class AlbumList extends StatelessWidget {
  AlbumList({Key? key, required this.albums,}) : super(key: key);
  List<Album> albums = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            color: index % 2 == 0 ? Colors.lightBlue : Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  albums[index].id.toString(),
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  albums[index].userId.toString(),
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  albums[index].title.toString(),
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          onTap: () {}
        );
      }
    );
  }
}

