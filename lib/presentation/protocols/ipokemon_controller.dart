import 'package:flutter/material.dart';
import 'package:pokedex/domain/data/iget_pokemons_data.dart';

class PokemonControllerState {
  final bool isLoading;
  final List<PokemonModel> pokemons;

  PokemonControllerState({
    required this.pokemons,
    required this.isLoading,
  });

  PokemonControllerState.empty({
    this.pokemons = const [],
    this.isLoading = false,
  });

  PokemonControllerState copyWith({
    List<PokemonModel>? pokemons,
    bool? isLoading,
    String? error,
  }) {
    return PokemonControllerState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

abstract class IPokemonController
    extends ValueNotifier<PokemonControllerState> {
  IPokemonController() : super(PokemonControllerState.empty());

  Future<void> fetchPokemons();
  void handlePokemonTap(PokemonModel pokemon, BuildContext context);
}
