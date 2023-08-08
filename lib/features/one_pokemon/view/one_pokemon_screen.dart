import 'package:flutter/material.dart';
import '../widgets/pokemon_details_widget.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! String) {
      // Handle invalid arguments
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Invalid arguments')),
      );
    }

    final pokemonName = args;
    return Scaffold(
      appBar: AppBar(title: Text(pokemonName)),
      body: PokemonDetailsWidget(pokemonName: pokemonName),
    );
  }
}
