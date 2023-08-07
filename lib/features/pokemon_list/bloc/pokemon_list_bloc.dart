import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_list_events.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvents, PokemonListState> {
  PokemonListBloc() : super(PokemonListInitial()) {
    on<PokemonListEvents>((event, emit) {});
  }
}
