import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonListTile extends StatelessWidget {
  const PokemonListTile({
    super.key,
    required this.pokemonName,
  });

  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/pokeball_icon.svg',
        height: 40,
        width: 40,
      ),
      title: Text(
        ' ${1}. $pokemonName',
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: pokemonName);
      },
    );
  }
}
