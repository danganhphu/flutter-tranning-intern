import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutterproject/pokemon_app/models/pokemon_models.dart';
import 'package:flutterproject/pokemon_app/utils/utils.dart';

class ApiPokemonProvider with ChangeNotifier {
  static const _baseUrl = 'https://pokeapi.co/api/v2';

  String url = '${_baseUrl}/pokemon';
  List<Pokemon> displayedPokemon = [];
  bool fetching = false;
  int numLoad = 1;

  ApiPokemonProvider() {
    getPokemonList();
  }

  getPokemonList() async {
    try {
      fetching = true;
      notifyListeners();
      final response = await http.get(Uri.parse(url));
      //print(response.body);
      switch (response.statusCode) {
        case 200: {
          final pokemonResponse = pokemonListFromJson(response.body);
          url = pokemonResponse.next;

          final List<Pokemon> pokemon = await Future.wait(pokemonResponse.results
              .map((Result e) async => await getPokemon(e))
              .toList());

          final colors = await Future.wait(pokemon.map((Pokemon e) async =>
          await getImagePalette(
              NetworkImage(e.sprites.other.officialArtwork.frontDefault))));

          for (int i = 0; i < colors.length; i++) {
            pokemon[i].averageColor = colors[i];
          }

          displayedPokemon.addAll(pokemon);
        }
          break;
        default:
          print("Loi xay ra");
          break;
      }

    } catch (err) {
      throw Exception(err.toString());
    } finally {
      fetching = false;
      notifyListeners();
      print('lay du lieu lan: $numLoad');
      numLoad++;
    }
  }

  Future<Pokemon> getPokemon(Result pokeResult) async {
    try {
      final response = await http.get(Uri.parse(pokeResult.url));
      //print(response.body);
      if (response.statusCode == 200) {
        return pokemonFromJson(response.body);
      } else {
        return Future.error("Opp, co loi roi");
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}