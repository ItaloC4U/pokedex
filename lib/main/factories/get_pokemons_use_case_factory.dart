import 'package:pokedex/domain/useCases/get_pokemons_use_case.dart';
import 'package:pokedex/infra/providers/poke_api/providers/poke_api_get_pokemons_provider.dart';

class GetPokemonsUseCaseFactory extends GetPokemonsUseCase {
  GetPokemonsUseCaseFactory()
      : super(
          getPokemonsData: PokeApiGetPokemonsProvider(),
        );
}
