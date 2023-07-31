import 'package:flutter/material.dart';
import '../../widgets/pokemon_list_tile.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key, required this.title});
  final String title;

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Center(
              child: Text(widget.title),
            )),
        body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (contex, i) {
            const pokemonName = 'Pokemon';
            return const PokemonListTile(pokemonName: pokemonName);
          },
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
