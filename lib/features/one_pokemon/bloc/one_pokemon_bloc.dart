import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'one_pokemon_events.dart';
part 'one_pokemon_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final Dio dio;

  PokemonDetailsBloc(this.dio) : super(PokemonDetailsLoading()) {
    on<FetchPokemonDetails>((event, emit) async {
      emit(PokemonDetailsLoading());

      try {
        final response = await dio
            .get('https://pokeapi.co/api/v2/pokemon/${event.pokemonName}/');
        if (response.statusCode == 200) {
          final jsonBody = response.data as Map<String, dynamic>;
          emit(PokemonDetailsLoaded(jsonBody));
        } else {
          emit(PokemonDetailsError());
        }
      } catch (error) {
        emit(PokemonDetailsError());
      }
    });
  }
}
