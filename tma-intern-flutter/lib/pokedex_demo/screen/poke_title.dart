import 'package:flutter/material.dart';
import 'type.dart';
import '../models/pokemon.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({Key? key, required this.index, required this.pokemon}): super(key: key);

  final int index;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {

    final String titleText = '${pokemon.id}       ${pokemon.name}';
    // final textColor = pokemon.averageColor.computeLuminance() > 0.35
    //     ? Colors.black
    //     : Colors.white;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ListTile(
        tileColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        onTap: () {
        },
        title: Text(
          titleText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Row(
          children:
          pokemon.typeofpokemon.map((String type) => Expanded(child: TypeBadge(type))).toList(),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child:
          Image.network(pokemon.imageurl),
        ),
      ),
    );
  }
}
