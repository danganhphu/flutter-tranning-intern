import 'package:flutter/material.dart';
import 'poke_list.dart';

import '../api_pokedex/api_pokedex.dart';
import '../models/pokemon.dart';


class PokePage extends StatefulWidget {
  const PokePage({Key? key}) : super(key: key);
  final String title = "REST API poke Demo";
  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
  late Future<List<Pokemon>> pokemons;

  // @override
  // void initState() {
  //   super.initState();
  //   print('một');
  //   var albums = AlbumRestAPI().fetchAlbum();
  //   print('hai');
  //   // try {
  //   //   var albums = AlbumRestAPI().fetchAlbum();
  //   // }catch (err) {
  //   //
  //   // }
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    var pokeAPI = PokedexAPI();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //widget future
      body: FutureBuilder<List<Pokemon>>(
          future: pokeAPI.fetchPokemon(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            return snapshot.hasData ? PokeList(pokemons: snapshot.data) : const Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}



