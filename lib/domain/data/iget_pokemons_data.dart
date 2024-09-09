import 'package:flutter/material.dart';

abstract class IGetPokemonsData {
  Future<List<PokemonModel>> getPokemons();
}

class PokemonStatsModel {
  final int effort;
  final String name;
  final int? baseStat;

  PokemonStatsModel({
    required this.name,
    required this.effort,
    this.baseStat,
  });
}

class PokemonTypeModel {
  final String name;
  final Color color;

  PokemonTypeModel({
    required this.name,
    required this.color,
  });
}

class PokemonModel {
  final int id;
  final int height;
  final int weight;
  final String name;
  final String imageUrl;
  final List<String> moves;
  final List<String> abilities;
  final List<PokemonTypeModel> types;
  final List<PokemonStatsModel> stats;

  PokemonModel({
    required this.id,
    required this.name,
    required this.types,
    required this.stats,
    required this.moves,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.abilities,
  });
}
