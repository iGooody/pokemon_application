import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_application/features/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_application/theme/theme.dart';
import '../../../repositories/pokemon_list/pokemon_list.dart';
import '../widgets/pokemon_list_tile.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key, required this.title});
  final String title;

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final _pokemonsListBloc = PokemonListBloc(
    GetIt.I<AbstractPokemonRepositorty>(),
  );

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
        ),
      ),
      body: BlocBuilder<PokemonListBloc, PokemonListState>(
        bloc: _pokemonsListBloc,
        builder: (context, state) {
          if (state is PokemonListLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              itemCount: state.pokemonList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (contex, i) {
                final pokemon = state.pokemonList[i];
                final pokemonName = pokemon.name;
                final index = i;
                return PokemonListTile(
                  pokemonName: pokemonName,
                  index: index,
                );
              },
            );
          } else if (state is PokemonListLoadingFailure) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'Something went wrong',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    'Please try again later',
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 18),
                  ),
                ],
              ),
            );
          } else if (state is PokemonListLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }

  Future<void> _loadPokemonList() async {
    setState(() {});
  }
}
