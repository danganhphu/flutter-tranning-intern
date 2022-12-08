import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  final int id, userId;
  final String title;

  const Album({required this.id, required this.userId, required this.title});

  //chuyển đổi dữ liệu json sang obj
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json["id"],
      userId: json["userId"],
      title: json["title"]
    );
  }


}