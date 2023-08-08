part of 'one_pokemon_bloc.dart';

abstract class PokemonDetailsState {}

class PokemonDetailsLoading extends PokemonDetailsState {}

class PokemonDetailsLoaded extends PokemonDetailsState {
  final Map<String, dynamic> pokemonDetails;

  PokemonDetailsLoaded(this.pokemonDetails);
}

class PokemonDetailsError extends PokemonDetailsState {}
