import 'package:flutter/material.dart';
import 'package:flutterproject/pokemon/extension/extension_String.dart';

import '../models/pokemon.dart';


class PokemonListPage extends StatelessWidget {
  List<Pokemon> pokes;
  PokemonListPage({Key? key, required this.pokes,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pokes.length,
        itemBuilder: (context, index) {
          var poke = pokes[index];
          return Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: index % 2 == 0 ? const Color(0xFFDBE2EF) : const Color(0xFF62B6B7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    poke.name.toTitleCase(),
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}