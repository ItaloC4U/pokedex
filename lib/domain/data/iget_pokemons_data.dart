import 'package:pokedex/domain/entities/pokemon_entity.dart';

abstract class IGetPokemonsData {
  Future<List<PokemonEntity>> getPokemons();
}
