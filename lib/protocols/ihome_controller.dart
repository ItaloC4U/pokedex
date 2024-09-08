import 'package:pokedex/domain/entities/pokemon_entity.dart';

abstract class IHomeController {
  List<PokemonEntity> get pokemons;

  Future<void> fetchPokemons();
}
