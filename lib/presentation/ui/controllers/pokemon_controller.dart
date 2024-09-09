import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/domain/data/iget_pokemons_data.dart';
import 'package:pokedex/domain/data/ilog_data.dart';
import 'package:pokedex/presentation/protocols/ipokemon_controller.dart';
import 'package:pokedex/utils/toast_util.dart';

class AppError implements Exception {
  AppError(this.message);

  final String message;

  @override
  String toString() => message;
}

class PokemonController extends ValueNotifier<PokemonControllerState>
    implements IPokemonController {
  PokemonController({
    required this.logData,
    required this.toastUtil,
    required this.getPokemonsData,
  }) : super(PokemonControllerState.empty()) {
    fetchPokemons();
  }

  final ILogData logData;
  final IToastUtil toastUtil;
  final IGetPokemonsData getPokemonsData;

  @override
  Future<void> fetchPokemons() async {
    try {
      if (value.pokemons.isEmpty) value.copyWith(isLoading: true);

      final pokemons = await getPokemonsData.getPokemons();
      value = value.copyWith(pokemons: pokemons);
    } catch (error) {
      toastUtil.show(error.toString(), variant: ToastVariant.severe);
    } finally {
      if (value.pokemons.isEmpty) value.copyWith(isLoading: false);
    }
  }

  @override
  void handlePokemonTap(PokemonModel pokemon, BuildContext ctx) {
    try {
      if (pokemon.id == 4) throw Exception('ERRO DESCONHECIDO');
      ctx.push('/pokemons/${pokemon.id}', extra: pokemon);
    } catch (error) {
      toastUtil.show(error.toString(), variant: ToastVariant.severe);
      ctx.go('/pokemons');
      logData.logError(error.toString(), {});
    } finally {}
  }
}
