import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_application/features/pokemon_list/bloc/pokemon_list_bloc.dart';
import '../../../repositories/pokemon_list/pokemon_list.dart';
import '../widgets/pokemon_list_tile.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key, required this.title});
  final String title;

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<PokemonList>? _pokemonsList;

  final _pokemonsListBloc = PokemonListBloc();

  @override
  void initState() {
    _loadPokemonList();
    super.initState();
    _pokemonsListBloc.add(LoadPokemonList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
            child: Text(widget.title),
          )),
      body: (_pokemonsList == null)
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              itemCount: _pokemonsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (contex, i) {
                final pokemon = _pokemonsList![i];
                final pokemonName = pokemon.name;
                final index = i;
                return PokemonListTile(
                  pokemonName: pokemonName,
                  index: index,
                );
              }, // This trailing comma makes auto-formatting nicer for build methods.
            ),
    );
  }

  Future<void> _loadPokemonList() async {
    _pokemonsList =
        await GetIt.I<AbstractPokemonRepositorty>().getPokemonList();
    setState(() {});
  }
}
