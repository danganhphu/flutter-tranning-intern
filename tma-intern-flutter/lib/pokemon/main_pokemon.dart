import 'package:flutter/material.dart';
import 'package:flutterproject/pokemon/api/api_pokemon.dart';

import './screens/poke_list.dart';
import './models/pokemon.dart';

//test demo pokemon list
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo poke',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonApi pokemonApi = PokemonApi();
    return Scaffold(
      body: FutureBuilder<List<Pokemon>>(
        future: pokemonApi.getAllPokemon(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            return PokeList(pokemons: snapshot.data);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

