import 'package:pokedex/domain/entities/pokemon_entity.dart';

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
  final String name;

  PokemonTypesDTO({required this.name});

  factory PokemonTypesDTO.fromJson(Map<String, dynamic> json) {
    return PokemonTypesDTO(
      name: json['type']['name'],
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

  PokemonEntity toEntity() {
    return PokemonEntity(
      id: id,
      name: name,
      types: types.map((type) => type.name).toList(),
      moves: moves.map((move) => move.name).toList(),
      height: height,
      weight: weight,
      imageUrl: imageUrl,
      abilities: abilities.map((ability) => ability.name).toList(),
      stats: stats
          .map(
            (stat) => PokemonStats(
              name: stat.name,
              effort: stat.effort,
              baseStat: stat.baseStat,
            ),
          )
          .toList(),
    );
  }
}


//  "abilities": [
//         {
//             "ability": {
//                 "name": "overgrow",
//                 "url": "https://pokeapi.co/api/v2/ability/65/"
//             },
//             "is_hidden": false,
//             "slot": 1
//         },
//         {
//             "ability": {
//                 "name": "chlorophyll",
//                 "url": "https://pokeapi.co/api/v2/ability/34/"
//             },
//             "is_hidden": true,
//             "slot": 3
//         }
//     ],


  //   "types": [
  //       {
  //           "slot": 1,
  //           "type": {
  //               "name": "grass",
  //               "url": "https://pokeapi.co/api/v2/type/12/"
  //           }
  //       },
  //       {
  //           "slot": 2,
  //           "type": {
  //               "name": "poison",
  //               "url": "https://pokeapi.co/api/v2/type/4/"
  //           }
  //       }
  //   ],


  // "height": 7,
  // "name": "bulbasaur",
  //  "stats": [
  //       {
  //           "base_stat": 65,
  //           "effort": 0,
  //           "stat": {
  //               "name": "special-defense",
  //               "url": "https://pokeapi.co/api/v2/stat/5/"
  //           }
  //       },
  //       {
  //           "base_stat": 45,
  //           "effort": 0,
  //           "stat": {
  //               "name": "speed",
  //               "url": "https://pokeapi.co/api/v2/stat/6/"
  //           }
  //       }
  //   ],

  //   "weight": 69
  
  // "sprites": {
  //       "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",

  //  "dream_world": {
  //               "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
  //               "front_female": null
  //           },

  //   "moves": [
  //       {
  //           "move": {
  //               "name": "razor-wind",
  //               "url": "https://pokeapi.co/api/v2/move/13/"
  //           },
  //       },
