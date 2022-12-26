import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/average_color.dart';
import '../models/pokemon.dart';

class PokemonApi {
  static const _BASE_URL = 'https://pokeapi.co/api/v2';
  String url = '${_BASE_URL}/pokemon?limit=30&offset=0';

  Future<List<Pokemon>> getAllPokemon() async {

    try {
      var urlApi = Uri.parse(url);
      final response = await http.get(urlApi);
      List<Pokemon> pokemons = [];

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        for (var item in json['results']) {
          if (item['url'] != null) {
            print(item['url']);
            final pokemon = await getPokemon(item['url']);
            final colors = await Future.wait(pokemons.map(
                    (Pokemon e) async => await getImagePalette(NetworkImage(e.urlImage!))
            ));

            for (Color i in colors) {
              pokemon.averageColor = i;
            }
            pokemons.add(pokemon);
          } else {
            print('Không có dữ liệu');
          }
        }
      } else {
        return Future.error("Opp, something went wrong");
      }

      return pokemons;
    } catch (error) {
      throw Exception(error.toString());
    }

  }


  Future<Pokemon> getPokemon(String url) async {
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        // print('body is: $body');
        return Pokemon.fromJson(body);
      } else {
        return Future.error('fail');
      }
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}