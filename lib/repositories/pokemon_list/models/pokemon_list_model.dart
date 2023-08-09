class PokemonList {
  final String name;
  final String url;

  PokemonList({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}
