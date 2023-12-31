import 'package:dio/dio.dart';
import 'package:pokemon_application/repositories/pokemon_list/pokemon_database.dart';

import 'abstract_pokemon_list_repository.dart';
import 'models/models.dart';

class PokemonListRepository implements AbstractPokemonRepositorty {
  final Dio dio;
  final PokemonDatabase database;

  PokemonListRepository({
    required this.dio,
    required this.database,
  });

  @override
  Future<List<PokemonList>> getPokemonList() async {
    try {
      final cachedList = await PokemonDatabase.getPokemonListFromDatabase();
      if (cachedList.isNotEmpty) {
        return cachedList;
      }

      final response = await dio.get('https://pokeapi.co/api/v2/pokemon');
      final List<dynamic> results = response.data['results'];

      final dataList = results.map((pokemonData) {
        return PokemonList(
          name: pokemonData['name'],
          url: pokemonData['url'],
        );
      }).toList();

      await PokemonDatabase.savePokemonList(dataList);
      return dataList;
    } catch (e) {
      print('Error fetching Pokemon list: $e');
      return PokemonDatabase.getPokemonListFromDatabase();
    }
  }
}
