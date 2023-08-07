import 'package:pokemon_application/repositories/pokemon_list/models/pokemon_list_model.dart';

abstract class AbstractPokemonRepositorty {
  Future<List<PokemonList>> getPokemonList();
}
