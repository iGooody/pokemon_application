import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonListTile extends StatelessWidget {
  const PokemonListTile({
    Key? key,
    required this.pokemonName,
    required this.index,
  }) : super(key: key);

  final String pokemonName;
  final int index; // Define int index variable here

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/pokeball_icon.svg',
        height: 40,
        width: 40,
      ),
      title: Text(
        ' ${index + 1}. $pokemonName', // Display the index before the name
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: pokemonName);
      },
    );
  }
}
