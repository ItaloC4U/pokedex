// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:pokedex/domain/data/iget_pokemons_data.dart';

class PokemonMovesDTO {
  final String name;

  PokemonMovesDTO({required this.name});

  factory PokemonMovesDTO.fromJson(Map<String, dynamic> json) {
    return PokemonMovesDTO(
      name: json['move']['name'],
    );
  }
}

class PokemonStatsDTO {
  PokemonStatsDTO({
    required this.effort,
    required this.name,
    this.baseStat,
  });

  factory PokemonStatsDTO.fromJson(Map<String, dynamic> json) {
    return PokemonStatsDTO(
      effort: json['effort'],
      name: json['stat']['name'],
      baseStat: json['base_stat'],
    );
  }

  final int effort;
  final String name;
  final int? baseStat;
}

class PokemonAbilitiesDTO {
  PokemonAbilitiesDTO({required this.name});

  factory PokemonAbilitiesDTO.fromJson(Map<String, dynamic> json) {
    return PokemonAbilitiesDTO(name: json['ability']['name']);
  }

  final String name;
}

class PokemonTypesDTO {
  PokemonTypesDTO({
    required this.name,
    required this.color,
  });

  factory PokemonTypesDTO.fromJson(Map<String, dynamic> json) {
    return PokemonTypesDTO(
      name: json['type']['name'] ?? '',
      color: _getColorByType(json['type']['name']),
    );
  }

  static Color _getColorByType(String type) {
    switch (type) {
      case 'fire':
        return const Color(0xffEE8130);
      case 'water':
        return const Color(0xff6390F0);
      case 'electric':
        return const Color(0xffF7D02C);
      case 'grass':
        return const Color(0xff7AC74C);
      case 'ice':
        return const Color(0xff96D9D6);
      case 'fighting':
        return const Color(0xffC22E28);
      case 'poison':
        return const Color(0xffA33EA1);
      case 'ground':
        return const Color(0xffE2BF65);
      case 'flying':
        return const Color(0xffA98FF3);
      case 'psychic':
        return const Color(0xffF95587);
      case 'bug':
        return const Color(0xffA6B91A);
      case 'rock':
        return const Color(0xffB6A136);
      case 'ghost':
        return const Color(0xff735797);
      case 'dragon':
        return const Color(0xff6F35FC);
      case 'dark':
        return const Color(0xff705746);
      case 'steel':
        return const Color(0xffB7B7CE);
      case 'fairy':
        return const Color(0xffD685AD);

      case 'normal':
      default:
        return const Color(0xffA8A77A);
    }
  }

  final String name;
  final Color color;

  PokemonTypeModel toModel() {
    return PokemonTypeModel(
      name: name,
      color: color,
    );
  }
}

class PokemonDetailsDTO {
  PokemonDetailsDTO({
    required this.id,
    required this.name,
    required this.moves,
    required this.types,
    required this.stats,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.abilities,
  });

  factory PokemonDetailsDTO.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsDTO(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      imageUrl: json['sprites']['other']['dream_world']['front_default'] ??
          json['sprites']['frontDefault'],
      moves: ((json['moves'] ?? []) as List)
          .map(
            (move) => PokemonMovesDTO.fromJson(
              move as Map<String, dynamic>,
            ),
          )
          .toList(),
      types: ((json['types'] ?? []) as List)
          .map(
            (type) => PokemonTypesDTO.fromJson(
              type as Map<String, dynamic>,
            ),
          )
          .toList(),
      stats: ((json['stats'] ?? []) as List)
          .map(
            (stat) => PokemonStatsDTO.fromJson(
              stat as Map<String, dynamic>,
            ),
          )
          .toList(),
      abilities: ((json['abilities'] ?? []) as List)
          .map((ability) =>
              PokemonAbilitiesDTO.fromJson(ability as Map<String, dynamic>))
          .toList(),
    );
  }

  final int id;
  final int height;
  final int weight;
  final String name;
  final String imageUrl;
  final List<PokemonMovesDTO> moves;
  final List<PokemonTypesDTO> types;
  final List<PokemonStatsDTO> stats;
  final List<PokemonAbilitiesDTO> abilities;

  PokemonModel toEntity() {
    return PokemonModel(
      id: id,
      name: name,
      types: types.map((type) => type.toModel()).toList(),
      moves: moves.map((move) => move.name).toList(),
      height: height,
      weight: weight,
      imageUrl: imageUrl,
      abilities: abilities.map((ability) => ability.name).toList(),
      stats: stats
          .map(
            (stat) => PokemonStatsModel(
              name: stat.name,
              effort: stat.effort,
              baseStat: stat.baseStat,
            ),
          )
          .toList(),
    );
  }
}
