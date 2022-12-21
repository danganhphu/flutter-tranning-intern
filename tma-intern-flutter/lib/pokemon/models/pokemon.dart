
import 'dart:ui';

class Pokemon {
  int? id;
  String? name;
  String? urlImage;
  List<String>? types;
  Color averageColor = Color(0XFFE26717);

  Pokemon({this.id, this.name, this.urlImage, this.types});

  String get idNumber => '#${id.toString().padLeft(3, '0')}';
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var types = <String>[];
    for (var item in json["types"]) {
      if (item["type"]?["name"] != null) {
        types.add(item["type"]?["name"]);
      }
    }

    return Pokemon(
      id: json["id"],
      name: json["name"],
      urlImage: json["sprites"]?["other"]?["official-artwork"]?["front_default"],
      types: types,
    );
  }
}
