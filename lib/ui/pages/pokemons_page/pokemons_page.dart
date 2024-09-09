import 'package:flutter/material.dart';
import 'package:pokedex/protocols/ipokemon_controller.dart';
import 'package:pokedex/ui/pages/pokemons_page/widgets/pokemons_grid_widget.dart';
import 'package:pokedex/ui/widgets/default_app_bar_widget.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({
    super.key,
    required this.pokemonController,
  });

  final IPokemonController pokemonController;

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  void initState() {
    super.initState();

    widget.pokemonController.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBarWidget(showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Pokemons Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<PokemonControllerState>(
                valueListenable: widget.pokemonController,
                builder: (context, value, child) => PokemonsGridWidget(
                  pokemons: value.pokemons,
                  isLoading: value.isLoading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
