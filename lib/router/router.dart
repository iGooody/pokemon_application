import '../features/one_pokemon/view/one_pokemon_screen.dart';
import '../features/pokemon_list/view/pokemon_list_screen.dart';

final routes = {
  '/': (context) => const PokemonListScreen(title: "Pokemon App"),
  '/details': (context) => const PokemonDetailsScreen(),
};
