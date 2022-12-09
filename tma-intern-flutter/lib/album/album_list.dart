import 'package:flutter/material.dart';

import '../entities/album.dart';

class AlbumList extends StatelessWidget {
  List<Album> albums;
  AlbumList({Key? key, required this.albums,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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