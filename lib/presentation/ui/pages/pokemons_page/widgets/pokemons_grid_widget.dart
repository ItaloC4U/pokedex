import 'package:faker/faker.dart' as faker;
import 'package:flutter/material.dart';
import 'package:pokedex/domain/data/iget_pokemons_data.dart';
import 'package:pokedex/presentation/ui/widgets/pokemon_image_widget.dart';
import 'package:pokedex/utils/string_extensions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../widgets/pokemon_types_widget.dart';

class PokemonsGridWidget extends StatelessWidget {
  const PokemonsGridWidget({
    super.key,
    required this.onTap,
    required this.pokemons,
    required this.isLoading,
  });

  final bool isLoading;
  final List<PokemonModel> pokemons;
  final Function(PokemonModel) onTap;

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
          onTap: (_) {},
          pokemons: List.generate(
            faker.faker.randomGenerator.integer(20),
            (index) => PokemonModel(
              id: index,
              name: faker.faker.lorem.word(),
              height: faker.faker.randomGenerator.integer(100),
              weight: faker.faker.randomGenerator.integer(500),
              imageUrl: faker.faker.image.image(keywords: ['animals']),
              stats: List.generate(
                faker.faker.randomGenerator.integer(3),
                (_) => PokemonStatsModel(
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
                (_) => PokemonTypeModel(
                  name: faker.faker.lorem.word(),
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return _PokemonGrid(pokemons: pokemons, onTap: onTap);
  }
}

class _PokemonGrid extends StatelessWidget {
  const _PokemonGrid({
    required this.onTap,
    required this.pokemons,
  });

  final List<PokemonModel> pokemons;
  final Function(PokemonModel) onTap;

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

        return InkWell(
          onTap: () => onTap(pokemon),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: pokemon.id,
                    child: PokemonImageWidget(imageUrl: pokemon.imageUrl),
                  ),
                  const SizedBox(height: 16),
                  Text(pokemon.name.capitalize()),
                  PokemonTypesWidget(types: pokemon.types),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
