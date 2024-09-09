import 'package:flutter/material.dart';
import 'package:pokedex/app_routes.dart';
import 'package:pokedex/domain/data/ilog_data.dart';
import 'package:pokedex/infra/providers/log/log_provider.dart';
import 'package:pokedex/infra/providers/poke_api/providers/poke_api_get_pokemons_provider.dart';
import 'package:pokedex/presentation/protocols/ipokemon_controller.dart';
import 'package:pokedex/presentation/protocols/iuser_store.dart';
import 'package:pokedex/presentation/services/stores/user_store.dart';
import 'package:pokedex/presentation/theme/theme.dart';
import 'package:pokedex/presentation/ui/controllers/pokemon_controller.dart';
import 'package:pokedex/utils/inject_util.dart';
import 'package:pokedex/utils/toast_util.dart';

void main() {
  Inject.registerSingleton<IToastUtil>(ToastUtil());
  Inject.registerSingleton<IUserStore>(UserStore());
  Inject.registerSingleton<ILogData>(LogProvider());
  Inject.registerSingleton<IPokemonController>(
    PokemonController(
      logData: Inject.get(),
      toastUtil: Inject.get(),
      getPokemonsData: PokeApiGetPokemonsProvider(),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: routes,
      builder: (BuildContext context, Widget? child) => Scaffold(
        key: ToastUtil.scaffoldGlobalKey,
        body: child,
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple.shade600,
        ),
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        scaffoldBackgroundColor: Colors.deepPurple.shade50,
        appBarTheme: const AppBarTheme(
          elevation: 2,
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(2),
            backgroundColor: WidgetStateProperty.all(
              Colors.deepPurple.shade600,
            ),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
