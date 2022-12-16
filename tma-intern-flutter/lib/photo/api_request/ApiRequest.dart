import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutterproject/photo/model/Photo.dart';

class ApiRequest {
  Future<List<Photo>> getPhoto() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      List<Photo> photos;
      var list = json.decode(response.body) as List;
      photos = list.map((item) => Photo.fromJson(item)).toList();
      return photos;
    } else {
      throw Exception('Failed to load photo');
    }
  }
}