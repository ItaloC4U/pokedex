import 'package:flutter/foundation.dart';
import 'package:pokedex/main/factories/get_pokemons_use_case_factory.dart';
import 'package:pokedex/protocols/ipokemon_controller.dart';
import 'package:pokedex/utils/toast_util.dart';

class PokemonController extends ValueNotifier<PokemonControllerState>
    implements IPokemonController {
  PokemonController({
    required this.toastUtil,
  }) : super(PokemonControllerState.empty()) {
    fetchPokemons();
  }

  final IToastUtil toastUtil;

  @override
  Future<void> fetchPokemons() async {
    try {
      if (value.pokemons.isEmpty) value.copyWith(isLoading: true);

      final pokemons = await GetPokemonsUseCaseFactory().execute(null);
      value = value.copyWith(pokemons: pokemons);
    } catch (error) {
      toastUtil.show(error.toString(), variant: ToastVariant.severe);
    } finally {
      if (value.pokemons.isEmpty) value.copyWith(isLoading: false);
    }
  }
}
