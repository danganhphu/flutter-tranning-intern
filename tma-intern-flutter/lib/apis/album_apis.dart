import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entities/album.dart';

class AlbumRestAPI {
  String url = 'https://jsonplaceholder.typicode.com/albums';

  //lấy dữ liệu từ REST API
  Future<List<Album>> fetchAlbum() async {
    print('ba');
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    List<Album> albums ;
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      // print('body: $body');
      albums = body.map((dynamic album) => Album.fromJson(album)).toList();
      // for (var album in albums) {
      //   print(album);
      // }
      print('bốn');
      return albums;
    } else {
      print('không lấy được albums');
      throw Exception('Failed to load album');
    }
  }
}