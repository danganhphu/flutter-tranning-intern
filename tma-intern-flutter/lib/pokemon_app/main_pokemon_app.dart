import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterproject/pokemon_app/api_network/api.dart';
import 'package:flutterproject/pokemon_app/screens/screen.dart';

void main() => runApp(const PokemonFlutterApp());

class PokemonFlutterApp extends StatelessWidget {
  const PokemonFlutterApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApiPokemonProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokemonListPage(),
      ),
    );
  }
}