import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterproject/pokemon/extension/extension_String.dart';
import 'package:provider/provider.dart';

import '../api_provider/api_pokemon.dart';
import '../models/pokemon.dart';
import 'Type.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {

  @override
  Widget build(BuildContext context) {
    PokemonAPI apiProvider = Provider.of<PokemonAPI>(context);
    Pokemon? pokemon = apiProvider.selectedPokemon;

    final List<String> types =
    pokemon!.types.map((Type e) => e.type.name.toUpperCase()).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokédex", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              icon: const Icon(Icons.stars),
              onPressed: () {
              }
          ),
          IconButton(
              icon: const Icon(Icons.check_circle),
              onPressed: () {
              }
          ),
          PopupMenuButton<String>(
              itemBuilder: (context) => [
                const PopupMenuItem<String>(
                  value: 'mark',
                  child: Text('Mark all'),
                ),
                const PopupMenuItem<String>(
                  value: 'reveal',
                  child: Text('Reveal all'),
                ),
                const PopupMenuItem<String>(
                  value: 'hide',
                  child: Text('Hide all'),
                ),
                const PopupMenuItem<String>(
                  value: 'settings',
                  child: Text('Settings all'),
                ),
              ]
          ),
        ],
        backgroundColor: const Color(0xFF93B5C6),
        titleSpacing: 10,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF303841), backgroundColor: const Color(0xFFDFD3D3),
                        shadowColor: Colors.greenAccent,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minimumSize: const Size(30, 30), //////// HERE
                      ),
                      onPressed: () {},
                      child: const Text('ALL GAME VERSIONS', style: TextStyle(fontSize: 13),),
                    ),
                    Container(
                        height: 30,
                        width: 1,
                        color: Colors.black
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF303841), backgroundColor: const Color(0xFFDFD3D3),
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        minimumSize: const Size(30, 30),
                      ),
                      onPressed: () {},
                      child: const Text('ALL GENS', style: TextStyle(fontSize: 13),),
                    ),
                    Container(
                        height: 30,
                        width: 1,
                        color: Colors.black

                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF303841), backgroundColor: const Color(0xFFDFD3D3),
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))
                        ,
                        minimumSize: const Size(30, 30),
                      ),
                      onPressed: () {},
                      child: const Text('ALL TYPES', style: TextStyle(fontSize: 13),),
                    ),
                  ]
              ),
            )
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: ListTile(
          tileColor: const Color.fromRGBO(255, 255, 255, 0.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemon.name.toTitleCase(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(pokemon.orderNumber),
            ],
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
            child: Image.network(
              pokemon.sprites.other.officialArtwork.frontDefault,
            ),
          ),
        ),
      ),


      drawer: const Drawer(
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: const Color(0xFFA2B29F),
        child: SvgPicture.asset(
          'assets/icons/pokemon.svg',
        ),
      ),
    );
  }
}


