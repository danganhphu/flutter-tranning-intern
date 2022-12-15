import 'package:flutter/material.dart';

import '../apis/album_apis.dart';
import '../entities/album.dart';
import 'album_list.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);
  final String title = "REST API Demo";
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<List<Album>> albums;

  // @override
  // void initState() {
  //   super.initState();
  //   print('một');
  //  var albums = AlbumRestAPI().fetchAlbum();
  //   print('hai');
  //  // try {
  //  //   var albums = AlbumRestAPI().fetchAlbum();
  //  // }catch (err) {
  //  //
  //  // }
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    var albumAPI = AlbumRestAPI();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //widget future
      body: FutureBuilder<List<Album>>(
        future: albumAPI.fetchAlbum(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
          }
          return snapshot.hasData ? AlbumList(albums: snapshot.data) : const Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}



