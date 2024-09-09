class PokemonDTO {
  PokemonDTO({required this.url, required this.name});

  factory PokemonDTO.fromJson(Map<String, dynamic> json) {
    return PokemonDTO(
      url: json['url'],
      name: json['name'],
    );
  }

  final String url;
  final String name;
}

class GetPokemonsDTO {
  GetPokemonsDTO({required this.results});

  factory GetPokemonsDTO.fromJson(Map<String, dynamic> json) {
    return GetPokemonsDTO(
      results: ((json['results'] ?? []) as List)
          .map(
            (pokemon) => PokemonDTO.fromJson(
              pokemon as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  final List<PokemonDTO> results;
}
