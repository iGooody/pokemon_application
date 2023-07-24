import 'package:flutter/material.dart';
import 'pokemon_model.dart';
import 'pokemon_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PokemonListPage(),
    );
  }
}

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonService _pokemonService = PokemonService();
  List<Pokemon> _pokemonList = [];
  int _offset = 0;
  int _limit = 20;

  @override
  void initState() {
    super.initState();
    _fetchPokemonList();
  }

  Future<void> _fetchPokemonList() async {
    try {
      final List<Pokemon> pokemonList =
          await _pokemonService.fetchPokemonList(_offset, _limit);
      setState(() {
        _pokemonList.addAll(pokemonList);
      });
    } catch (e) {
      // Handle the error here
    }
  }

  Future<void> _loadMorePokemon() async {
    _offset += _limit;
    await _fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon List'),
      ),
      body: ListView.builder(
        itemCount: _pokemonList.length + 1,
        itemBuilder: (context, index) {
          if (index == _pokemonList.length) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: _loadMorePokemon,
                  child: Text('Load More'),
                ),
              ),
            );
          } else {
            final pokemon = _pokemonList[index];
            return ListTile(
              title: Text(pokemon.name),
            );
          }
        },
      ),
    );
  }
}
