import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/one_pokemon_bloc.dart';

class PokemonDetailsWidget extends StatefulWidget {
  final String pokemonName;

  const PokemonDetailsWidget({required this.pokemonName, Key? key})
      : super(key: key);

  @override
  State<PokemonDetailsWidget> createState() => _PokemonDetailsWidgetState();
}

class _PokemonDetailsWidgetState extends State<PokemonDetailsWidget> {
  late final PokemonDetailsBloc _pokemonDetailsBloc;

  @override
  void initState() {
    super.initState();
    _pokemonDetailsBloc = PokemonDetailsBloc(Dio());
    _pokemonDetailsBloc.add(FetchPokemonDetails(widget.pokemonName));
  }

  @override
  void dispose() {
    _pokemonDetailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
      bloc: _pokemonDetailsBloc,
      builder: (context, state) {
        if (state is PokemonDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PokemonDetailsLoaded) {
          final pokemonDetails = state.pokemonDetails;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${pokemonDetails['name']}'),
                Image.network(pokemonDetails['sprites']['front_default']),
                Text(
                    'Types: ${pokemonDetails['types'].map((type) => type['type']['name']).join(', ')}'),
                Text('Weight: ${pokemonDetails['weight']} kg'),
                Text('Height: ${pokemonDetails['height']} cm'),
              ],
            ),
          );
        } else if (state is PokemonDetailsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('An error occurred'),
                ElevatedButton(
                  onPressed: () {
                    _pokemonDetailsBloc
                        .add(FetchPokemonDetails(widget.pokemonName));
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return Container(); // Handle other states if necessary
        }
      },
    );
  }
}
