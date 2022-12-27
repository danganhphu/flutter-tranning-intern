import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:flutterproject/pokemon_app/api_network/api.dart';
import 'package:flutterproject/pokemon_app/widgets/widget.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late ScrollController _scrollController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ApiPokemonProvider apiProvider =
      Provider.of<ApiPokemonProvider>(context, listen: false);
      _scrollController = ScrollController();
      //const int offset = 0;
      _scrollController.addListener(() async {
        final ScrollPosition scrollPosition = _scrollController.position;
        if (!loading &&
            scrollPosition.maxScrollExtent == scrollPosition.pixels) {
          loading = true;
          await apiProvider.getPokemonList();
          loading = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ApiPokemonProvider apiProvider = Provider.of<ApiPokemonProvider>(context);
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
      body: apiProvider.displayedPokemon.isEmpty ? const Center(
        child: SpinKitDoubleBounce(
          color:  Color(0XFF6D9886),
          size: 70,
        ),
      ) : buildListView(apiProvider),
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

  ListView buildListView(ApiPokemonProvider apiProvider) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: apiProvider.displayedPokemon.length + 1,
      itemBuilder: (context, index) {
        final itemCount = apiProvider.displayedPokemon.length;
        if (index < itemCount) {
          final pokemon = apiProvider.displayedPokemon[index];
          return PokemonTile(index: index, pokemon: pokemon);
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: SpinKitChasingDots(
                  color: Color(0XFF579BB1),
                  size: 50
              ),
            ),
          );
        }
      },
    );
  }
}
