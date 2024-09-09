import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/domain/data/iget_pokemons_data.dart';
import 'package:pokedex/presentation/ui/pages/login_page/login_page.dart';
import 'package:pokedex/presentation/ui/pages/pokemon_details_page/pokemon_details_page.dart';
import 'package:pokedex/presentation/ui/pages/pokemons_page/pokemons_page.dart';
import 'package:pokedex/utils/inject_util.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage(userStore: Inject.get());
      },
    ),
    GoRoute(
      path: '/pokemons',
      builder: (BuildContext context, GoRouterState state) {
        return PokemonsPage(
          pokemonController: Inject.get(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: ':id',
          builder: (BuildContext context, GoRouterState state) {
            return PokemonDetailsPage(pokemon: state.extra as PokemonModel);
          },
        ),
      ],
    ),
  ],
);
