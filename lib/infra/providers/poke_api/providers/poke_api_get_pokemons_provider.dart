import 'package:pokedex/domain/data/iget_pokemons_data.dart';
import 'package:pokedex/infra/providers/poke_api/dtos/get_pokemons_dto.dart';
import 'package:pokedex/infra/providers/poke_api/dtos/pokemons_details_dto.dart';
import 'package:pokedex/infra/providers/poke_api/poke_base_api.dart';

class PokeApiGetPokemonsProvider extends PokeBaseApi
    implements IGetPokemonsData {
  @override
  Future<List<PokemonModel>> getPokemons() async {
    final pokemons = await http.get('/pokemon');

    if (pokemons.data == null) return [];

    final formatedPokemons = GetPokemonsDTO.fromJson(pokemons.data);
    final List<PokemonDetailsDTO> pokemonDetails = [];

    await Future.wait(
      formatedPokemons.results.map(
        (pokemon) async {
          final response = await http.get(pokemon.url);

          if (response.data != null) {
            pokemonDetails.add(PokemonDetailsDTO.fromJson(response.data));
          }
        },
      ),
    );

    pokemonDetails.sort((a, b) => a.id < b.id ? -1 : 1);
    return pokemonDetails.map((pokemon) => pokemon.toEntity()).toList();
  }
}
