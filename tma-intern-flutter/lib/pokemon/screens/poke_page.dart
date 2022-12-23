import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/pokemon_models.dart';
import '../screens/poke_list.dart';
import '../api/api.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonApi pokemonApi = PokemonApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokédex", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(icon: const Icon(Icons.stars), color: const Color(0XFFD8D8D8), onPressed: () {}),
          IconButton(icon: const Icon(Icons.check_circle), color: const Color(0XFFD8D8D8), onPressed: () {}),
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
        future: pokemonApi.getAllPokemon(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            return PokeList(pokemons: snapshot.data);
          } else {
            return Container(
              color: const Color(0XFF6D9886),
              child: const Center(
                child: SpinKitWave(
                  color: Colors.white,
                  size: 50,
                ),
              ),
            );
          }
        },
      ),
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