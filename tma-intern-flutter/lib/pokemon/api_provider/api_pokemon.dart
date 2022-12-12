import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon.dart';
import '../models/pokemon_list.dart';

class PokemonAPI extends ChangeNotifier {
  static const _baseURL = 'https://pokeapi.co/api/v2';

  String url = '$_baseURL/pokemon';
  List<Pokemon> displayedPokemon = [];
  Pokemon? selectedPokemon ;
  bool fetching = false;
  bool fetchingSpecie = false;
  bool fetchingTypes = false;

  PokemonAPI() {
    getPokemonList();
  }

  getPokemonList() async {
    try {
      fetching = true;
      notifyListeners();
      final response = await http.get(Uri.parse(url));
      final pokemonResponse = pokemonListFromJson(response.body);
      url = pokemonResponse.next;

      final List<Pokemon> pokemon = await Future.wait(pokemonResponse.results
          .map((Result e) async => await getPokemon(e))
          .toList());

      displayedPokemon.addAll(pokemon);
      pokemon.forEach((element) {
        print(element);
      });
    } catch (err) {
      throw Exception(err.toString());
    } finally {
      fetching = false;
      notifyListeners();
    }
  }

  Future<Pokemon> getPokemon(Result pokeResult) async {
    try {
      final response = await http.get(Uri.parse(url));
      return pokemonFromJson(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }


  setSelectedPokemon(int index) async {
    try {
      fetchingSpecie = true;
      notifyListeners();
      selectedPokemon = displayedPokemon[index];
      notifyListeners();
    } catch (err) {
      throw Exception(err.toString());
    } finally {
      fetchingSpecie = false;
      notifyListeners();
    }
  }
}
