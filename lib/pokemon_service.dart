// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Pokemon {
//   final String name;
//   final String url;

//   Pokemon({required this.name, required this.url});
// }

// class PokemonList extends StatefulWidget {
//   @override
//   _PokemonListState createState() => _PokemonListState();
// }

// class _PokemonListState extends State<PokemonList> {
//   List<Pokemon> _pokemonList = [];

//   Future<void> fetchPokemonData() async {
//     final Uri apiUrl =
//         Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=20');
//     final response = await http.get(apiUrl);

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final results = data['results'] as List;

//       setState(() {
//         _pokemonList = results
//             .map((pokemon) => Pokemon(
//                   name: pokemon['name'],
//                   url: pokemon['url'],
//                 ))
//             .toList();
//       });
//     } else {
//       // Handle error cases here
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchPokemonData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pokémon List'),
//       ),
//       body: ListView.builder(
//         itemCount: _pokemonList.length,
//         itemBuilder: (context, index) {
//           final pokemon = _pokemonList[index];
//           return ListTile(
//             title: Text(pokemon.name),
//             // You can add more information or widgets here as per your requirement
//           );
//         },
//       ),
//     );
//   }
// }

// void main() => runApp(MaterialApp(home: PokemonList()));
