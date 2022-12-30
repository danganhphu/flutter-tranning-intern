import 'package:flutter/material.dart';

import 'package:flutterproject/pokemon_app/models/pokemon_models.dart';
import 'package:flutterproject/pokemon_app/utils/utils.dart';
import 'types.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({Key? key, required this.index, required this.pokemon}) : super(key: key);

  final int index;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {

    final String titleText =
        '${pokemon.idNumber}     ${pokemon.name.toTitleCase()}';
    final List<String> types =
    pokemon.types.map((Type e) => e.type.name.toUpperCase()).toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 0.0),
        tileColor: pokemon.averageColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        onTap: () {
          print(pokemon.name);
        },
        title: Container(
          margin: const EdgeInsets.fromLTRB(8.0, 0, 11.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF393E46),
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.star),
                  SizedBox(width: 10),
                  Icon(Icons.circle_outlined)
                ],
              ),
            ],
          ),
        ),
        subtitle: Row(
          children:
          types.map((String e) => Expanded(child: TypeBadge(e))).toList(),
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
          Image.network(pokemon.sprites.other.officialArtwork.frontDefault, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
