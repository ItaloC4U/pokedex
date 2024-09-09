class PokemonStats {
  final int effort;
  final String name;
  final int? baseStat;

  PokemonStats({
    required this.name,
    required this.effort,
    this.baseStat,
  });
}

// Entidade pode ter responsabilidade, exemplo: update, calcular algo, etc
class PokemonEntity {
  final int id;
  final int height;
  final int weight;
  final String name;
  final String imageUrl;
  final List<String> moves;
  final List<String> types;
  final List<String> abilities;
  final List<PokemonStats> stats;

  PokemonEntity({
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
