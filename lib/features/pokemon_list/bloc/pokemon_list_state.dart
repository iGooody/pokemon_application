part of 'pokemon_list_bloc.dart';

class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListLoaded extends PokemonListState {
  final List<PokemonList> pokemonList;

  PokemonListLoaded(this.pokemonList);
}

class PokemonListLoadingFailure extends PokemonListState {
  PokemonListLoadingFailure({
    this.exception,
  });
  final Object? exception;
}
