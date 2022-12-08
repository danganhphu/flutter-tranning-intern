import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../entities/album.dart';

//lấy dữ liệu từ REST API
Future<List<Album>> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  List<Album> albums ;
  if (response.statusCode == 200) {
    var list = json.decode(response.body) as List;
    albums = list.map((item) => Album.fromJson(item)).toList();
    return albums;
  } else {
    throw Exception('Failed to load album');
  }
}
class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);
  final String title = "REST API Demo";
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<List<Album>> albums;

  @override
  void initState() {
    super.initState();
    albums = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //widget future
      body: FutureBuilder<List<Album>>(
        future: albums,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData ? AlbumList(albums: snapshot.data) : Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}

class AlbumList extends StatelessWidget {
  List<Album> albums;
  AlbumList({Key? key, required this.albums,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(10),
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

