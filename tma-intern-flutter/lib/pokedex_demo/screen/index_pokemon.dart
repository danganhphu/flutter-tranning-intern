import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'pokedex_list.dart';

import '../api_pokedex/api_pokedex.dart';
import '../models/pokemon.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  late Future<List<Pokemon>> pokemons;
  @override
  Widget build(BuildContext context) {
    var pokeAPI = PokedexAPI();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokédex", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(icon: const Icon(Icons.stars), onPressed: () {}),
          IconButton(icon: const Icon(Icons.check_circle), onPressed: () {}),
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
                  ]),
        ],
        backgroundColor: const Color(0xFF93B5C6),
        titleSpacing: 10,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF303841),
                        backgroundColor: const Color(0xFFDFD3D3),
                        shadowColor: Colors.greenAccent,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minimumSize: const Size(30, 30), //////// HERE
                      ),
                      onPressed: () {},
                      child: const Text(
                        'ALL GAME VERSIONS',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(height: 30, width: 1, color: Colors.black),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF303841),
                        backgroundColor: const Color(0xFFDFD3D3),
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minimumSize: const Size(30, 30),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'ALL GENS',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Container(height: 30, width: 1, color: Colors.black),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF303841),
                        backgroundColor: const Color(0xFFDFD3D3),
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minimumSize: const Size(30, 30),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'ALL TYPES',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ]),
            )),
      ),
      body: FutureBuilder<List<Pokemon>>(
          future: pokeAPI.fetchPokemon(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            return snapshot.hasData
                ? PokedexList(pokemons: snapshot.data)
                : const Center(child: CircularProgressIndicator());
          }),
      drawer: const Drawer(
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFA2B29F),
        child: SvgPicture.asset(
          'assets/icons/pokemon.svg',
        ),
      ),
    );
  }
}
