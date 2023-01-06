import 'package:flutter/material.dart';

import '../apis/album_apis.dart';
import '../entities/album.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({Key? key}) : super(key: key);
  final String title = "REST API Demo";
  @override
  State<AlbumListPage> createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  List<Album> albums = [];

  bool loading = false;

  @override
  void initState() {
    super.initState();
    AlbumRestAPI albumAPI = AlbumRestAPI();
    albumAPI.fetchAlbum().then((data){
      albums.addAll(data);
      print(data);
      setState(() {
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //widget future
      body: _getBody(),
    );
  }

  Widget _getBody() {
    if (albums.isEmpty || !loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index) {
            var album = albums[index];
            return Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: index % 2 == 0 ? const Color(0xFFDBE2EF) : const Color(0xFF62B6B7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      album.id.toString(),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      album.userId.toString(),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      album.title.toString(),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            );
          }
      );
    }
  }
}



