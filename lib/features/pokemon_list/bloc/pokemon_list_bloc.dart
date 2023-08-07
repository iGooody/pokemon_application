import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_application/repositories/pokemon_list/abstract_pokemon_list_repository.dart';
import 'package:pokemon_application/repositories/pokemon_list/models/pokemon_list_model.dart';

part 'pokemon_list_events.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvents, PokemonListState> {
  PokemonListBloc(this.pokemonRepositorty) : super(PokemonListInitial()) {
    on<PokemonListEvents>((event, emit) async {
      try {
        final pokemonList = await pokemonRepositorty.getPokemonList();
        emit(PokemonListLoaded(pokemonList));
      } catch (exception) {
        emit(PokemonListLoadingFailure(exception: exception));
      }
    });
  }

  final AbstractPokemonRepositorty pokemonRepositorty;
}
