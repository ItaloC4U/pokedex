import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/main/builders/login_page_builder.dart';
import 'package:pokedex/ui/pages/pokemon_details_page/pokemon_details_page.dart';
import 'package:pokedex/ui/pages/pokemons_page/pokemons_page.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPageBuilder();
      },
    ),
    GoRoute(
      path: '/pokemons',
      builder: (BuildContext context, GoRouterState state) {
        return const PokemonsPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: ':id',
          builder: (BuildContext context, GoRouterState state) {
            return PokemonDetailsPage(id: state.pathParameters['id']);
          },
        ),
      ],
    ),
  ],
);
