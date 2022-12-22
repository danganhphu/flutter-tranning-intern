import 'package:flutter/material.dart';

import '../widgets/types.dart';
import '../utils/extensions.dart';
import '../models/pokemon_models.dart';

class PokeList extends StatelessWidget {
  List<Pokemon> pokemons;
  PokeList({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final poke = pokemons[index];
          final String titleText =
              '${poke.idNumber}    ${poke.name!.toTitleCase()}';
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: ListTile(
              contentPadding: const EdgeInsets.only(right: 0.0),
              tileColor: poke.averageColor.withOpacity(0.9),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              onTap: () {
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
                children: poke.types!.map((String e) => Expanded(child: TypeBadge(e))).toList()
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