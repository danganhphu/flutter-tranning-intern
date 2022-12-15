import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../screen/type.dart';
class PokeList extends StatelessWidget {
  List<Pokemon> pokemons;
  PokeList({Key? key, required this.pokemons,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          var poke = pokemons[index];
          return Card(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 10, left: 15, right: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(poke.id),
                              Text(poke.name),
                              const Icon(Icons.star),
                              const Icon(Icons.circle_outlined)
                            ],
                          ),
                          Row(
                            children:
                            poke.typeofpokemon.map((String e) => Expanded(child: TypeBadge(e))).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                    ),
                    child: Image.asset(
                      "assets/images/thumb1.png",
                      width: 50,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}