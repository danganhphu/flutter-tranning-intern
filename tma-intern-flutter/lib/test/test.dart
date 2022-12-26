import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

void main() {
  getResultAPI();
}

void getResultAPI() async {
  const _BASE_URL = 'https://pokeapi.co/api/v2';
  var url = Uri.parse('${_BASE_URL}/pokemon');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    for (var item in json['results']) {
      if (item['url'] != null) {
        var pokemon = await getPokemon(item['url']);
        print("id: ${pokemon.id}, name: ${pokemon.name}, image: ${pokemon.image}");

      } else {
        print('Khoong co urr');
      }
    }
  } else {
    print('fail');
  }
}


Future<Pokemon> getPokemon(String url) async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    return Future.error('fail');
  }
}

class Pokemon {
  int? id;
  String? name;
  String? image;
  List<String>? types;

  Pokemon({this.id, this.name, this.image, this.types});

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
      image: json["sprites"]?["other"]?["official-artwork"]?["front_default"],
      types: types,
    );
  }
}