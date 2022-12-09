import 'package:flutter/material.dart';
import 'package:flutterproject/pokemon_list/screens/index.dart';

void main() => runApp(const MyAppPokemon());

class MyAppPokemon extends StatelessWidget {
  const MyAppPokemon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PokeListPage(),
    );
  }
}