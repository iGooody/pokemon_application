import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key, required this.title});
  final String title;

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Center(
              child: Text(widget.title),
            )),
        body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (contex, i) {
            const pokemonName = 'Pokemon';
            return ListTile(
              leading: SvgPicture.asset(
                'assets/svg/pokeball_icon.svg',
                height: 40,
                width: 40,
              ),
              title: Text(
                ' ${i + 1}. $pokemonName',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/details', arguments: pokemonName);
              },
            );
          },
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
