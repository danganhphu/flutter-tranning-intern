import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  int? id, userId;
  String? title;

  Album({this.id, this.userId, this.title});

  //chuyển đổi dữ liệu json sang obj
  factory Album.fromJson(Map<String, dynamic> data) {
    return Album(
      id: data["id"],
      userId: data["userId"],
      title: data["title"]
    );
  }

  //lấy dữ liệu từ REST API
  Future<List<Album>> getData() async {
    const url = 'https://jsonplaceholder.typicode.com/albums';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final albums = json.map((album) {
        return Album(
          id: album['id'],
          userId: album['userId'],
          title: album['title']
        );
      }).toList();
      return albums;
    }
    throw Exception('Fail');
  }

}