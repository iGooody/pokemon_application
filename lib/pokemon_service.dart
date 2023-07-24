import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonService {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemonList(int offset, int limit) async {
    final response = await http.get('$baseUrl?offset=$offset&limit=$limit');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
    } else {
      throw Exception('Failed to load Pokémon list');
    }
  }
}
