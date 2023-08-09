import 'package:dio/dio.dart';
import 'package:pokemon_application/repositories/pokemon_list/pokemon_database.dart';
import 'package:pokemon_application/repositories/pokemon_list/pokemon_list.dart';

class PokemonListRepository {
  final Dio dio;
  final PokemonDatabase database;

  PokemonListRepository({
    required this.dio,
    required this.database,
  });

  Future<Object> getPokemonList() async {
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

      await PokemonDatabase.savePokemonList(dataList); // Cache the fetched data
      return dataList;
    } catch (e) {
      print('Error fetching Pokemon list: $e');
      return PokemonDatabase
          .getPokemonListFromDatabase(); // Return cached data on error
    }
  }
}
