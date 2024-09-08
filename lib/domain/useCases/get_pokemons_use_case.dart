import 'package:pokedex/core/iuse_case.dart';
import 'package:pokedex/domain/data/iget_pokemons_data.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';

class GetPokemonsUseCase
    implements IUseCase<Null, Future<List<PokemonEntity>>> {
  GetPokemonsUseCase({
    required this.getPokemonsData,
  });

  final IGetPokemonsData getPokemonsData;

  @override
  Future<List<PokemonEntity>> execute(Null params) async {
    // Pode ter regra de negócio

    return await getPokemonsData.getPokemons();
  }
}
