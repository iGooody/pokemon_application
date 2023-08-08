part of 'one_pokemon_bloc.dart';

abstract class PokemonDetailsEvent {}

class FetchPokemonDetails extends PokemonDetailsEvent {
  final String pokemonName;

  FetchPokemonDetails(this.pokemonName);
}
