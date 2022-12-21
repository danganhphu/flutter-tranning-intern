import 'package:flutter/material.dart';
import '../utils/string_extension.dart';

import '../models/pokemon.dart';

class PokeList extends StatelessWidget {
  List<Pokemon> pokemons;
  PokeList({Key? key, required this.pokemons,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final poke = pokemons[index];
          final Color textColor;
          if (poke.averageColor.computeLuminance() > 0.35) {
            textColor = Colors.black;
          } else {
            textColor = Colors.white;
          }
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: ListTile(
              tileColor: poke.averageColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              onTap: () {
              },
              title: Text(
                '${poke.idNumber} ${poke.name!.toTitleCase()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              subtitle: Row(
                children: const [
                  Text('type1'),
                  Text('type2'),
                ]
              ),
              trailing: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child:
                Image.network(poke.urlImage!),
              ),
            ),
          );
        }
    );
  }
}