import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  String? pokemonName;
  Map<String, dynamic>? pokemonDetails;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      print('You must provide args');
      return;
    }
    if (args is! String) {
      print('Args should have string value');
      return;
    }
    pokemonName = args;
    _fetchPokemonDetails();
    super.didChangeDependencies();
  }

  Future<void> _fetchPokemonDetails() async {
    final dio = Dio(); // Create a Dio instance
    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonName/');
      if (response.statusCode == 200) {
        final jsonBody = response.data as Map<String, dynamic>;
        setState(() {
          pokemonDetails = jsonBody;
        });
      } else {
        print('Failed to fetch Pokémon details');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemonName ?? "...")),
      body: Center(
        child: pokemonDetails != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${pokemonDetails!['name']}'),
                  Image.network(pokemonDetails!['sprites']['front_default']),
                  Text(
                      'Types: ${pokemonDetails!['types'].map((type) => type['type']['name']).join(', ')}'),
                  Text('Weight: ${pokemonDetails!['weight']} kg'),
                  Text('Height: ${pokemonDetails!['height']} cm'),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
