import 'package:flutter/material.dart';
import 'package:pokemon_application/repositories/pokemon_list/pokemon_list_repository.dart';
import '../../../repositories/models/pokemon_list_model.dart';
import '../../widgets/pokemon_list_tile.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key, required this.title});
  final String title;

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<PokemonList>? _pokemonsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
            child: Text(widget.title),
          )),
      body: (_pokemonsList == null)
          ? const SizedBox()
          : ListView.separated(
              itemCount: _pokemonsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (contex, i) {
                final pokemon = _pokemonsList![i];
                final pokemonName = pokemon.name;
                return PokemonListTile(pokemonName: pokemonName);
              },
              // This trailing comma makes auto-formatting nicer for build methods.
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.download),
          onPressed: () async {
            _pokemonsList = await PokemonListRepository().getPokemonList();
            setState(() {});
          }),
    );
  }
}
