import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokedexAPI {

  String url = 'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  //lấy dữ liệu từ REST API
  Future<List<Pokemon>> fetchPokemon() async {
    final response = await http.get(Uri.parse(url));
    List<Pokemon> pokemons = [];
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print('body: $body');
     for (Map i in body) {
       pokemons.add(Pokemon.fromJson(i));
     }
      print('poke là: $pokemons');
      return pokemons;
    } else {
      print('không lấy được pokemons');
      throw Exception('Failed to load pokemons');
    }
  }

}