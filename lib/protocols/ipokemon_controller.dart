import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';

class PokemonControllerState {
  final bool isLoading;
  final List<PokemonEntity> pokemons;

  PokemonControllerState({
    required this.pokemons,
    required this.isLoading,
  });

  PokemonControllerState.empty({
    this.pokemons = const [],
    this.isLoading = false,
  });

  PokemonControllerState copyWith({
    List<PokemonEntity>? pokemons,
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
}
