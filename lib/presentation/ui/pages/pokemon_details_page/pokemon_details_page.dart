import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pokedex/domain/data/iget_pokemons_data.dart';
import 'package:pokedex/presentation/ui/widgets/default_app_bar_widget.dart';
import 'package:pokedex/presentation/ui/widgets/pokemon_image_widget.dart';
import 'package:pokedex/presentation/ui/widgets/pokemon_types_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;

    return Scaffold(
      appBar: DefaultAppBarWidget(title: pokemon.name, showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.id,
                child: PokemonImageWidget(imageUrl: pokemon.imageUrl),
              ),
            ),
            const SizedBox(height: 8),
            PokemonTypesWidget(types: pokemon.types),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Height: ${pokemon.height}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Weight: ${pokemon.weight}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Abilities: ${pokemon.abilities.join(', ')}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
