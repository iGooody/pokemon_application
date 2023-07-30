// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'features/pokemon_list/view/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        dividerColor: Colors.black,
        listTileTheme: ListTileThemeData(iconColor: Colors.black),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontFamily: "Arial",
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      routes: {
        '/': (context) => PokemonListScreen(title: "Pokemon App"),
        '/details': (context) => PokemonDetailsScreen(),
      },
    );
  }
}

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  String? pokemonName;

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
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemonName ?? "...")),
    );
  }
}
