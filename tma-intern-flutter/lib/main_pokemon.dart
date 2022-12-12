import 'package:flutter/material.dart';
import 'package:flutterproject/pokemon/api_provider/api_pokemon.dart';
import 'package:flutterproject/pokemon/screens/index.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyAppPokemon());

class MyAppPokemon extends StatelessWidget {
  const MyAppPokemon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider(
      create: (context) => PokemonAPI(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokeListPage(),
      ),
    );
  }
}