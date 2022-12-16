import 'package:flutter/material.dart';
import 'poke_title.dart';
import '../models/pokemon.dart';

class PokedexList extends StatelessWidget {
  List<Pokemon> pokemons;
  PokedexList({Key? key, required this.pokemons,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          var poke = pokemons[index];
          return PokemonTile(index: index, pokemon: poke);
        }
    );
  }
}