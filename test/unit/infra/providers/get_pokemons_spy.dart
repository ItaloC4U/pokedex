import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/domain/data/iget_pokemons_data.dart';

class GetPokemonsSpy extends Mock implements IGetPokemonsData {
  int count = 0;
  Exception? error;

  List<PokemonModel> defaultResponse = List.generate(
    faker.randomGenerator.integer(20),
    (index) => PokemonModel(
      id: index,
      name: faker.lorem.word(),
      height: faker.randomGenerator.integer(100),
      weight: faker.randomGenerator.integer(500),
      imageUrl: faker.image.image(keywords: ['animals']),
      stats: List.generate(
        faker.randomGenerator.integer(3),
        (_) => PokemonStatsModel(
          name: faker.lorem.word(),
          effort: faker.randomGenerator.integer(3),
          baseStat: faker.randomGenerator.integer(3),
        ),
      ),
      abilities: List.generate(
        faker.randomGenerator.integer(3),
        (_) => faker.lorem.word(),
      ),
      moves: List.generate(
        faker.randomGenerator.integer(5),
        (_) => faker.lorem.word(),
      ),
      types: List.generate(
        faker.randomGenerator.integer(3),
        (_) => PokemonTypeModel(
          name: faker.lorem.word(),
          color: Colors.red,
        ),
      ),
    ),
  );

  @override
  Future<List<PokemonModel>> getPokemons() async {
    count++;
    if (error != null) throw error!;

    return defaultResponse;
  }
}
