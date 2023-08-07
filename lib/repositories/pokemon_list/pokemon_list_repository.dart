import 'package:dio/dio.dart';
import 'pokemon_list.dart';

class PokemonListRepository implements AbstractPokemonRepositorty {
  PokemonListRepository({
    required this.dio,
  });
  final Dio dio;

  @override
  Future<List<PokemonList>> getPokemonList() async {
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon');
      final List<dynamic> results = response.data['results'];

      final dataList = results.map((pokemonData) {
        return PokemonList(
          name: pokemonData['name'],
          url: pokemonData['url'],
        );
      }).toList();
      return dataList;
    } catch (e) {
      // Handle any errors that may occur during the API call.
      print('Error fetching Pokemon list: $e');
      return []; // Return an empty list as a fallback or display an error message.
    }
  }
}
