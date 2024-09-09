import 'package:faker/faker.dart' as faker;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/utils/string_extensions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../domain/entities/pokemon_entity.dart';
import './pokemon_types_widget.dart';

class PokemonsGridWidget extends StatelessWidget {
  const PokemonsGridWidget({
    super.key,
    required this.pokemons,
    required this.isLoading,
  });

  final bool isLoading;
  final List<PokemonEntity> pokemons;

  @override
  Widget build(BuildContext context) {
    if (pokemons.isEmpty && !isLoading) {
      return const Center(
        child: Text('No pokemons found'),
      );
    }

    if (isLoading) {
      return Skeletonizer(
        child: _PokemonGrid(
          pokemons: List.generate(
            faker.faker.randomGenerator.integer(20),
            (index) => PokemonEntity(
              id: index,
              name: faker.faker.lorem.word(),
              height: faker.faker.randomGenerator.integer(100),
              weight: faker.faker.randomGenerator.integer(500),
              imageUrl: faker.faker.image.image(keywords: ['animals']),
              stats: List.generate(
                faker.faker.randomGenerator.integer(3),
                (_) => PokemonStats(
                  name: faker.faker.lorem.word(),
                  effort: faker.faker.randomGenerator.integer(3),
                  baseStat: faker.faker.randomGenerator.integer(3),
                ),
              ),
              abilities: List.generate(
                faker.faker.randomGenerator.integer(3),
                (_) => faker.faker.lorem.word(),
              ),
              moves: List.generate(
                faker.faker.randomGenerator.integer(5),
                (_) => faker.faker.lorem.word(),
              ),
              types: List.generate(
                faker.faker.randomGenerator.integer(3),
                (_) => faker.faker.lorem.word(),
              ),
            ),
          ),
        ),
      );
    }

    return _PokemonGrid(pokemons: pokemons);
  }
}

class _PokemonGrid extends StatelessWidget {
  const _PokemonGrid({required this.pokemons});

  final List<PokemonEntity> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: pokemons.length,
      itemBuilder: (_, index) {
        final pokemon = pokemons[index];
        final imageIsSvg = pokemon.imageUrl.endsWith('.svg');

        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                if (!imageIsSvg)
                  Image.network(
                    pokemon.imageUrl,
                    fit: BoxFit.scaleDown,
                    height: 100,
                  ),
                if (imageIsSvg)
                  SvgPicture.network(
                    pokemon.imageUrl,
                    fit: BoxFit.scaleDown,
                    height: 100,
                  ),
                const SizedBox(height: 16),
                Text(pokemon.name.capitalize()),
                PokemonTypesWidget(types: pokemon.types),
              ],
            ),
          ),
        );
      },
    );
  }
}
